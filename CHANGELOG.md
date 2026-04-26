# Changelog

All notable changes to the Svelte Switch Showcase project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-04-26

Major release tracking `@keenmate/svelte-switch` v2.0.0 and `@keenmate/svelte-docs` v1.0.0-rc11. The showcase has been rewritten end-to-end against both new APIs.

### Dependencies
- **`@keenmate/svelte-switch`** `^1.4.0` → `^2.0.0`
- **`@keenmate/svelte-docs`** `^1.0.0-rc05` → `^1.0.0-rc11`
- **`@sveltejs/kit`** `^2.22.0` → `^2.58.0`
- **`@sveltejs/vite-plugin-svelte`** `^6.0.0` → `^6.2.1`
- **`svelte`** `^5.0.0` → `^5.55.5`
- **`svelte-check`** `^4.0.0` → `^4.4.6`
- **`vite`** `^7.0.4` → `^7.3.2`
- **`sass`** `^1.93.0` → `^1.99.0`
- **`typescript`** `^5.0.0` → `^5.9.3`
- **`@sveltejs/adapter-static`** `^3.0.9` → `^3.0.10`

### Security
- Added npm `overrides` block resolving 9 vulnerabilities (1 low, 2 moderate, 6 high) reported by `npm audit`:
  - `cookie: ^1.0.2` (transitive via `@sveltejs/kit`)
  - `uuid: ^14.0.0`
  - `picomatch: ^4.0.3`
  - `postcss: ^8.5.10`
  - `rollup: ^4.60.2`
- `npm audit` now reports **0 vulnerabilities**.

### Added
- **`/examples/theming` page** — full `--base-*` cascade walkthrough with 8 theme presets (Default / Dark / Neon / Audi Sport / Rounded Pink / Sharp Brutalist / Material / Glassmorphism), per-instance `--sw-*` override examples, and the unitless coefficient × `--sw-rem` sizing convention.
- **`/examples/sizes` page** — named sizes table (`xs` / `sm` / `md` / `lg` / `xl` aligned to pure-admin form heights 31/33/35/38/41px), numeric size demos, and pure-admin integration recipe (`--sw-rem: 1rem`).
- **`/examples/+page.svelte`** and **`/api/+page.svelte`** index redirects matching the `web-multiselect-showcase` pattern.
- **`XY##` section codes** on every `ShowcaseSection` (BS / MS / LB / ST / TH / SZ / AD), matching the multiselect showcase convention. Sequential numbering within each page.
- **Vanilla JS recipe** in `/getting-started` showing `mount() + $state` (replaces removed `update()` instance method).
- **`vite.config.ts`** with `define` block exposing `__VERSION__` / `__PACKAGE_NAME__` / `__AUTHOR__` / `__LICENSE__` / `__HOMEPAGE__` / `__REPOSITORY__` constants — workaround for `@keenmate/svelte-switch@2.0.0` shipping `dist/index.js` with unsubstituted placeholders.

### Changed
- **`@keenmate/svelte-docs` API migration** — every page updated:
  - `demoColumnTitle` / `controlsColumnTitle` / `descriptionColumnTitle` → `col1Title` / `col2Title` / `col3Title`
  - Removed unsupported `demoColumnHeight` and `className` props
  - `columnCountType={2}` adopted for two-column sections
- **`@keenmate/svelte-switch` v2.0 API migration** — every example updated:
  - `Switch.children` snippet → `thumb`
  - `MultiSwitch.children` snippet split into `thumb` (one render in moving thumb) + `segment` (one per step background)
  - `thumbTemplate` → merged into `thumb`
  - `labelTemplate` → `label`
  - Snippet context unified: `currentIndex` → `index`, `currentItem` → `item`, `itemsCount` dropped from thumb context
  - `disableThumbRender` removed (no longer needed; just don't pass `thumb`)
  - `update()` instance method removed (Svelte 5 props are reactive)
  - Generic over item type `<T>` — `Switch.items: readonly [T, T] | null`, `MultiSwitch.items: readonly T[] | null`
  - Default `size` `50` (numeric, ≈32px) → `'md'` (named, 35px) — pure-admin aligned
- **Layout navigation** updated to include `/examples/theming` and `/examples/sizes`. `prerender = true` and `ssr = true` enabled in `+layout.server.ts`.
- **Page rewrites** — every showcase page rewritten to use the new svelte-docs API and v2.0 svelte-switch features:
  - **Home** — new feature cards highlighting v2.0 (theming layer, named sizes, generics, accessible per-step buttons)
  - **`/getting-started`** — vanilla JS section, theming pointer
  - **`/examples/basic`** — added "BS03 Named Sizes" section, all examples updated to v2.0 syntax
  - **`/examples/multi`** — Working with Custom Objects rewritten with `thumb` + `label` snippets and `T | undefined` typing
  - **`/examples/labels`** — full `labelTemplate` → `label` rename, defaults to `labelRenderMode="block"`
  - **`/examples/styling`** — fake `--switch-*` CSS section replaced with real `--sw-*` / `--base-*`, points at the dedicated Theming page for app-wide theming
  - **`/examples/advanced`** — full snippet rewrite with separate `thumb`, `segment`, `label` examples, plus a Combined example using all four customization points (thumb + segment + label + itemStyles); AD02 demonstrates the v1.x parity pattern (pair `thumb` and `segment` with the same content; dim active segment to avoid double-rendering under the thumb)
  - **`/api/switch`** and **`/api/multiswitch`** — full v2.0 prop tables, removed-in-2.0 callouts, snippet split documentation, generic type signatures, theming pointer

### Fixed
- **`labelCallback` examples** — added `?.` optional-chaining on `item` to satisfy `T | undefined` strict typing.
- **Code blocks containing `<script>` tags** — escaped as `<\/script>` inside template literals so Svelte's HTML tokenizer doesn't break out of the JS expression context (was producing cascading parse errors).
- **Code-vs-demo cross-validation** — every page's code example now matches what the live demo actually renders. Stale 1.x snippet names purged from all code samples.

### Removed
- Legacy `vite.config.js` (replaced by `vite.config.ts`).
- Stale 1.x patterns: `disableThumbRender`, `update()`, `--switch-*` CSS variables, `currentIndex` / `currentItem` snippet context, `labelTemplate`, `thumbTemplate`.

### Verification
- `svelte-check`: 0 errors, 0 warnings, 0 files with problems
- `npm audit`: 0 vulnerabilities
- All 12 routes return HTTP 200; SSR clean (Sass deprecation warnings from upstream Bootstrap/svelte-docs only).

## [Unreleased]

### Added
- **Label Content Features Showcase (v1.4.0+)**
  - Added comprehensive demos for `labelMember` property
  - Added demonstrations of `labelCallback` function usage
  - Added clickable labels showcase for vertical mode
  - Added label priority system comparison demos
  - Created new "Label Content Features" section in labels example

- **Label Render Mode Showcase**
  - Added demos comparing `labelRenderMode="absolute"` vs `labelRenderMode="block"`
  - Created visual comparisons showing automatic spacing benefits
  - Added examples for both horizontal and vertical orientations

- **API Documentation Enhancements**
  - Added version columns to all API property tables
  - Color-coded version badges (blue=1.0.0+, green=1.3.0+, yellow=1.4.0+, cyan=1.2.0+)
  - Added new v1.4.0+ properties to MultiSwitch API:
    - `labelRenderMode` - Label rendering mode
    - `labelMember` - Property extraction from objects
    - `labelCallback` - Custom label generation function
  - Enhanced documentation with clickable labels information
  - Updated both Switch and MultiSwitch API references

### Changed
- **Demo Container Improvements**
  - Fixed Y-scrollbar issues in demo containers
  - Added explicit `demoColumnHeight` props to large demo sections
  - Optimized container sizing for better content flow

- **Spacing and Layout Optimizations**
  - Reduced excessive padding throughout the application
  - Changed `gap-5` to `gap-4` and `gap-3` for better visual hierarchy
  - Updated margins from `mt-5`/`mb-4` to `mt-3`/`mb-3`
  - Removed unnecessary `py-4` classes per design guidelines

- **Code Quality Improvements**
  - Removed redundant "Selected:" state indicators where labels already show selection
  - Enhanced null safety in template examples
  - Updated component examples to use latest v1.4.0+ features

### Fixed
- **Demo Container Styling**
  - Overridden restrictive `max-width`/`max-height` constraints from `@keenmate/svelte-docs`
  - Fixed overflow issues in demo containers
  - Added CSS overrides in `app.scss` to ensure proper content display

- **Label Documentation**
  - Updated label positioning guidance to include new `labelRenderMode="block"` option
  - Fixed examples that showed `[object Object]` instead of proper content
  - Enhanced object handling examples with proper extraction methods

### Documentation
- **CLAUDE.md Updates**
  - Added comprehensive v1.4.0+ label features documentation
  - Updated critical issues & solutions with new approaches
  - Added implementation patterns for new label features
  - Enhanced best practices with latest guidelines

- **API Reference Improvements**
  - Complete version tracking across all components
  - Enhanced examples showcasing latest features
  - Added migration guidance for new label features
  - Improved code examples with real-world use cases

### Technical Debt
- **Styling System**
  - Established consistent spacing guidelines
  - Created reusable demo container patterns
  - Improved component showcase structure
  - Enhanced responsive design consistency

## [Previous Releases]

### v1.0.0 - Initial Release
- Basic Switch and MultiSwitch component showcases
- Initial API documentation
- Docker deployment setup
- Analytics integration with Plausible
- Bootstrap 5 integration
- SvelteKit static site generation