<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch } from '@keenmate/svelte-switch';

	// Demo states
	let basicSwitch = $state(false);
	let sizedSwitch = $state(true);
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
			titleText="Basic Usage"
			subtitleText="Simple on/off switch with state binding"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Explanation">

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
</script>

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
						The switch automatically updates when the bound variable changes, and
						vice versa.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Size Customization -->
		<ShowcaseSection
			titleText="Size Customization"
			subtitleText="Control the size of your switches"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Size Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Small (30px):</span>
						<Switch bind:checked={sizedSwitch} size={30} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Default (50px):</span>
						<Switch bind:checked={sizedSwitch} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Large (80px):</span>
						<Switch bind:checked={sizedSwitch} size={80} />
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Small switch -->
<Switch bind:checked={isEnabled} size={30} />

<!-- Default size (50px) -->
<Switch bind:checked={isEnabled} />

<!-- Large switch -->
<Switch bind:checked={isEnabled} size={80} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Size Property</h4>
					<p>
						The <code>size</code> prop controls the height (and width for square switches)
						in pixels.
					</p>
					<h4>Responsive Design</h4>
					<p>
						Consider using CSS media queries or responsive size values for
						different screen sizes.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Disabled State -->
		<ShowcaseSection
			titleText="Disabled State"
			subtitleText="Prevent user interaction when needed"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Use Cases">

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
</script>

<!-- Disabled switch (off) -->
<Switch
  bind:checked={isEnabled}
  isDisabled={true} />

<!-- Disabled switch (on) -->
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
						Disabled switches are properly marked with ARIA attributes
						for screen readers.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Orientation -->
		<ShowcaseSection
			titleText="Orientation"
			subtitleText="Horizontal or vertical layout options"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Design Guidelines">

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

<!-- Vertical orientation -->
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
						Vertical switches work well in compact layouts or when
						you need to save horizontal space.
					</p>
					<h4>Size Recommendations</h4>
					<p>
						Consider using larger sizes for vertical switches to maintain
						good usability and visual balance.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Event Handling -->
		<ShowcaseSection
			titleText="Event Handling"
			subtitleText="Respond to switch state changes"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Event Details">

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
    // Perform additional actions
    console.log('Switch changed:', checked);
  };
</script>

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
						the new state value.
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
							<p>Customize colors and appearance</p>
							<a href="/examples/styling" class="btn btn-outline-primary">Styling Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">⚡</div>
							<h5>Advanced</h5>
							<p>Advanced features and techniques</p>
							<a href="/examples/advanced" class="btn btn-outline-primary">Advanced Examples</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>