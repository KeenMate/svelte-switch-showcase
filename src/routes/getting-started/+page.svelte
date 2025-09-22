<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	let quickStartSwitch = $state(false);
	let quickStartMultiSwitch = $state(0);
	const powerLevels = ['Off', 'Low', 'High'];
</script>

<DocLayout
	titleText="Getting Started"
	descriptionText="Learn how to install and use @keenmate/svelte-switch in your Svelte project">

	<div class="py-4">
		<!-- Installation -->
		<ShowcaseSection
			titleText="Installation"
			subtitleText="Choose your preferred package manager"
			demoColumnTitle="npm"
			controlsColumnTitle="pnpm"
			descriptionColumnTitle="yarn">

			{#snippet demoContent()}
				<CodeBlock
					codeContent="npm install @keenmate/svelte-switch"
					languageType="bash"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent="pnpm add @keenmate/svelte-switch"
					languageType="bash"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<CodeBlock
					codeContent="yarn add @keenmate/svelte-switch"
					languageType="bash"
				/>
			{/snippet}
		</ShowcaseSection>

		<!-- Quick Start -->
		<ShowcaseSection
			titleText="Quick Start"
			subtitleText="Basic usage examples to get you started"
			demoColumnTitle="Basic Switch"
			controlsColumnTitle="Multi Switch"
			descriptionColumnTitle="Code Examples">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Basic toggle:</span>
						<Switch bind:checked={quickStartSwitch} />
						<span class="switch-state">State: {quickStartSwitch}</span>
					</div>
					<CodeBlock
						codeContent={`<script>
  import { Switch } from '@keenmate/svelte-switch';
  let isEnabled = $state(false);
</script>

<Switch bind:checked={isEnabled} />`}
						languageType="svelte"
					/>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo" style="padding-bottom: 2.5rem;">
						<span class="switch-label">Power level:</span>
						<MultiSwitch
							bind:selectedIndex={quickStartMultiSwitch}
							items={powerLevels}
							shouldDisplayLabels={true} />
						<span class="switch-state">Level: {powerLevels[quickStartMultiSwitch]}</span>
					</div>
					<CodeBlock
						codeContent={`<script>
  import { MultiSwitch } from '@keenmate/svelte-switch';
  let selectedLevel = $state(0);
  const levels = ['Off', 'Low', 'High'];
</script>

<MultiSwitch
  bind:selectedIndex={selectedLevel}
  items={levels}
  shouldDisplayLabels={true} />`}
						languageType="svelte"
					/>
				</div>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Basic Usage</h4>
					<p>
						Import the components you need and use them with reactive state variables.
						Both Switch and MultiSwitch support two-way binding with the <code>bind:</code> directive.
					</p>
					<h4>State Management</h4>
					<p>
						Use Svelte 5's <code>$state</code> rune for reactive variables, or any reactive
						store pattern you prefer.
					</p>
					<h4>TypeScript Support</h4>
					<p>
						Full TypeScript support is included with proper type definitions for all props
						and events.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Component Overview -->
		<div class="mt-5">
			<h2 class="mb-4">Component Overview</h2>
			<div class="row g-4">
				<div class="col-lg-6">
					<div class="card h-100">
						<div class="card-header">
							<h4>🔄 Switch Component</h4>
						</div>
						<div class="card-body">
							<p>A binary switch component for on/off states.</p>
							<ul class="list-unstyled">
								<li>✅ Binary (true/false) state</li>
								<li>✅ Horizontal and vertical orientations</li>
								<li>✅ Custom styling support</li>
								<li>✅ Size customization</li>
								<li>✅ Disabled state</li>
								<li>✅ Custom thumb templates</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card h-100">
						<div class="card-header">
							<h4>🎛️ MultiSwitch Component</h4>
						</div>
						<div class="card-body">
							<p>A multi-state switch for selecting from multiple options.</p>
							<ul class="list-unstyled">
								<li>✅ Multiple states (3+ options)</li>
								<li>✅ Custom item arrays</li>
								<li>✅ Label display with positioning</li>
								<li>✅ All Switch features</li>
								<li>✅ Custom label templates</li>
								<li>✅ Flexible styling per item</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Requirements -->
		<div class="mt-5">
			<h2 class="mb-4">Requirements</h2>
			<div class="alert alert-info">
				<h5>Svelte 5</h5>
				<p class="mb-0">
					This library requires <strong>Svelte 5</strong> or later. It uses modern Svelte features
					like runes and snippets for optimal performance and developer experience.
				</p>
			</div>
		</div>

		<!-- Next Steps -->
		<div class="mt-5">
			<h2 class="mb-4">Next Steps</h2>
			<div class="row g-4">
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎯</div>
							<h5>View Examples</h5>
							<p>Explore detailed examples and use cases</p>
							<a href="/examples/basic" class="btn btn-primary">View Examples</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">📚</div>
							<h5>API Reference</h5>
							<p>Complete documentation of all props and methods</p>
							<a href="/api/switch" class="btn btn-outline-primary">API Docs</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎮</div>
							<h5>Playground</h5>
							<p>Try out different configurations interactively</p>
							<a href="/examples/basic" class="btn btn-outline-primary">Examples</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>