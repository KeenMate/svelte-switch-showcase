# Claude Learning Notes - Svelte Switch Showcase

## Project Overview
Created a comprehensive showcase website for @keenmate/svelte-switch component library using @keenmate/svelte-docs for consistent layout and documentation structure.

## Key Technical Learnings

### Svelte 5 Patterns
- **Runes**: Used `$state()`, `$derived()`, `$bindable()` for reactive state management
- **Snippets**: Extensively used template snippets (`children`, `thumbTemplate`, `labelTemplate`) for component customization
- **Two-way binding**: `bind:checked` for Switch, `bind:selectedIndex` for MultiSwitch

### Component Library Integration
- **@keenmate/svelte-docs**: Used for consistent layout with `DocLayout`, `ShowcaseSection`, `CodeBlock`, `FeatureCard`
- **@keenmate/svelte-switch**: Switch and MultiSwitch components with extensive customization options
- **Bootstrap 5**: For responsive design and styling

### Critical Issues & Solutions

#### 1. Template Snippet Safety
**Problem**: Undefined property errors when accessing object properties in templates
```javascript
// ❌ Causes errors
{item.name}

// ✅ Safe with null safety
{item?.name || ''}
```

#### 2. Label Positioning & Spacing
**Problem**: All switch labels are absolutely positioned and don't reserve layout space
**Solution**: Always add container padding for label positions:
- Top labels: `padding-top: 3rem`
- Bottom labels: `padding-bottom: 2.5rem`
- Left labels: `padding-left: 5rem`
- Right labels: `padding-right: 6-8rem`

#### 3. Custom Template Content Sizing
**Problem**: Custom content in templates (thumbTemplate, children) overflowing component boundaries
**Solutions**:
- Remove excessive padding (`p-2` → proper flex centering)
- Use appropriate font sizes for small spaces
- Add margins to keep content within bounds
- Use `h-100 w-100` with flex centering for proper fit

#### 4. Object Display in Labels
**Problem**: `[object Object]` showing instead of proper content when using objects as items
**Solution**: Always provide `labelTemplate` when using object arrays with `shouldDisplayLabels={true}`

### Docker & Deployment
- **Multi-stage build**: Node.js for building, nginx for serving static files
- **SvelteKit static adapter**: Generates static files for nginx
- **Nginx configuration**: Proper routing, caching, compression, and security headers
- **CSP headers**: Content Security Policy allowing Plausible analytics from external domain

### Package Management
- **npm link/unlink**: For local development with linked packages
- **Version pinning**: Using specific published versions (v1.3.0) for production

### Analytics Integration
- **Plausible**: Added to `app.html` with domain-specific tracking
- **CSP compliance**: Updated nginx config to allow external analytics scripts

## Best Practices Discovered

### Component Demo Structure
1. Always use three-column layout: Demo | Code | Description
2. Provide live interactive examples
3. Include state indicators to show component behavior
4. Add proper spacing for absolutely positioned elements

### Template Development
1. Always use null safety operators (`?.`) in templates
2. Test with different data types (strings, objects, nulls)
3. Provide fallback values for all displayed properties
4. Keep custom content compact and appropriately sized

### Documentation Structure
1. Start with overview and basic usage
2. Progress from simple to complex examples
3. Include comprehensive API reference
4. Provide copy-pasteable code examples
5. Document SCSS variables and CSS custom properties

### Error Prevention
1. Read files before editing to understand context
2. Use proper TypeScript types for component props
3. Test edge cases (empty arrays, missing properties)
4. Validate component size constraints for custom content

## Commands to Remember
```bash
# Package management
npm link @package-name          # Link local package
npm unlink @package-name        # Unlink local package
npm install @package@version    # Install specific version

# Docker deployment
docker build -t app-name .      # Build static app with nginx
docker run -p 80:80 app-name    # Run on port 80

# Development
npm run dev                     # Development server
npm run build                   # Static build
```

## Project Structure Insights
- Use SvelteKit with `adapter-static` for documentation sites
- Organize examples by complexity: basic → multi → labels → styling → advanced
- Separate API documentation from examples
- Include comprehensive prop tables and type definitions
- Always provide working interactive demos alongside code examples