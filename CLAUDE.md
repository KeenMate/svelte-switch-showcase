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

#### 2. Label Positioning & Spacing (Updated in v1.4.0)
**Problem**: All switch labels are absolutely positioned and don't reserve layout space
**Solutions**:
- **Option 1 (New)**: Use `labelRenderMode="block"` for automatic spacing
- **Option 2 (Legacy)**: Use `labelRenderMode="absolute"` with manual padding:
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

#### 4. Object Display in Labels (Enhanced in v1.4.0)
**Problem**: `[object Object]` showing instead of proper content when using objects as items
**Solutions** (in priority order):
1. **labelMember**: Extract specific property - `labelMember="name"` reads `item.name`
2. **labelCallback**: Custom function - `(item, index) => \`\${item.name} - \${item.price}\``
3. **labelTemplate**: Full custom rendering control with HTML/Svelte content
4. **Default fallback**: "Option 1", "Option 2", etc.

### Docker & Deployment
- **Multi-stage build**: Node.js for building, nginx for serving static files
- **SvelteKit static adapter**: Generates static files for nginx
- **Nginx configuration**: Proper routing, caching, compression, and security headers
- **CSP headers**: Content Security Policy allowing Plausible analytics from external domain

### Package Management
- **npm link/unlink**: For local development with linked packages
- **Version pinning**: Using specific published versions (v1.4.0+) for production
- **Breaking changes**: Always test showcase with new versions before updating

### Analytics Integration
- **Plausible**: Added to `app.html` with domain-specific tracking
- **CSP compliance**: Updated nginx config to allow external analytics scripts

### Label System Evolution (v1.4.0+)
#### New Properties
- **labelRenderMode**: `"absolute"` (default) vs `"block"` for automatic spacing
- **labelMember**: Extract labels from object properties (`labelMember="name"`)
- **labelCallback**: Custom label generation function with item and index access
- **Clickable Labels**: Interactive labels in vertical mode (left/right positions)

#### Implementation Patterns
```svelte
<!-- Simple property extraction -->
<MultiSwitch items={products} labelMember="name" shouldDisplayLabels={true} />

<!-- Custom formatted labels -->
<MultiSwitch
  items={plans}
  labelCallback={(item, index) => `${item.tier} - $${item.price}/mo`}
  shouldDisplayLabels={true} />

<!-- Block mode for automatic spacing -->
<MultiSwitch
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  labelPosition="bottom" />

<!-- Clickable navigation in vertical mode -->
<MultiSwitch
  items={servers}
  labelMember="city"
  shouldDisplayLabels={true}
  labelPosition="right"
  orientation="vertical"
  labelRenderMode="block" />
```

#### Demo Container Optimization
- **Issue**: `@keenmate/svelte-docs` applies restrictive sizing to `.demo-container`
- **Solution**: Override in `app.scss` with `!important` declarations
```scss
.showcase-section .demo-container {
  max-width: none !important;
  max-height: none !important;
  overflow: visible !important;
}
```

## Best Practices Discovered

### Component Demo Structure
1. Always use three-column layout: Demo | Code | Description
2. Provide live interactive examples
3. Include state indicators to show component behavior
4. Use `demoColumnHeight` prop when content exceeds default container size
5. Remove redundant state display when labels already show selection
6. Avoid excessive `py-4`, `py-5`, `my-4`, `my-5` classes unless necessary for hierarchy

### Template Development
1. Always use null safety operators (`?.`) in templates
2. Test with different data types (strings, objects, nulls)
3. Provide fallback values for all displayed properties
4. Keep custom content compact and appropriately sized

### Documentation Structure
1. Start with overview and basic usage
2. Progress from simple to complex examples
3. Include comprehensive API reference with version information
4. Provide copy-pasteable code examples
5. Document SCSS variables and CSS custom properties
6. Use color-coded version badges in API tables (blue=1.0.0+, green=1.3.0+, yellow=1.4.0+, cyan=1.2.0+)

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