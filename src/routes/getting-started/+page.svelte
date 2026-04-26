<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	let quickStartSwitch = $state(false);
	let quickStartMultiSwitch = $state(0);
	const powerLevels = ['Off', 'Low', 'High'];
</script>

<DocLayout
	titleText="Getting Started"
	descriptionText="Install and use @keenmate/svelte-switch in your Svelte 5 project">

	<div class="py-4">
		<!-- Installation -->
		<ShowcaseSection
			titleText="Installation"
			subtitleText="Choose your preferred package manager"
			col1Title="npm"
			col2Title="pnpm"
			col3Title="yarn">

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
			col1Title="Basic Switch"
			col2Title="Multi Switch"
			col3Title="Notes">

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
<\/script>

<Switch bind:checked={isEnabled} />`}
						languageType="svelte"
					/>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Power level:</span>
						<MultiSwitch
							bind:selectedIndex={quickStartMultiSwitch}
							items={powerLevels}
							shouldDisplayLabels={true}
							labelRenderMode="block" />
						<span class="switch-state">Level: {powerLevels[quickStartMultiSwitch]}</span>
					</div>
					<CodeBlock
						codeContent={`<script>
  import { MultiSwitch } from '@keenmate/svelte-switch';
  let selectedLevel = $state(0);
  const levels = ['Off', 'Low', 'High'];
<\/script>

<MultiSwitch
  bind:selectedIndex={selectedLevel}
  items={levels}
  shouldDisplayLabels={true}
  labelRenderMode="block" />`}
						languageType="svelte"
					/>
				</div>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Two-way Binding</h4>
					<p>
						Use <code>bind:checked</code> for Switch and <code>bind:selectedIndex</code>
						for MultiSwitch. State updates flow both directions.
					</p>
					<h4>State Management</h4>
					<p>
						Use Svelte 5's <code>$state</code> rune for reactive variables, or any
						reactive store pattern you prefer.
					</p>
					<h4>TypeScript</h4>
					<p>
						Both components are generic over the item type <code>T</code>, inferred from
						the <code>items</code> prop. Snippet contexts get the right item type without
						explicit annotations.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Vanilla JS usage -->
		<ShowcaseSection
			titleText="Vanilla JavaScript Usage"
			subtitleText="Mount components outside Svelte apps using mount() + $state"
			col1Title="Recipe"
			col2Title="Why $state?"
			columnCountType={2}
			leftColumnSize={7}
			rightColumnSize={5}>

			{#snippet demoContent()}
				<CodeBlock
					codeContent={`import { mount } from 'svelte';
import { Switch } from '@keenmate/svelte-switch';

const props = $state({ checked: false, size: 50 });
mount(Switch, {
  target: document.getElementById('switch-host'),
  props
});

// Later — just mutate the state object, the component reacts:
props.checked = true;
props.size = 80;`}
					languageType="javascript"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<div class="prose">
					<p>
						Svelte 5 props are reactive. Pass a <code>$state</code> object to
						<code>mount()</code> and mutate it later — no <code>update()</code> method needed.
					</p>
					<p>
						The 1.x <code>.update()</code> escape hatch was removed in 2.0; this is the
						idiomatic Svelte 5 replacement.
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
							<h4>🔄 Switch</h4>
						</div>
						<div class="card-body">
							<p>Binary on/off toggle.</p>
							<ul class="list-unstyled">
								<li>✅ Binary (true/false) state via <code>bind:checked</code></li>
								<li>✅ Horizontal and vertical orientations</li>
								<li>✅ Named sizes (xs/sm/md/lg/xl) or numeric pixels</li>
								<li>✅ Custom <code>itemStyles</code> per state</li>
								<li>✅ Disabled state</li>
								<li>✅ <code>thumb</code> snippet for custom thumb content</li>
								<li>✅ Generic over item type <code>T</code></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="card h-100">
						<div class="card-header">
							<h4>🎛️ MultiSwitch</h4>
						</div>
						<div class="card-body">
							<p>Multi-step switch (3+ options).</p>
							<ul class="list-unstyled">
								<li>✅ Any number of items via <code>items</code> array</li>
								<li>✅ Auto label rendering with <code>shouldDisplayLabels</code></li>
								<li>✅ <code>labelMember</code> / <code>labelCallback</code> / <code>label</code> snippet</li>
								<li>✅ All Switch features</li>
								<li>✅ Separate <code>thumb</code> + <code>segment</code> snippets</li>
								<li>✅ Per-step <code>itemStyles</code></li>
								<li>✅ Clickable per-step labels (vertical mode)</li>
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
					<strong>Svelte 5</strong> or later. The library uses runes (<code>$state</code>,
					<code>$props</code>, <code>$derived</code>) and snippets — there is no Svelte 4
					compatibility build.
				</p>
			</div>
		</div>

		<!-- Next steps -->
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
							<div class="display-6 mb-3">🎨</div>
							<h5>Theming</h5>
							<p>--base-* cascade and per-instance overrides</p>
							<a href="/examples/theming" class="btn btn-outline-primary">Theming Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">📚</div>
							<h5>API Reference</h5>
							<p>Complete documentation of all props</p>
							<a href="/api/switch" class="btn btn-outline-primary">API Docs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
