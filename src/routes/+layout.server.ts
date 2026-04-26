import type { LayoutServerLoad } from './$types';
import type { PartialDocsConfig } from '@keenmate/svelte-docs';
import { mergeConfig, defaultConfig, generateSSRStyles } from '@keenmate/svelte-docs';

export const prerender = true;
export const ssr = true;

export const load: LayoutServerLoad = async () => {
	const config: PartialDocsConfig = {
		site: {
			title: 'Svelte Switch Showcase',
			description: 'Showcase and documentation for @keenmate/svelte-switch — Svelte 5 binary and multi-step switch components',
			keywords: ['svelte', 'sveltekit', 'switch', 'toggle', 'multiswitch', 'components', 'showcase', 'keenmate'],
			author: 'KeenMate',
			url: 'https://svelte-switch.keenmate.com',
			language: 'en'
		},
		company: {
			name: 'KeenMate',
			website: 'https://keenmate.com?utm_source=svelte-switch-showcase',
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
						{ label: 'Theming', href: '/examples/theming' },
						{ label: 'Sizes', href: '/examples/sizes' },
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

	const mergedConfig = mergeConfig(defaultConfig, config);
	const ssrStyles = generateSSRStyles(mergedConfig);

	return {
		config: mergedConfig,
		ssrStyles
	};
};
