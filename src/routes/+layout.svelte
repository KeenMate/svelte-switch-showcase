<script lang="ts">
	import { ConfigProvider } from '@keenmate/svelte-docs';
	import type { PartialDocsConfig } from '@keenmate/svelte-docs';
	import '../app.scss';

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
			search: true,
			breadcrumbs: true,
			tableOfContents: true
		}
	};
</script>

<ConfigProvider configData={config}>
	{#snippet children()}
		<slot />
	{/snippet}
</ConfigProvider>