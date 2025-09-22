<script lang="ts">
	import { DocLayout, CodeBlock } from '@keenmate/svelte-docs';
</script>

<DocLayout
	titleText="Switch API Reference"
	descriptionText="Complete API documentation for the Switch component">

	<div class="py-4">
		<!-- Component Overview -->
		<div class="mb-5">
			<h2 class="mb-3">📚 Switch Component</h2>
			<p class="lead">
				A binary switch component for on/off states with Svelte 5 support.
			</p>

			<div class="row g-4 mb-4">
				<div class="col-md-6">
					<CodeBlock
						codeContent={`import { Switch } from '@keenmate/svelte-switch';`}
						languageType="javascript"
						titleText="Import"
					/>
				</div>
				<div class="col-md-6">
					<CodeBlock
						codeContent={`<script>
  let isEnabled = $state(false);
</script>

<Switch bind:checked={isEnabled} />`}
						languageType="svelte"
						titleText="Basic Usage"
					/>
				</div>
			</div>
		</div>

		<!-- Properties -->
		<div class="mb-5">
			<h3 class="mb-4">🔧 Properties</h3>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th style="width: 20%">Property</th>
							<th style="width: 25%">Type</th>
							<th style="width: 15%">Default</th>
							<th style="width: 40%">Description</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>checked</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Current state of the switch (bindable)</td>
						</tr>
						<tr>
							<td><code>isDisabled</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Disables interaction when true</td>
						</tr>
						<tr>
							<td><code>orientation</code></td>
							<td><code>"horizontal" | "vertical"</code></td>
							<td><code>"horizontal"</code></td>
							<td>Layout direction of the switch</td>
						</tr>
						<tr>
							<td><code>size</code></td>
							<td><code>number</code></td>
							<td><code>50</code></td>
							<td>Height in pixels (width for vertical)</td>
						</tr>
						<tr>
							<td><code>items</code></td>
							<td><code>any[] | null</code></td>
							<td><code>null</code></td>
							<td>Array of exactly 2 items for custom content</td>
						</tr>
						<tr>
							<td><code>itemStyles</code></td>
							<td><code>StepStyle | StepStyle[]</code></td>
							<td><code>[]</code></td>
							<td>Custom styling for track and thumb</td>
						</tr>
						<tr>
							<td><code>onToggle</code></td>
							<td><code>(checked: boolean) => void</code></td>
							<td><code>undefined</code></td>
							<td>Callback fired when state changes</td>
						</tr>
						<tr>
							<td><code>disableThumbRender</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Disable default thumb rendering</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Snippets -->
		<div class="mb-5">
			<h3 class="mb-4">🎭 Template Snippets</h3>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th style="width: 25%">Snippet</th>
							<th style="width: 35%">Parameters</th>
							<th style="width: 40%">Description</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>children</code></td>
							<td><code>currentIndex: number<br>item: any<br>isSelected: boolean</code></td>
							<td>Custom content snippet for switch areas</td>
						</tr>
						<tr>
							<td><code>thumbTemplate</code></td>
							<td><code>currentIndex: number<br>currentItem: any<br>itemsCount: number</code></td>
							<td>Custom thumb content snippet</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Type Definitions -->
		<div class="mb-5">
			<h3 class="mb-4">📋 Type Definitions</h3>

			<h5>StepStyle Interface</h5>
			<CodeBlock
				codeContent={`interface StepStyle {
  backgroundColor?: string;
  thumbColor?: string;
  thumbBorderColor?: string;
}`}
				languageType="typescript"
			/>
		</div>

		<!-- Usage Examples -->
		<div class="mb-5">
			<h3 class="mb-4">💡 Usage Examples</h3>

			<div class="row g-4">
				<div class="col-lg-6">
					<h5>Two-way Binding</h5>
					<CodeBlock
						codeContent={`<script>
  let isEnabled = $state(false);
</script>

<Switch bind:checked={isEnabled} />
<p>Status: {isEnabled ? 'ON' : 'OFF'}</p>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Custom Styling</h5>
					<CodeBlock
						codeContent={`<script>
  const customTheme = {
    backgroundColor: '#e3f2fd',
    thumbColor: '#1976d2',
    thumbBorderColor: '#0d47a1'
  };
</script>

<Switch itemStyles={customTheme} />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Custom Thumb Template</h5>
					<CodeBlock
						codeContent={`<Switch bind:checked={isDayMode} size={80}>
  {#snippet thumbTemplate({ currentIndex })}
    <div class="text-center p-2">
      {isDayMode ? '🌞' : '🌙'}
    </div>
  {/snippet}
</Switch>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Event Handling</h5>
					<CodeBlock
						codeContent={`<script>
  let checked = $state(false);

  const handleToggle = (newState) => {
    console.log('Switch toggled:', newState);
  };
</script>

<Switch
  bind:checked={checked}
  onToggle={handleToggle} />`}
						languageType="svelte"
					/>
				</div>
			</div>
		</div>

		<!-- SCSS Variables -->
		<div class="mb-5">
			<h3 class="mb-4">🎨 SCSS Variables</h3>
			<p>Override these variables before importing the component styles:</p>

			<CodeBlock
				codeContent={`// Core Variables
$border-radius: 4px;
$margin: 2px;
$switch-height: 32px;
$thumb-height: 28px;
$transition-duration: 0.3s;
$transition-easing: ease;
$shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
$focus-shadow: 0 0 0 3px $focus-color;

// Color Variables
$switch-bg-off: #ccc;
$switch-bg-on: #4299e1;
$thumb-bg: white;
$focus-color: rgba(66, 153, 225, 0.5);
$default-label-color: #666;
$default-label-active-color: #333;
$default-label-font-size: 14px;
$default-label-font-weight: normal;
$default-label-active-font-weight: bold;

// Import component styles
@import '@keenmate/svelte-switch/style';`}
				languageType="scss"
			/>
		</div>

		<!-- Accessibility -->
		<div class="mb-5">
			<h3 class="mb-4">♿ Accessibility</h3>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h6 class="mb-0">Built-in Features</h6>
						</div>
						<div class="card-body">
							<ul class="list-unstyled mb-0">
								<li>✅ Keyboard navigation (Space, Enter)</li>
								<li>✅ Focus management with visible indicators</li>
								<li>✅ ARIA attributes (role, aria-checked)</li>
								<li>✅ Screen reader support</li>
								<li>✅ Disabled state handling</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<div class="card-header">
							<h6 class="mb-0">Best Practices</h6>
						</div>
						<div class="card-body">
							<ul class="list-unstyled mb-0">
								<li>🎯 Provide clear labels or context</li>
								<li>🎯 Ensure sufficient color contrast</li>
								<li>🎯 Test with keyboard navigation</li>
								<li>🎯 Consider reduced motion preferences</li>
								<li>🎯 Use semantic HTML structure</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Component Methods -->
		<div class="mb-5">
			<h3 class="mb-4">⚙️ Component Methods</h3>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th style="width: 25%">Method</th>
							<th style="width: 35%">Signature</th>
							<th style="width: 40%">Description</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>update</code></td>
							<td><code>(props: Partial&lt;SwitchProps&gt;) => void</code></td>
							<td>Programmatically update component properties</td>
						</tr>
					</tbody>
				</table>
			</div>

			<CodeBlock
				codeContent={`// Get component reference
let switchRef;

// Update multiple properties
switchRef.update({
  checked: true,
  isDisabled: false,
  size: 60,
  itemStyles: { thumbColor: '#10b981' }
});`}
				languageType="javascript"
			/>
		</div>
	</div>
</DocLayout>