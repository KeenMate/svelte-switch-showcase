<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	type StepStyle = { backgroundColor?: string; thumbColor?: string; thumbBorderColor?: string };
	type Theme = {
		id: string;
		class: string;
		name: string;
		description: string;
		items: string[];
		itemStyles: StepStyle[];
	};

	const themes: Theme[] = [
		{
			id: 'default',
			class: '',
			name: 'Default',
			description: 'Hardcoded fallbacks — no --base-* set. Multi has no itemStyles.',
			items: ['Small', 'Medium', 'Large'],
			itemStyles: []
		},
		{
			id: 'dark',
			class: 'dark-theme',
			name: 'Dark',
			description: 'Dark surfaces, blue accent. Multi steps follow blue intensity.',
			items: ['Low', 'Med', 'High'],
			itemStyles: [
				{ backgroundColor: '#3a3a3a', thumbColor: '#cbd5ff', thumbBorderColor: '#667eea' },
				{ backgroundColor: '#3949ab', thumbColor: '#e8eaf6', thumbBorderColor: '#5c6bc0' },
				{ backgroundColor: '#667eea', thumbColor: '#ffffff', thumbBorderColor: '#1a237e' }
			]
		},
		{
			id: 'neon',
			class: 'neon-theme',
			name: 'Neon / Cyberpunk',
			description: 'Magenta + cyan on near-black. Multi steps cycle the palette.',
			items: ['Off', 'Pulse', 'Strobe'],
			itemStyles: [
				{ backgroundColor: '#1a0a1a', thumbColor: '#00ffff', thumbBorderColor: '#00aaaa' },
				{ backgroundColor: '#660066', thumbColor: '#00ffff', thumbBorderColor: '#ff00ff' },
				{ backgroundColor: '#ff00ff', thumbColor: '#00ffff', thumbBorderColor: '#ffffff' }
			]
		},
		{
			id: 'audi',
			class: 'audi-theme',
			name: 'Audi Sport',
			description: 'Brand red on light gray. Multi steps escalate from eco to dynamic.',
			items: ['Eco', 'Comfort', 'Dynamic'],
			itemStyles: [
				{ backgroundColor: '#e8f5e9', thumbColor: '#ffffff', thumbBorderColor: '#bbbbbb' },
				{ backgroundColor: '#f5f5f5', thumbColor: '#ffffff', thumbBorderColor: '#bbbbbb' },
				{ backgroundColor: '#bb0a30', thumbColor: '#ffffff', thumbBorderColor: '#7a071f' }
			]
		},
		{
			id: 'rounded',
			class: 'rounded-theme',
			name: 'Rounded Pink',
			description: 'Pillow corners, soft pink palette. Multi steps walk pink shades.',
			items: ['Soft', 'Cozy', 'Hugs'],
			itemStyles: [
				{ backgroundColor: '#fff5f0', thumbColor: '#ffd6e3', thumbBorderColor: '#f8bbd0' },
				{ backgroundColor: '#ffd6e3', thumbColor: '#ff6b9d', thumbBorderColor: '#ff4081' },
				{ backgroundColor: '#ff6b9d', thumbColor: '#ffffff', thumbBorderColor: '#c2185b' }
			]
		},
		{
			id: 'sharp',
			class: 'sharp-theme',
			name: 'Sharp Brutalist',
			description: 'Pure black/white, no shadows, zero radius. Multi steps invert.',
			items: ['Mute', 'Soft', 'Loud'],
			itemStyles: [
				{ backgroundColor: '#ffffff', thumbColor: '#ffffff', thumbBorderColor: '#000000' },
				{ backgroundColor: '#888888', thumbColor: '#ffffff', thumbBorderColor: '#000000' },
				{ backgroundColor: '#000000', thumbColor: '#ffffff', thumbBorderColor: '#000000' }
			]
		},
		{
			id: 'material',
			class: 'material-theme',
			name: 'Material',
			description: 'Google Material Design blues. Multi steps escalate elevation.',
			items: ['100', '300', '500'],
			itemStyles: [
				{ backgroundColor: '#bbdefb', thumbColor: '#ffffff', thumbBorderColor: '#90caf9' },
				{ backgroundColor: '#64b5f6', thumbColor: '#ffffff', thumbBorderColor: '#42a5f5' },
				{ backgroundColor: '#1976d2', thumbColor: '#ffffff', thumbBorderColor: '#0d47a1' }
			]
		},
		{
			id: 'glass',
			class: 'glass-theme',
			name: 'Glassmorphism',
			description: 'Translucent surfaces over a gradient. Multi steps stack opacity.',
			items: ['Mist', 'Veil', 'Pane'],
			itemStyles: [
				{ backgroundColor: 'rgba(255,255,255,0.15)', thumbColor: '#ffffff', thumbBorderColor: 'rgba(255,255,255,0.4)' },
				{ backgroundColor: 'rgba(255,255,255,0.3)',  thumbColor: '#ffffff', thumbBorderColor: 'rgba(255,255,255,0.6)' },
				{ backgroundColor: 'rgba(255,255,255,0.55)', thumbColor: '#667eea', thumbBorderColor: '#ffffff' }
			]
		}
	];

	const swStates = $state(themes.map(() => ({ checked: false, multi: 1 })));
</script>

<DocLayout
	titleText="Theming"
	descriptionText="Cross-library --base-* cascade and per-instance --sw-* overrides (v2.0+)">

	<div class="py-4">
		<!-- How it works -->
		<ShowcaseSection
			titleText="TH01 How it works"
			subtitleText="--base-* on a parent → every nested switch picks it up"
			col1Title="Theme block"
			col2Title="What happens"
			columnCountType={2}>

			{#snippet demoContent()}
				<CodeBlock
					codeContent={`/* Set on any parent or :root */
.my-theme {
  --base-accent-color: #8b5cf6;
  --base-primary-bg: #1f2937;        /* off-state surface */
  --base-input-bg: #f9fafb;          /* thumb */
  --base-border-color: #4b5563;
  --base-border-radius-sm: 1.2;      /* coefficient × --sw-rem (default 10px) → 12px */
  --base-text-color-3: #9ca3af;      /* inactive label */
  --base-text-color-1: #f9fafb;      /* active label */
}`}
					languageType="css"
					titleText="--base-* theme"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<div class="prose">
					<p>
						Component-level <code>--sw-*</code> variables resolve through
						<code>var(--base-*, fallback)</code>. Same convention as
						<code>@keenmate/web-multiselect</code> and
						<code>@keenmate/web-daterangepicker</code> — themes generated by
						<code>@keenmate/theme-designer</code> work out of the box.
					</p>
					<p>
						Resolution order at every property:
						<strong><code>itemStyles</code> data → <code>--sw-*</code> →
						<code>--base-*</code> → fallback.</strong>
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Theme presets -->
		<div class="mt-5">
			<h2>Theme presets</h2>
			<p class="text-muted">
				Same components, different <code>--base-*</code> values on each theme container.
				Presets ported from <code>@keenmate/web-multiselect</code>'s theming examples.
			</p>

			<div class="theme-grid">
				{#each themes as theme, i}
					<section class="theme-card {theme.class}">
						<h3>{theme.name}</h3>
						<p class="theme-description">{theme.description}</p>
						<div class="demo-row">
							<Switch bind:checked={swStates[i].checked} size={60} />
							<MultiSwitch
								bind:selectedIndex={swStates[i].multi}
								items={theme.items}
								itemStyles={theme.itemStyles.length ? theme.itemStyles : undefined}
								size={60}
								shouldDisplayLabels={true}
								labelPosition="bottom"
								labelRenderMode="block"
							/>
						</div>
					</section>
				{/each}
			</div>
		</div>

		<!-- Per-instance overrides -->
		<ShowcaseSection
			titleText="TH02 Per-instance overrides via --sw-*"
			subtitleText="Skip --base-* and target component-level variables when you want one-off styling"
			col1Title="Code"
			col2Title="Variable list"
			columnCountType={2}>

			{#snippet demoContent()}
				<CodeBlock
					codeContent={`<!-- Override a single switch's accent and corner radius -->
<Switch
  size={80}
  style="--sw-accent-color: #f43f5e; --sw-border-radius: 999px"
/>

<!-- Override the focus ring colour -->
<Switch
  bind:checked={value}
  style="--sw-focus-color: orange; --sw-focus-ring: 0 0 0 3px orange;"
/>

<!-- Disable bg-on accent flip and stay neutral -->
<Switch
  bind:checked={value}
  style="--sw-bg-on: var(--sw-bg-off);"
/>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<div class="prose">
					<p>
						The full catalogue of <code>--base-*</code> and <code>--sw-*</code> variables
						the library consumes ships at the package root as
						<code>component-variables.manifest.json</code>.
					</p>
					<h5>Common overrides</h5>
					<ul>
						<li><code>--sw-bg-off</code> — Off-state surface</li>
						<li><code>--sw-bg-on</code> — On-state surface (default: accent)</li>
						<li><code>--sw-thumb-bg</code> — Thumb fill</li>
						<li><code>--sw-thumb-border-color</code> — Thumb border</li>
						<li><code>--sw-step-bg</code> / <code>--sw-step-bg-active</code> — Step segments</li>
						<li><code>--sw-focus-color</code> / <code>--sw-focus-ring</code> — Focus ring</li>
						<li><code>--sw-border-radius</code> / <code>--sw-shadow</code> — Corners and shadow</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Sizing convention -->
		<ShowcaseSection
			titleText="TH03 Sizing convention (coefficient × --sw-rem)"
			subtitleText="Radius and font-size variables are unitless multipliers"
			col1Title="Recipe"
			col2Title="Why?"
			columnCountType={2}>

			{#snippet demoContent()}
				<CodeBlock
					codeContent={`/* --sw-rem multiplies coefficient-based variables */
:root {
  --sw-rem: 10px;                    /* default — literal px */
  --base-border-radius-sm: 0.4;      /* → 4px */
  --base-font-size-sm: 1.6;          /* → 16px */
}

/* For pure-admin: align with html { font-size: 10px } baseline */
:root {
  --sw-rem: 1rem;                    /* now everything scales with user font size */
}

/* Pillow corners */
.my-theme {
  --base-border-radius-sm: 2.4;      /* → 24px */
}`}
					languageType="css"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<div class="prose">
					<p>
						Following the multiselect / daterangepicker / pure-admin convention,
						<code>--sw-rem</code> is the multiplier for coefficient-based variables.
						Default <code>10px</code> matches pure-admin's <code>html &#123; font-size: 10px &#125;</code>
						baseline.
					</p>
					<p>
						Set <code>--sw-rem: 1rem</code> at the root in pure-admin apps so switches
						scale with the user's font-size preference.
					</p>
					<p>See the <a href="/examples/sizes">Sizes</a> page for the named-size table.</p>
				</div>
			{/snippet}
		</ShowcaseSection>
	</div>
</DocLayout>

<style>
	.theme-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(360px, 1fr));
		gap: 1.5rem;
		margin-top: 1.5rem;
		margin-bottom: 2rem;
	}

	.theme-card {
		padding: 1.5rem;
		border-radius: 0.5rem;
		border: 1px solid var(--bs-border-color);
	}

	.theme-card h3 {
		margin: 0 0 0.5rem 0;
		font-size: 1.1rem;
	}

	.theme-description {
		font-size: 0.875rem;
		opacity: 0.85;
		margin-bottom: 1.25rem;
	}

	.demo-row {
		display: flex;
		gap: 1.5rem;
		align-items: center;
		justify-content: center;
		min-height: 120px;
	}

	/* Theme presets — ported from @keenmate/web-multiselect / svelte-switch */

	.dark-theme {
		background: #1a1a1a;
		--base-accent-color: #667eea;
		--base-text-color-1: #e5e5e5;
		--base-text-color-3: #808080;
		--base-border-color: #404040;
		--base-input-bg: #2a2a2a;
		--base-primary-bg: #3a3a3a;
		--sw-step-bg: rgba(255, 255, 255, 0.06);
		--sw-step-bg-active: rgba(255, 255, 255, 0.12);
	}
	.dark-theme h3,
	.dark-theme p {
		color: #e5e5e5;
	}

	.neon-theme {
		background: #0a0a0a;
		position: relative;
		overflow: hidden;
		--base-accent-color: #ff00ff;
		--base-text-color-1: #00ffff;
		--base-text-color-3: rgba(0, 255, 255, 0.6);
		--base-border-color: #ff00ff;
		--base-input-bg: #1a0a1a;
		--base-primary-bg: rgba(255, 0, 255, 0.3);
		--sw-thumb-bg: #00ffff;
		--sw-thumb-border-color: #ff00ff;
		--sw-step-bg: rgba(0, 255, 255, 0.12);
		--sw-step-bg-active: rgba(0, 255, 255, 0.22);
	}
	.neon-theme::before {
		content: '';
		position: absolute;
		inset: 0;
		background: linear-gradient(45deg, rgba(255, 0, 255, 0.1), rgba(0, 255, 255, 0.1));
		pointer-events: none;
	}
	.neon-theme h3,
	.neon-theme p {
		color: #00ffff;
		text-shadow: 0 0 10px rgba(0, 255, 255, 0.5);
		position: relative;
	}
	.neon-theme .demo-row {
		position: relative;
	}

	.audi-theme {
		background: #ffffff;
		--base-text-color-1: #333333;
		--base-text-color-3: #666666;
		--base-border-color: #d0d0d0;
		--base-primary-bg: #f5f5f5;
		--base-accent-color: #bb0a30;
		--base-border-radius-sm: 0.2;
	}
	.audi-theme h3 {
		color: #bb0a30;
		font-weight: 700;
		letter-spacing: 0.05em;
	}

	.rounded-theme {
		background: #fff5f0;
		--base-text-color-1: #5a3e36;
		--base-text-color-3: #b08070;
		--base-border-color: #f0d0c0;
		--base-primary-bg: #ffe5dc;
		--base-accent-color: #ff6b9d;
		--base-border-radius-sm: 2.4;
	}
	.rounded-theme h3,
	.rounded-theme p {
		color: #5a3e36;
	}

	.sharp-theme {
		background: #ffffff;
		border: 2px solid #000000 !important;
		--base-text-color-1: #000000;
		--base-text-color-3: #555555;
		--base-border-color: #000000;
		--base-primary-bg: #f0f0f0;
		--base-accent-color: #000000;
		--base-border-radius-sm: 0;
		--base-shadow-sm: none;
		--sw-thumb-border-color: #000000;
	}
	.sharp-theme h3 {
		color: #000;
		text-transform: uppercase;
		letter-spacing: 0.1em;
	}

	.material-theme {
		background: #ffffff;
		--base-text-color-1: #212121;
		--base-text-color-3: #757575;
		--base-border-color: #e0e0e0;
		--base-primary-bg: #f5f5f5;
		--base-accent-color: #1976d2;
		--base-border-radius-sm: 0.4;
	}

	.glass-theme {
		background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
		position: relative;
		overflow: hidden;
		--base-accent-color: #ffffff;
		--base-text-color-1: #ffffff;
		--base-text-color-3: rgba(255, 255, 255, 0.7);
		--base-border-color: rgba(255, 255, 255, 0.3);
		--base-input-bg: rgba(255, 255, 255, 0.15);
		--base-primary-bg: rgba(255, 255, 255, 0.25);
		--base-border-radius-sm: 1.2;
		--sw-step-bg: rgba(255, 255, 255, 0.15);
		--sw-step-bg-active: rgba(255, 255, 255, 0.3);
	}
	.glass-theme::before {
		content: '';
		position: absolute;
		inset: 0;
		backdrop-filter: blur(10px);
		pointer-events: none;
	}
	.glass-theme h3,
	.glass-theme p {
		color: #ffffff;
		position: relative;
	}
	.glass-theme .demo-row {
		position: relative;
	}
</style>
