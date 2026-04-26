import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import switchPkg from '@keenmate/svelte-switch/package.json' with { type: 'json' };

// @keenmate/svelte-switch v2.0.0 ships dist/index.js with unsubstituted
// __VERSION__ / __PACKAGE_NAME__ / __AUTHOR__ / __LICENSE__ / __HOMEPAGE__ /
// __REPOSITORY__ build-time constants — define them here so the consumer
// build resolves them. Remove once a fixed svelte-switch is published.
export default defineConfig({
	plugins: [sveltekit()],
	define: {
		__VERSION__: JSON.stringify(switchPkg.version),
		__PACKAGE_NAME__: JSON.stringify(switchPkg.name),
		__AUTHOR__: JSON.stringify(
			typeof switchPkg.author === 'string'
				? switchPkg.author
				: ((switchPkg.author as { name?: string } | undefined)?.name ?? '')
		),
		__LICENSE__: JSON.stringify(switchPkg.license || ''),
		__HOMEPAGE__: JSON.stringify(switchPkg.homepage || ''),
		__REPOSITORY__: JSON.stringify(
			typeof switchPkg.repository === 'string'
				? switchPkg.repository
				: (switchPkg.repository?.url || '')
		)
	}
});
