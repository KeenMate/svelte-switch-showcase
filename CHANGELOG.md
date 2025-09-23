# Changelog

All notable changes to the Svelte Switch Showcase project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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