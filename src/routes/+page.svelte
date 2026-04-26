<script lang="ts">
	import { DocLayout, ShowcaseSection, FeatureCard, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	let basicSwitchState = $state(false);
	let styledSwitchState = $state(false);
	let multiSwitchIndex = $state(0);
	let verticalSwitchState = $state(false);

	const multiSwitchItems = ['Off', 'Low', 'Medium', 'High'];
	const styledSwitchStyle = {
		backgroundColor: '#e3f2fd',
		thumbColor: '#1976d2',
		thumbBorderColor: '#0d47a1'
	};
</script>

<DocLayout
	titleText="Svelte Switch Showcase"
	descriptionText="Modern, customizable switch components for Svelte 5">

	<div class="py-5">
		<!-- Hero -->
		<div class="text-center mb-5">
			<h1 class="display-4 fw-bold mb-4">
				<span class="text-primary">@keenmate/svelte-switch</span>
			</h1>
			<p class="lead mb-4">
				A modern, customizable switch component library for Svelte 5 with binary and multi-step switches, generic typing, and a full theming layer.
			</p>
			<div class="d-flex gap-3 justify-content-center flex-wrap">
				<a href="/getting-started" class="btn btn-primary btn-lg">🚀 Get Started</a>
				<a href="/examples/basic" class="btn btn-outline-primary btn-lg">🎯 View Examples</a>
				<a href="https://github.com/keenmate/svelte-switch" target="_blank" rel="noopener" class="btn btn-outline-dark btn-lg">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16" class="me-2">
						<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
					</svg>
					GitHub
				</a>
			</div>
		</div>

		<!-- Live demos -->
		<div class="row g-4 mb-5">
			<div class="col-md-6">
				<div class="card h-100">
					<div class="card-header">
						<h5 class="mb-0">🔄 Basic Switch</h5>
					</div>
					<div class="card-body">
						<div class="switch-demo">
							<span class="switch-label">Toggle me:</span>
							<Switch bind:checked={basicSwitchState} />
							<span class="switch-state">State: {basicSwitchState}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card h-100">
					<div class="card-header">
						<h5 class="mb-0">🎛️ Multi Switch</h5>
					</div>
					<div class="card-body">
						<div class="switch-demo">
							<span class="switch-label">Power level:</span>
							<MultiSwitch
								bind:selectedIndex={multiSwitchIndex}
								items={multiSwitchItems}
								shouldDisplayLabels={true}
								labelPosition="bottom"
								labelRenderMode="block" />
							<span class="switch-state">Level: {multiSwitchItems[multiSwitchIndex]}</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Key features -->
		<div class="row g-4 mb-5">
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="⚡"
					titleText="Svelte 5 Native"
					descriptionText="Built on Svelte 5 runes and snippets. Generic over item type <T> with proper TypeScript inference."
					variantType="outline-primary"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="🎨"
					titleText="Theming Layer"
					descriptionText="--base-* cross-library cascade + --sw-* per-instance overrides. Compatible with @keenmate/theme-designer."
					variantType="outline-success"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="🔄"
					titleText="Binary & Multi-Step"
					descriptionText="Switch (binary on/off) and MultiSwitch (3+ steps) share the same prop conventions and event model."
					variantType="outline-info"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="📐"
					titleText="Named Sizes"
					descriptionText="size='xs|sm|md|lg|xl' aligned to pure-admin form heights (31/33/35/38/41px). Numeric size still works."
					variantType="outline-warning"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="♿"
					titleText="Accessible"
					descriptionText="Per-step labels are real <button>s with keyboard activation. Focus rings, ARIA attributes, disabled states."
					variantType="outline-danger"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="📦"
					titleText="TypeScript Ready"
					descriptionText="Full TypeScript with generics. Switch.items is a strict tuple [T, T]; MultiSwitch.items flows through to all snippets."
					variantType="outline-secondary"
				/>
			</div>
		</div>

		<!-- Quick install -->
		<ShowcaseSection
			titleText="Quick Installation"
			subtitleText="Get started in seconds"
			col1Title="Package Manager"
			col2Title="Import"
			col3Title="Usage">

			{#snippet demoContent()}
				<CodeBlock
					codeContent="npm install @keenmate/svelte-switch"
					languageType="bash"
					titleText="npm"
				/>
				<CodeBlock
					codeContent="pnpm add @keenmate/svelte-switch"
					languageType="bash"
					titleText="pnpm"
				/>
				<CodeBlock
					codeContent="yarn add @keenmate/svelte-switch"
					languageType="bash"
					titleText="yarn"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`import { Switch, MultiSwitch } from '@keenmate/svelte-switch';`}
					languageType="javascript"
					titleText="Import components"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Simple to Use</h4>
					<p>
						Install with your package manager, then import and use. Both components are
						bindable and generic over the item type.
					</p>
					<h4>Zero Configuration</h4>
					<p>
						Sensible defaults out of the box. Drop into pure-admin forms with no theming
						work — the new <code>'md'</code> default size matches input heights.
					</p>
					<h4>Themable</h4>
					<p>
						Wrap any parent in <code>--base-accent-color</code> etc. and every nested
						switch picks up the theme. Per-instance <code>--sw-*</code> overrides for one-off tweaks.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Example usage -->
		<div class="mt-5">
			<h2 class="mb-4">Example Usage</h2>
			<div class="row g-4">
				<div class="col-lg-6">
					<CodeBlock
						codeContent={`<script>
  import { Switch } from '@keenmate/svelte-switch';

  let isEnabled = $state(false);
<\/script>

<Switch bind:checked={isEnabled} />
<p>Switch is: {isEnabled ? 'ON' : 'OFF'}</p>`}
						languageType="svelte"
						titleText="Basic Switch"
					/>
				</div>
				<div class="col-lg-6">
					<CodeBlock
						codeContent={`<script>
  import { MultiSwitch } from '@keenmate/svelte-switch';

  let selectedLevel = $state(0);
  const levels = ['Low', 'Medium', 'High'];
<\/script>

<MultiSwitch
  bind:selectedIndex={selectedLevel}
  items={levels}
  shouldDisplayLabels={true}
  labelRenderMode="block" />
<p>Current level: {levels[selectedLevel]}</p>`}
						languageType="svelte"
						titleText="Multi Switch"
					/>
				</div>
			</div>
		</div>

		<!-- Advanced examples -->
		<div class="mt-5">
			<h2 class="mb-4">Advanced Examples</h2>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">🎨 Styled Switch</h5>
						</div>
						<div class="card-body">
							<div class="switch-demo">
								<span class="switch-label">Custom style:</span>
								<Switch
									bind:checked={styledSwitchState}
									itemStyles={styledSwitchStyle}
									size={60} />
								<span class="switch-state">State: {styledSwitchState}</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h5 class="mb-0">📐 Vertical Switch</h5>
						</div>
						<div class="card-body">
							<div class="switch-demo">
								<span class="switch-label">Vertical:</span>
								<Switch
									bind:checked={verticalSwitchState}
									orientation="vertical"
									size={80} />
								<span class="switch-state">State: {verticalSwitchState}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Stats -->
		<div class="row text-center mt-5 pt-5 border-top">
			<div class="col-md-3">
				<h3 class="display-6 fw-bold text-primary">2</h3>
				<p class="text-muted">Switch Types</p>
			</div>
			<div class="col-md-3">
				<h3 class="display-6 fw-bold text-primary">∞</h3>
				<p class="text-muted">Customization Options</p>
			</div>
			<div class="col-md-3">
				<h3 class="display-6 fw-bold text-primary">100%</h3>
				<p class="text-muted">TypeScript</p>
			</div>
			<div class="col-md-3">
				<h3 class="display-6 fw-bold text-primary">MIT</h3>
				<p class="text-muted">License</p>
			</div>
		</div>
	</div>
</DocLayout>
