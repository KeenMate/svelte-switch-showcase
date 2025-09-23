<script lang="ts">
	import { DocLayout, CodeBlock } from '@keenmate/svelte-docs';
</script>

<DocLayout
	titleText="MultiSwitch API Reference"
	descriptionText="Complete API documentation for the MultiSwitch component">

	<div class="py-4">
		<!-- Component Overview -->
		<div class="mb-5">
			<h2 class="mb-3">📚 MultiSwitch Component</h2>
			<p class="lead">
				A multi-option switch component for selecting between multiple choices with Svelte 5 support.
			</p>

			<div class="row g-4 mb-4">
				<div class="col-md-6">
					<CodeBlock
						codeContent={`import { MultiSwitch } from '@keenmate/svelte-switch';`}
						languageType="javascript"
						titleText="Import"
					/>
				</div>
				<div class="col-md-6">
					<CodeBlock
						codeContent={`<script>
  let selectedIndex = $state(0);
  const options = ['Option A', 'Option B', 'Option C'];
</script>

<MultiSwitch bind:selectedIndex items={options} />`}
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
							<th style="width: 18%">Property</th>
							<th style="width: 22%">Type</th>
							<th style="width: 12%">Default</th>
							<th style="width: 35%">Description</th>
							<th style="width: 13%">Version</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>selectedIndex</code></td>
							<td><code>number</code></td>
							<td><code>0</code></td>
							<td>Currently selected index (bindable)</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>items</code> *</td>
							<td><code>any[]</code></td>
							<td><code>required</code></td>
							<td>Array of options to display</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>isDisabled</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Disables interaction when true</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>orientation</code></td>
							<td><code>"horizontal" | "vertical"</code></td>
							<td><code>"horizontal"</code></td>
							<td>Layout direction of the switch</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>size</code></td>
							<td><code>number</code></td>
							<td><code>50</code></td>
							<td>Height in pixels (width for vertical)</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>itemStyles</code></td>
							<td><code>StepStyle | StepStyle[]</code></td>
							<td><code>[]</code></td>
							<td>Custom styling for each option</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>shouldDisplayLabels</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Show/hide option labels</td>
							<td><span class="badge bg-success">1.3.0+</span></td>
						</tr>
						<tr>
							<td><code>labelPosition</code></td>
							<td><code>"top" | "bottom" | "left" | "right"</code></td>
							<td><code>"bottom"</code></td>
							<td>Position of labels relative to switch</td>
							<td><span class="badge bg-success">1.3.0+</span></td>
						</tr>
						<tr>
							<td><code>labelRenderMode</code></td>
							<td><code>"absolute" | "block"</code></td>
							<td><code>"absolute"</code></td>
							<td>Label rendering mode - absolute (may overlap) or block (takes space)</td>
							<td><span class="badge bg-warning">1.4.0+</span></td>
						</tr>
						<tr>
							<td><code>labelMember</code></td>
							<td><code>string</code></td>
							<td><code>undefined</code></td>
							<td>Property name to extract label text from items (e.g., "name" reads item.name)</td>
							<td><span class="badge bg-warning">1.4.0+</span></td>
						</tr>
						<tr>
							<td><code>labelCallback</code></td>
							<td><code>(item: any, index: number) => string</code></td>
							<td><code>undefined</code></td>
							<td>Custom function to generate label text with item and index access</td>
							<td><span class="badge bg-warning">1.4.0+</span></td>
						</tr>
						<tr>
							<td><code>onItemChange</code></td>
							<td><code>(index: number) => void</code></td>
							<td><code>undefined</code></td>
							<td>Callback fired when selection changes</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>disableThumbRender</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Disable default thumb rendering</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<p class="text-muted">
				<small>* Required property</small>
			</p>
		</div>

		<!-- Snippets -->
		<div class="mb-5">
			<h3 class="mb-4">🎭 Template Snippets</h3>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th style="width: 23%">Snippet</th>
							<th style="width: 32%">Parameters</th>
							<th style="width: 32%">Description</th>
							<th style="width: 13%">Version</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>children</code></td>
							<td><code>currentIndex: number<br>item: any<br>isSelected: boolean</code></td>
							<td>Custom content snippet for option areas</td>
							<td><span class="badge bg-primary">1.0.0+</span></td>
						</tr>
						<tr>
							<td><code>thumbTemplate</code></td>
							<td><code>currentIndex: number<br>currentItem: any<br>itemsCount: number</code></td>
							<td>Custom thumb content snippet</td>
							<td><span class="badge bg-info">1.2.0+</span></td>
						</tr>
						<tr>
							<td><code>labelTemplate</code></td>
							<td><code>currentIndex: number<br>item: any<br>isSelected: boolean</code></td>
							<td>Custom label template snippet</td>
							<td><span class="badge bg-success">1.3.0+</span></td>
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
					<h5>Basic Multi-Option</h5>
					<CodeBlock
						codeContent={`<script>
  let selected = $state(1);
  const options = ['Small', 'Medium', 'Large'];
</script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true} />
<p>Selected: {options[selected]}</p>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Custom Styling per Option</h5>
					<CodeBlock
						codeContent={`<script>
  const styles = [
    { backgroundColor: '#ffebee', thumbColor: '#f44336' },
    { backgroundColor: '#e8f5e8', thumbColor: '#4caf50' },
    { backgroundColor: '#e3f2fd', thumbColor: '#2196f3' }
  ];
</script>

<MultiSwitch
  items={['Low', 'Medium', 'High']}
  itemStyles={styles} />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Custom Label Template</h5>
					<CodeBlock
						codeContent={`<MultiSwitch
  bind:selectedIndex={selected}
  items={plans}
  shouldDisplayLabels={true}>
  {#snippet labelTemplate({ item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold {isSelected ? 'text-primary' : ''}">
        {item?.name || ''}
      </div>
      <small class="text-muted">{item?.price || ''}</small>
    </div>
  {/snippet}
</MultiSwitch>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Vertical with Custom Content</h5>
					<CodeBlock
						codeContent={`<MultiSwitch
  bind:selectedIndex={selected}
  items={themes}
  orientation="vertical"
  size={80}>
  {#snippet children({ item, isSelected })}
    <div class="text-center h-100 d-flex align-items-center justify-content-center">
      <div style="font-size: 1.5rem;">{item?.icon || ''}</div>
    </div>
  {/snippet}
</MultiSwitch>`}
						languageType="svelte"
					/>
				</div>
			</div>
		</div>

		<!-- Label Positioning -->
		<div class="mb-5">
			<h3 class="mb-4">🏷️ Label Positioning & Rendering</h3>
			<div class="alert alert-info">
				<strong>💡 New in v1.4.0:</strong> Use <code>labelRenderMode="block"</code> for automatic spacing,
				or stick with <code>labelRenderMode="absolute"</code> (default) for precise control with manual padding.
			</div>
			<div class="alert alert-warning">
				<strong>⚠️ Absolute Mode:</strong> Labels are absolutely positioned and don't reserve space in the layout.
				Add appropriate padding to prevent overlap:
			</div>

			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th>Position</th>
							<th>Required Padding</th>
							<th>Works With</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>top</code></td>
							<td><code>padding-top: 3rem</code></td>
							<td>Horizontal & Vertical</td>
						</tr>
						<tr>
							<td><code>bottom</code></td>
							<td><code>padding-bottom: 2.5rem</code></td>
							<td>Horizontal & Vertical</td>
						</tr>
						<tr>
							<td><code>left</code></td>
							<td><code>padding-left: 5rem</code></td>
							<td>Vertical only</td>
						</tr>
						<tr>
							<td><code>right</code></td>
							<td><code>padding-right: 6-8rem</code></td>
							<td>Vertical only</td>
						</tr>
					</tbody>
				</table>
			</div>

			<CodeBlock
				codeContent={`<!-- Absolute mode - manual spacing required -->
<div style="padding-bottom: 2.5rem;">
  <MultiSwitch
    items={options}
    shouldDisplayLabels={true}
    labelPosition="bottom"
    labelRenderMode="absolute" />
</div>

<!-- Block mode - automatic spacing -->
<MultiSwitch
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  labelRenderMode="block" />`}
				languageType="svelte"
			/>
		</div>

		<!-- Label Content Features (v1.4.0+) -->
		<div class="mb-5">
			<h3 class="mb-4">🔤 Label Content Features (v1.4.0+)</h3>
			<p>Advanced label text handling with automatic extraction from object properties or custom functions.</p>

			<h5>Label Priority System</h5>
			<ol>
				<li><strong>labelMember</strong> - Extract text from object property</li>
				<li><strong>labelCallback</strong> - Custom function with item and index access</li>
				<li><strong>labelTemplate</strong> - Full custom rendering control</li>
				<li><strong>Default</strong> - "Option 1", "Option 2", etc.</li>
			</ol>

			<div class="row g-4">
				<div class="col-lg-6">
					<h6>Object Property Extraction</h6>
					<CodeBlock
						codeContent={`<script>
  const products = [
    { name: 'Basic', price: 10 },
    { name: 'Pro', price: 25 },
    { name: 'Enterprise', price: 99 }
  ];
</script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={products}
  labelMember="name"
  shouldDisplayLabels={true}
  labelRenderMode="block" />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h6>Custom Label Function</h6>
					<CodeBlock
						codeContent={`<script>
  const plans = [
    { tier: 'Basic', price: 9, features: 3 },
    { tier: 'Pro', price: 29, features: 10 },
    { tier: 'Enterprise', price: 99, features: 25 }
  ];
</script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={plans}
  labelCallback={(item, index) => \`\${item.tier} - $\${item.price}/mo\`}
  shouldDisplayLabels={true}
  labelRenderMode="block" />`}
						languageType="svelte"
					/>
				</div>
			</div>

			<div class="alert alert-success mt-3">
				<strong>💡 Clickable Labels:</strong> In vertical mode with left/right label positions,
				labels become clickable when no <code>thumbTemplate</code> is defined. Click any label to jump directly to that option!
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

// Label Variables
$label-gap: 8px;
$label-font-size: 12px;

// Color Variables
$switch-bg-off: #ccc;
$switch-bg-on: #4299e1;
$thumb-bg: white;
$focus-color: rgba(66, 153, 225, 0.5);
$default-label-color: #666;
$default-label-active-color: #333;
$default-label-font-weight: normal;
$default-label-active-font-weight: bold;

// Multi-switch specific
$multi-switch-bg: #f5f5f5;
$multi-switch-active-bg: #4299e1;

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
								<li>✅ Keyboard navigation (Arrow keys, Home, End)</li>
								<li>✅ Focus management with visible indicators</li>
								<li>✅ ARIA attributes (role, aria-selected)</li>
								<li>✅ Screen reader support</li>
								<li>✅ Disabled state handling</li>
								<li>✅ Proper tab order</li>
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
								<li>🎯 Use semantic option descriptions</li>
								<li>🎯 Test with screen readers</li>
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
							<td><code>(props: Partial&lt;MultiSwitchProps&gt;) => void</code></td>
							<td>Programmatically update component properties</td>
						</tr>
					</tbody>
				</table>
			</div>

			<CodeBlock
				codeContent={`// Get component reference
let multiSwitchRef;

// Update multiple properties including v1.4.0+ features
multiSwitchRef.update({
  selectedIndex: 2,
  isDisabled: false,
  size: 60,
  shouldDisplayLabels: true,
  labelRenderMode: 'block',
  labelPosition: 'bottom',
  labelMember: 'displayName',
  itemStyles: [
    { thumbColor: '#10b981' },
    { thumbColor: '#f59e0b' },
    { thumbColor: '#ef4444' }
  ]
});`}
				languageType="javascript"
			/>
		</div>

		<!-- Common Patterns -->
		<div class="mb-5">
			<h3 class="mb-4">🎯 Common Usage Patterns</h3>

			<div class="row g-4">
				<div class="col-lg-6">
					<h5>Settings Selection</h5>
					<CodeBlock
						codeContent={`<script>
  let quality = $state(1);
  const qualityOptions = ['Low', 'Medium', 'High', 'Ultra'];
</script>

<MultiSwitch
  bind:selectedIndex={quality}
  items={qualityOptions}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  size={50} />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Navigation Tabs</h5>
					<CodeBlock
						codeContent={`<script>
  let activeTab = $state(0);
  const tabs = ['Home', 'About', 'Services', 'Contact'];

  const handleTabChange = (index) => {
    // Navigate to different sections
    scrollToSection(tabs[index].toLowerCase());
  };
</script>

<MultiSwitch
  bind:selectedIndex={activeTab}
  items={tabs}
  onSelectionChange={handleTabChange}
  shouldDisplayLabels={true}
  size={40} />`}
						languageType="svelte"
					/>
				</div>
			</div>
		</div>
	</div>
</DocLayout>