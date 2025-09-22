<script lang="ts">
	import { DocLayout, ShowcaseSection, FeatureCard, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	// State for demo switches
	let basicSwitchState = $state(false);
	let disabledSwitchState = $state(true);
	let styledSwitchState = $state(false);
	let multiSwitchIndex = $state(0);
	let verticalSwitchState = $state(false);

	const multiSwitchItems = ['Off', 'Low', 'Medium', 'High'];
	const styledSwitchStyles = {
		backgroundColor: '#e3f2fd',
		thumbColor: '#1976d2',
		thumbBorderColor: '#0d47a1'
	};
</script>

<DocLayout
	titleText="Svelte Switch Showcase"
	descriptionText="Modern, customizable switch components for Svelte 5">

	<!-- Hero Section -->
	<div class="py-5">
		<div class="text-center mb-5">
			<h1 class="display-4 fw-bold mb-4">
				<span class="text-primary">@keenmate/svelte-switch</span>
			</h1>
			<p class="lead mb-4">
				A modern, customizable switch component library for Svelte 5 with support for both binary and multi-step switches
			</p>
			<div class="d-flex gap-3 justify-content-center flex-wrap">
				<a href="/getting-started" class="btn btn-primary btn-lg">
					🚀 Get Started
				</a>
				<a href="/examples/basic" class="btn btn-outline-primary btn-lg">
					🎯 View Examples
				</a>
				<a href="https://github.com/keenmate/svelte-switch" target="_blank" class="btn btn-outline-dark btn-lg">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16" class="me-2">
						<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
					</svg>
					GitHub
				</a>
			</div>
		</div>

		<!-- Live Demo Section -->
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
						<div class="switch-demo" style="padding-bottom: 2.5rem;">
							<span class="switch-label">Power level:</span>
							<MultiSwitch
								bind:selectedIndex={multiSwitchIndex}
								items={multiSwitchItems}
								shouldDisplayLabels={true}
								labelPosition="bottom" />
							<span class="switch-state">Level: {multiSwitchItems[multiSwitchIndex]}</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Key Features -->
		<div class="row g-4 mb-5">
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="⚡"
					titleText="Svelte 5 Native"
					descriptionText="Built with Svelte 5 runes for optimal performance and modern reactive patterns"
					variantType="primary"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="🎨"
					titleText="Highly Customizable"
					descriptionText="Full control over styling, colors, sizes, and animations with CSS variables and props"
					variantType="success"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="🔄"
					titleText="Binary & Multi-Step"
					descriptionText="Support for both simple on/off switches and complex multi-state switches"
					variantType="info"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="📱"
					titleText="Touch Friendly"
					descriptionText="Optimized for both desktop and mobile with proper touch and gesture support"
					variantType="warning"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="♿"
					titleText="Accessible"
					descriptionText="Built-in accessibility features with proper ARIA attributes and keyboard navigation"
					variantType="danger"
				/>
			</div>
			<div class="col-md-6 col-lg-4">
				<FeatureCard
					iconEmoji="📦"
					titleText="TypeScript Ready"
					descriptionText="Full TypeScript support with complete type definitions included"
					variantType="secondary"
				/>
			</div>
		</div>

		<!-- Quick Install -->
		<ShowcaseSection
			titleText="Quick Installation"
			subtitleText="Get started in seconds"
			demoColumnTitle="Package Manager"
			controlsColumnTitle="Import"
			descriptionColumnTitle="Usage">

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
						Install the package using your preferred package manager, then import and use the switch components in your Svelte application.
					</p>
					<h4>Zero Configuration</h4>
					<p>
						Works out of the box with sensible defaults, but fully customizable when you need it.
					</p>
					<h4>Framework Agnostic Styling</h4>
					<p>
						Use with any CSS framework or custom styles. No styling dependencies required.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Example Usage -->
		<div class="mt-5">
			<h2 class="mb-4">Example Usage</h2>
			<div class="row g-4">
				<div class="col-lg-6">
					<CodeBlock
						codeContent={`<script>
  import { Switch } from '@keenmate/svelte-switch';

  let isEnabled = $state(false);
</script>

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
</script>

<MultiSwitch
  bind:selectedIndex={selectedLevel}
  items={levels}
  shouldDisplayLabels={true} />
<p>Current level: {levels[selectedLevel]}</p>`}
						languageType="svelte"
						titleText="Multi Switch"
					/>
				</div>
			</div>
		</div>

		<!-- More Examples -->
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
									itemStyles={styledSwitchStyles}
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