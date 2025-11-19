import type { LayoutServerLoad } from './$types';
import type { PartialDocsConfig } from '@keenmate/svelte-docs';
import { mergeConfig, defaultConfig, generateSSRStyles } from '@keenmate/svelte-docs';

export const load: LayoutServerLoad = async () => {
	const config: PartialDocsConfig = {
		site: {
			title: 'Svelte Switch Showcase',
			description: 'Complete showcase and documentation for @keenmate/svelte-switch component library',
			keywords: ['svelte', 'sveltekit', 'switch', 'toggle', 'components', 'showcase', 'keenmate'],
			author: 'KeenMate',
			url: 'https://svelte-switch.keenmate.com',
			language: 'en'
		},
		company: {
			name: 'KeenMate',
			website: 'https://keenmate.com',
			social: {
				github: 'https://github.com/keenmate/svelte-switch'
			}
		},
		navigation: {
			main: [
				{ label: 'Home', href: '/', icon: '🏠' },
				{ label: 'Getting Started', href: '/getting-started', icon: '🚀' },
				{
					label: 'Examples',
					href: '/examples/basic',
					icon: '🎯',
					children: [
						{ label: 'Basic Switch', href: '/examples/basic' },
						{ label: 'Multi Switch', href: '/examples/multi' },
						{ label: 'Labels', href: '/examples/labels' },
						{ label: 'Styling', href: '/examples/styling' },
						{ label: 'Advanced', href: '/examples/advanced' }
					]
				},
				{
					label: 'API Reference',
					href: '/api/switch',
					icon: '📚',
					children: [
						{ label: 'Switch', href: '/api/switch' },
						{ label: 'MultiSwitch', href: '/api/multiswitch' }
					]
				}
			]
		},
		features: {
			search: false,
			breadcrumbs: true,
			tableOfContents: true
		}
	};

	// Merge with defaults on the server side
	const mergedConfig = mergeConfig(defaultConfig, config);

	// Generate SSR styles for immediate rendering (prevents FOUC)
	const ssrStyles = generateSSRStyles(mergedConfig);

	return {
		config: mergedConfig,
		ssrStyles
	};
};
