<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch } from '@keenmate/svelte-switch';

	let basicSwitch = $state(false);
	let sizedSwitch = $state(true);
	let namedSizeSwitch = $state(true);
	let disabledSwitch = $state(false);
	let disabledCheckedSwitch = $state(true);
	let verticalSwitch = $state(false);
	let callbackSwitch = $state(false);
	let callbackMessage = $state('');

	const handleToggle = (checked: boolean) => {
		callbackMessage = `Switch toggled to: ${checked ? 'ON' : 'OFF'} at ${new Date().toLocaleTimeString()}`;
	};
</script>

<DocLayout
	titleText="Basic Switch Examples"
	descriptionText="Learn how to use the Switch component with various configurations">

	<div class="py-4">
		<!-- Basic Usage -->
		<ShowcaseSection
			titleText="BS01 Basic Usage"
			subtitleText="Simple on/off switch with state binding"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Explanation">

			{#snippet demoContent()}
				<div class="switch-demo">
					<span class="switch-label">Toggle me:</span>
					<Switch bind:checked={basicSwitch} />
					<span class="switch-state">State: {basicSwitch ? 'ON' : 'OFF'}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  import { Switch } from '@keenmate/svelte-switch';

  let isEnabled = $state(false);
<\/script>

<Switch bind:checked={isEnabled} />
<p>State: {isEnabled ? 'ON' : 'OFF'}</p>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Two-way Binding</h4>
					<p>
						Use <code>bind:checked</code> to create a two-way binding between the switch
						and your component state.
					</p>
					<h4>Reactive State</h4>
					<p>
						The switch reflects changes to the bound variable instantly, and updates
						the variable when toggled by the user.
					</p>
					<h4>Default On-State</h4>
					<p>
						In v2.0 the on-state surface picks up <code>--base-accent-color</code> via
						<code>--sw-bg-on</code>. Override either to change the colour without
						touching the off-state.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Numeric size -->
		<ShowcaseSection
			titleText="BS02 Numeric Size"
			subtitleText="Control the height with explicit pixel values"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Notes">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">size=&#123;30&#125;:</span>
						<Switch bind:checked={sizedSwitch} size={30} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size=&#123;50&#125;:</span>
						<Switch bind:checked={sizedSwitch} size={50} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size=&#123;80&#125;:</span>
						<Switch bind:checked={sizedSwitch} size={80} />
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Numeric size in pixels -->
<Switch bind:checked={isEnabled} size={30} />
<Switch bind:checked={isEnabled} size={50} />
<Switch bind:checked={isEnabled} size={80} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>How Numeric Sizing Works</h4>
					<p>
						A numeric <code>size</code> sets <code>--scale = size / 50</code>. So
						<code>size=&#123;50&#125;</code> renders the natural 32px height,
						<code>size=&#123;80&#125;</code> scales it to ~51px, and so on.
					</p>
					<h4>When to Use Numeric</h4>
					<p>
						Use numeric size for one-off displays where you need an exact pixel value.
						For form-aligned defaults, use named sizes instead (next section).
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Named sizes (new in v2.0) -->
		<ShowcaseSection
			titleText="BS03 Named Sizes (v2.0+)"
			subtitleText="xs / sm / md / lg / xl aligned to pure-admin form heights"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Why named sizes">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">size="xs" (31px):</span>
						<Switch bind:checked={namedSizeSwitch} size="xs" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size="sm" (33px):</span>
						<Switch bind:checked={namedSizeSwitch} size="sm" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size="md" — default (35px):</span>
						<Switch bind:checked={namedSizeSwitch} size="md" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size="lg" (38px):</span>
						<Switch bind:checked={namedSizeSwitch} size="lg" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size="xl" (41px):</span>
						<Switch bind:checked={namedSizeSwitch} size="xl" />
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Named sizes match pure-admin form heights -->
<Switch bind:checked={value} size="xs" />  <!-- 31px -->
<Switch bind:checked={value} size="sm" />  <!-- 33px -->
<Switch bind:checked={value} size="md" />  <!-- 35px (default) -->
<Switch bind:checked={value} size="lg" />  <!-- 38px -->
<Switch bind:checked={value} size="xl" />  <!-- 41px -->`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Form-Aligned Defaults</h4>
					<p>
						<code>'md'</code> is now the default size — switches drop into pure-admin
						forms next to inputs without per-instance config.
					</p>
					<h4>Themable Heights</h4>
					<p>
						Each named size resolves through
						<code>--base-input-size-&#123;name&#125;-height</code>, so a parent with
						<code>--base-input-size-md-height: 4.0</code> rescales every default
						switch underneath.
					</p>
					<h4>See also</h4>
					<p>
						The <a href="/examples/sizes">Sizes</a> page has the full table and
						pure-admin integration recipe.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Disabled State -->
		<ShowcaseSection
			titleText="BS04 Disabled State"
			subtitleText="Prevent user interaction when needed"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Use Cases">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Disabled (OFF):</span>
						<Switch bind:checked={disabledSwitch} isDisabled={true} />
						<span class="switch-state">State: {disabledSwitch ? 'ON' : 'OFF'}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Disabled (ON):</span>
						<Switch bind:checked={disabledCheckedSwitch} isDisabled={true} />
						<span class="switch-state">State: {disabledCheckedSwitch ? 'ON' : 'OFF'}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let isEnabled = $state(false);
  let isReadonly = $state(true);
<\/script>

<Switch
  bind:checked={isEnabled}
  isDisabled={true} />

<Switch
  bind:checked={isReadonly}
  isDisabled={true} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>When to Disable</h4>
					<ul>
						<li>During async operations</li>
						<li>When permissions are insufficient</li>
						<li>For read-only configuration display</li>
						<li>When dependencies aren't met</li>
					</ul>
					<h4>Accessibility</h4>
					<p>
						Disabled switches are properly marked with ARIA attributes for screen readers
						and skip focus order.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Orientation -->
		<ShowcaseSection
			titleText="BS05 Orientation"
			subtitleText="Horizontal or vertical layout"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Design Guidelines">

			{#snippet demoContent()}
				<div class="d-flex gap-4 align-items-center">
					<div class="text-center">
						<div class="mb-2">Horizontal (default)</div>
						<Switch bind:checked={verticalSwitch} />
					</div>
					<div class="text-center">
						<div class="mb-2">Vertical</div>
						<Switch bind:checked={verticalSwitch} orientation="vertical" size={80} />
					</div>
				</div>
				<div class="mt-3 text-center">
					<span class="switch-state">State: {verticalSwitch ? 'ON' : 'OFF'}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Horizontal (default) -->
<Switch bind:checked={isEnabled} />

<!-- Vertical -->
<Switch
  bind:checked={isEnabled}
  orientation="vertical"
  size={80} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Layout Considerations</h4>
					<p>
						Vertical switches work well in compact layouts or when you need to save
						horizontal space.
					</p>
					<h4>Size Recommendations</h4>
					<p>
						Vertical switches benefit from larger sizes for usability — consider a
						numeric size of 60–100px or use <code>'lg'</code> / <code>'xl'</code>.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Event Handling -->
		<ShowcaseSection
			titleText="BS06 Event Handling"
			subtitleText="Respond to switch state changes"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Event Details">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Toggle me:</span>
						<Switch bind:checked={callbackSwitch} onToggle={handleToggle} />
						<span class="switch-state">State: {callbackSwitch ? 'ON' : 'OFF'}</span>
					</div>
					{#if callbackMessage}
						<div class="alert alert-info">
							{callbackMessage}
						</div>
					{/if}
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let isEnabled = $state(false);
  let message = $state('');

  const handleToggle = (checked) => {
    message = \`Switch toggled to: \${checked ? 'ON' : 'OFF'}\`;
    console.log('Switch changed:', checked);
  };
<\/script>

<Switch
  bind:checked={isEnabled}
  onToggle={handleToggle} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>onToggle Callback</h4>
					<p>
						The <code>onToggle</code> prop accepts a function that receives
						the new state value as its only argument.
					</p>
					<h4>Common Use Cases</h4>
					<ul>
						<li>Logging state changes</li>
						<li>Triggering API calls</li>
						<li>Updating other UI elements</li>
						<li>Form validation</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Next Steps -->
		<div class="mt-5">
			<h2 class="mb-4">Next Steps</h2>
			<div class="row g-4">
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎛️</div>
							<h5>Multi Switch</h5>
							<p>Learn about multi-state switches</p>
							<a href="/examples/multi" class="btn btn-primary">Multi Examples</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎨</div>
							<h5>Styling</h5>
							<p>Customize per-instance colors</p>
							<a href="/examples/styling" class="btn btn-outline-primary">Styling Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">⚡</div>
							<h5>Advanced</h5>
							<p>Advanced features and snippets</p>
							<a href="/examples/advanced" class="btn btn-outline-primary">Advanced Examples</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
