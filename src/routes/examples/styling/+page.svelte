<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	let basicStyledSwitch = $state(false);
	let customColorSwitch = $state(true);
	let gradientSwitch = $state(false);
	let themedSwitches = $state([false, true, false, false]);
	let styledMultiSwitch = $state(1);
	let customMultiSwitch = $state(2);

	const redTheme = {
		backgroundColor: '#ffebee',
		thumbColor: '#f44336',
		thumbBorderColor: '#d32f2f'
	};

	const greenTheme = {
		backgroundColor: '#e8f5e8',
		thumbColor: '#4caf50',
		thumbBorderColor: '#388e3c'
	};

	const blueTheme = {
		backgroundColor: '#e3f2fd',
		thumbColor: '#2196f3',
		thumbBorderColor: '#1976d2'
	};

	const purpleTheme = {
		backgroundColor: '#f3e5f5',
		thumbColor: '#9c27b0',
		thumbBorderColor: '#7b1fa2'
	};

	const multiSwitchStyles = [
		{ backgroundColor: '#ffebee', thumbColor: '#f44336', thumbBorderColor: '#d32f2f' },
		{ backgroundColor: '#fff3e0', thumbColor: '#ff9800', thumbBorderColor: '#f57c00' },
		{ backgroundColor: '#e8f5e8', thumbColor: '#4caf50', thumbBorderColor: '#388e3c' },
		{ backgroundColor: '#e3f2fd', thumbColor: '#2196f3', thumbBorderColor: '#1976d2' }
	];

	const priorityLevels = ['Low', 'Medium', 'High', 'Critical'];
	const powerModes = ['Eco', 'Normal', 'Sport', 'Race'];

	const toggleThemeSwitch = (index: number) => {
		themedSwitches[index] = !themedSwitches[index];
	};
</script>

<DocLayout
	titleText="Styling Examples"
	descriptionText="Per-instance colours via itemStyles, plus pointers to v2.0's full --base-* / --sw-* theming layer">

	<div class="py-4">
		<div class="alert alert-info">
			<strong>Quick orientation.</strong> Per-instance one-off colours go through
			<code>itemStyles</code> (this page). Cross-cutting brand themes go through
			<code>--base-*</code> / <code>--sw-*</code> CSS variables — see the dedicated
			<a href="/examples/theming">Theming</a> page.
		</div>

		<!-- Basic Color Customization -->
		<ShowcaseSection
			titleText="ST01 Color Customization"
			subtitleText="Customize a single switch's colours via itemStyles"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Color Properties">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Custom Red:</span>
						<Switch
							bind:checked={basicStyledSwitch}
							itemStyles={redTheme}
							size={60} />
						<span class="switch-state">State: {basicStyledSwitch ? 'ON' : 'OFF'}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Custom Green:</span>
						<Switch
							bind:checked={customColorSwitch}
							itemStyles={greenTheme}
							size={60} />
						<span class="switch-state">State: {customColorSwitch ? 'ON' : 'OFF'}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let isEnabled = $state(false);

  const redTheme = {
    backgroundColor: '#ffebee',
    thumbColor: '#f44336',
    thumbBorderColor: '#d32f2f'
  };

  const greenTheme = {
    backgroundColor: '#e8f5e8',
    thumbColor: '#4caf50',
    thumbBorderColor: '#388e3c'
  };
<\/script>

<Switch
  bind:checked={isEnabled}
  itemStyles={redTheme}
  size={60} />

<Switch
  bind:checked={isEnabled}
  itemStyles={greenTheme}
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>StepStyle Properties</h4>
					<ul>
						<li><code>backgroundColor</code> — Track background colour</li>
						<li><code>thumbColor</code> — Thumb (handle) colour</li>
						<li><code>thumbBorderColor</code> — Thumb border colour</li>
					</ul>
					<h4>Color Formats</h4>
					<p>
						Any valid CSS colour: hex, rgb, rgba, hsl, named colours.
					</p>
					<h4>Resolution Order</h4>
					<p>
						Per-property: <code>itemStyles</code> data → <code>--sw-*</code> →
						<code>--base-*</code> → fallback. <code>itemStyles</code> wins.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Theme Collection -->
		<ShowcaseSection
			titleText="ST02 Pre-defined Themes"
			subtitleText="Reusable itemStyles objects for consistent per-instance styling"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Pattern Notes">

			{#snippet demoContent()}
				<div class="row g-3">
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Red Theme:</span>
							<Switch
								checked={themedSwitches[0]}
								onToggle={() => toggleThemeSwitch(0)}
								itemStyles={redTheme} />
						</div>
					</div>
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Green Theme:</span>
							<Switch
								checked={themedSwitches[1]}
								onToggle={() => toggleThemeSwitch(1)}
								itemStyles={greenTheme} />
						</div>
					</div>
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Blue Theme:</span>
							<Switch
								checked={themedSwitches[2]}
								onToggle={() => toggleThemeSwitch(2)}
								itemStyles={blueTheme} />
						</div>
					</div>
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Purple Theme:</span>
							<Switch
								checked={themedSwitches[3]}
								onToggle={() => toggleThemeSwitch(3)}
								itemStyles={purpleTheme} />
						</div>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`const themes = {
  red:    { backgroundColor: '#ffebee', thumbColor: '#f44336', thumbBorderColor: '#d32f2f' },
  green:  { backgroundColor: '#e8f5e8', thumbColor: '#4caf50', thumbBorderColor: '#388e3c' },
  blue:   { backgroundColor: '#e3f2fd', thumbColor: '#2196f3', thumbBorderColor: '#1976d2' },
  purple: { backgroundColor: '#f3e5f5', thumbColor: '#9c27b0', thumbBorderColor: '#7b1fa2' }
};

<Switch itemStyles={themes.red} />
<Switch itemStyles={themes.green} />
<Switch itemStyles={themes.blue} />
<Switch itemStyles={themes.purple} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>When to use this pattern</h4>
					<p>
						This works for a small set of one-off colour treatments. For an entire app
						theme — including non-switch components — use the
						<a href="/examples/theming">--base-*</a> cascade instead. Setting
						<code>--base-accent-color</code> on a parent themes every nested switch
						(and every other KeenMate component) at once.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- MultiSwitch Styling -->
		<ShowcaseSection
			titleText="ST03 MultiSwitch Per-Step Styling"
			subtitleText="Pass an array of styles, one per step"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Per-Item Styling">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Priority Level:</span>
						<MultiSwitch
							bind:selectedIndex={styledMultiSwitch}
							items={priorityLevels}
							itemStyles={multiSwitchStyles}
							shouldDisplayLabels={true}
							labelRenderMode="block"
							size={60} />
						<span class="switch-state">Priority: {priorityLevels[styledMultiSwitch]}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Power Mode:</span>
						<MultiSwitch
							bind:selectedIndex={customMultiSwitch}
							items={powerModes}
							itemStyles={multiSwitchStyles}
							shouldDisplayLabels={true}
							labelRenderMode="block" />
						<span class="switch-state">Mode: {powerModes[customMultiSwitch]}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let selectedIndex = $state(1);

  const priorityLevels = ['Low', 'Medium', 'High', 'Critical'];

  // Array of styles — one per step
  const styles = [
    { backgroundColor: '#ffebee', thumbColor: '#f44336', thumbBorderColor: '#d32f2f' },
    { backgroundColor: '#fff3e0', thumbColor: '#ff9800', thumbBorderColor: '#f57c00' },
    { backgroundColor: '#e8f5e8', thumbColor: '#4caf50', thumbBorderColor: '#388e3c' },
    { backgroundColor: '#e3f2fd', thumbColor: '#2196f3', thumbBorderColor: '#1976d2' }
  ];
<\/script>

<MultiSwitch
  bind:selectedIndex={selectedIndex}
  items={priorityLevels}
  itemStyles={styles}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Array vs Object</h4>
					<p>
						<code>itemStyles</code> accepts either an array (one StepStyle per step) or
						a single StepStyle object (applied to every step).
					</p>
					<h4>Visual Hierarchy</h4>
					<p>
						Use different colours to create meaning — red for critical, green for safe.
						Priority-coloured switches communicate severity at a glance.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Size + Style -->
		<ShowcaseSection
			titleText="ST04 Size and Style Combinations"
			subtitleText="Combining sizes with custom styling"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Design Tips">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4 align-items-start">
					<div class="switch-demo">
						<span class="switch-label">size=&#123;40&#125;:</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={blueTheme}
							size={40} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size=&#123;60&#125;:</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={blueTheme}
							size={60} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size=&#123;80&#125;:</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={blueTheme}
							size={80} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Vertical + size=&#123;100&#125;:</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={purpleTheme}
							orientation="vertical"
							size={100} />
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`const theme = {
  backgroundColor: '#e3f2fd',
  thumbColor: '#2196f3',
  thumbBorderColor: '#1976d2'
};

<!-- Same theme, different sizes -->
<Switch itemStyles={theme} size={40} />
<Switch itemStyles={theme} size={60} />
<Switch itemStyles={theme} size={80} />

<!-- Vertical with custom size -->
<Switch
  itemStyles={theme}
  orientation="vertical"
  size={100} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Scalable Styling</h4>
					<p>
						Custom styles work consistently across all sizes. The component scales
						colours and proportions automatically.
					</p>
					<h4>Responsive Design</h4>
					<p>
						Consider using different sizes for different screen sizes — smaller for
						mobile, larger for touch interfaces. The named sizes
						(<code>'sm'</code>...<code>'xl'</code>) work well in form contexts.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- CSS Variables (v2.0) -->
		<div class="mt-5">
			<h2 class="mb-4">CSS Variable Customization (v2.0+)</h2>
			<div class="row">
				<div class="col-lg-6">
					<h4>Per-instance overrides via <code>--sw-*</code></h4>
					<p>
						Set <code>--sw-*</code> variables in a <code>style=</code> attribute to
						override one switch's colours without touching others.
					</p>
					<CodeBlock
						codeContent={`<!-- Override one switch's thumb colour -->
<Switch
  bind:checked={isEnabled}
  style="--sw-thumb-bg: cyan; --sw-bg-on: deeppink;" />

<!-- Override the focus ring colour -->
<Switch
  bind:checked={isEnabled}
  style="--sw-focus-color: orange; --sw-focus-ring: 0 0 0 3px orange;" />

<!-- Disable the bg-on accent flip and use neutral on/off -->
<Switch
  bind:checked={isEnabled}
  style="--sw-bg-on: var(--sw-bg-off);" />`}
						languageType="svelte"
						titleText="Per-instance overrides"
					/>
				</div>
				<div class="col-lg-6">
					<h4>App-wide theme via <code>--base-*</code></h4>
					<p>
						Set <code>--base-*</code> on a parent (or <code>:root</code>) and every
						switch underneath picks up the theme. Same convention as web-multiselect /
						web-daterangepicker.
					</p>
					<CodeBlock
						codeContent={`/* App-wide theme — one colour pass for all KeenMate components */
:root {
  --base-accent-color: #6366f1;
  --base-primary-bg: #f3f4f6;
  --base-text-color-on-accent: #ffffff;
  --base-border-radius-sm: 1.2;  /* coefficient × --sw-rem */
  --base-shadow-sm: 0 2px 4px rgba(0,0,0,0.1);
  --base-font-size-sm: 1.4;
}

/* Scoped theme — only applies to .my-section descendants */
.my-section {
  --base-accent-color: #10b981;
  --base-accent-color-light: #d1fae5;
  --base-accent-color-light-hover: #a7f3d0;
}`}
						languageType="css"
						titleText="App-wide theme"
					/>
				</div>
			</div>
			<div class="mt-3">
				<a href="/examples/theming" class="btn btn-outline-primary">→ See full Theming guide with live presets</a>
			</div>
		</div>

		<!-- Best Practices -->
		<div class="mt-5">
			<h2 class="mb-4">Styling Best Practices</h2>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>🎨 When to use what</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled mb-0">
								<li>✅ <code>itemStyles</code> — single switch, ad-hoc colours</li>
								<li>✅ <code>--sw-*</code> on a switch — single switch, theme-aware overrides</li>
								<li>✅ <code>--base-*</code> on parent — app-wide branding</li>
								<li>✅ All three combine via the resolution order</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>📐 Size Guidelines</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled mb-0">
								<li>✅ Default <code>'md'</code> aligns with pure-admin form heights</li>
								<li>✅ Use named sizes for forms; numeric for one-off displays</li>
								<li>✅ Minimum ~44px for touch interfaces</li>
								<li>✅ Test on different screen densities</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Next Steps -->
		<div class="mt-5">
			<h2 class="mb-4">Next Steps</h2>
			<div class="row g-4">
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🌈</div>
							<h5>Theming</h5>
							<p>Live --base-* / --sw-* playground</p>
							<a href="/examples/theming" class="btn btn-primary">Theming</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">⚡</div>
							<h5>Advanced</h5>
							<p>Custom snippets and complex examples</p>
							<a href="/examples/advanced" class="btn btn-outline-primary">Advanced</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">📚</div>
							<h5>API Reference</h5>
							<p>Complete documentation</p>
							<a href="/api/switch" class="btn btn-outline-primary">API Docs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
