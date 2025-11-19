<script lang="ts">
	import { ConfigProvider } from '@keenmate/svelte-docs';
	import type { LayoutData } from './$types';
	import type { Snippet } from 'svelte';
	import '../app.scss';

	let { data, children }: { data: LayoutData; children: Snippet } = $props();
</script>

<svelte:head>
	<!-- SSR Theme Styles to prevent FOUC -->
	<style>{@html data.ssrStyles}</style>
	<!-- Set theme data attribute immediately -->
	<script>
		document.documentElement.setAttribute('data-theme', 'docs');
	</script>
</svelte:head>

<ConfigProvider ssrConfig={data.config}>
	{@render children()}
</ConfigProvider>