<script lang="ts">
	import { DocLayout, CodeBlock } from '@keenmate/svelte-docs';
</script>

<DocLayout
	titleText="Switch API Reference"
	descriptionText="Complete API documentation for the Switch component (v2.0+)">

	<div class="py-4">
		<!-- Overview -->
		<div class="mb-5">
			<h2 class="mb-3">📚 Switch Component</h2>
			<p class="lead">
				A binary switch component with Svelte 5 runes, snippets, and generic typing.
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
<\/script>

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
							<th style="width: 18%">Property</th>
							<th style="width: 28%">Type</th>
							<th style="width: 12%">Default</th>
							<th style="width: 32%">Description</th>
							<th style="width: 10%">Version</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>checked</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Current state of the switch (bindable via <code>bind:checked</code>)</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
						<tr>
							<td><code>isDisabled</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Disables interaction when true</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
						<tr>
							<td><code>orientation</code></td>
							<td><code>"horizontal" | "vertical"</code></td>
							<td><code>"horizontal"</code></td>
							<td>Layout direction</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
						<tr>
							<td><code>size</code></td>
							<td><code>"xs" | "sm" | "md" | "lg" | "xl" | number</code></td>
							<td><code>"md"</code></td>
							<td>Named size (31/33/35/38/41px) or numeric pixels (scale = size / 50). Default changed from <code>50</code> to <code>"md"</code> in 2.0.</td>
							<td><span class="badge bg-warning">2.0+ named</span></td>
						</tr>
						<tr>
							<td><code>items</code></td>
							<td><code>readonly [T, T] | null</code></td>
							<td><code>null</code></td>
							<td>Strict tuple of exactly 2 items for snippet access. Generic over <code>T</code>.</td>
							<td><span class="badge bg-warning">2.0+ tuple</span></td>
						</tr>
						<tr>
							<td><code>itemStyles</code></td>
							<td><code>StepStyle | StepStyle[]</code></td>
							<td><code>undefined</code></td>
							<td>Custom colours. Object applies to both states; array of length 2 applies per-state.</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
						<tr>
							<td><code>onToggle</code></td>
							<td><code>(checked: boolean) =&gt; void</code></td>
							<td><code>undefined</code></td>
							<td>Callback fired when state changes</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Removed in 2.0 -->
		<div class="mb-5">
			<h3 class="mb-4">❌ Removed in v2.0</h3>
			<div class="alert alert-warning">
				<ul class="mb-0">
					<li>
						<code>disableThumbRender</code> — no longer needed; just don't pass the
						<code>thumb</code> snippet if you want no thumb content.
					</li>
					<li>
						<code>update()</code> instance method — Svelte 5 props are reactive; mutate
						the <code>$state</code> object passed to <code>mount()</code> instead.
					</li>
				</ul>
			</div>
		</div>

		<!-- Snippets -->
		<div class="mb-5">
			<h3 class="mb-4">🎭 Snippets</h3>
			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th style="width: 23%">Snippet</th>
							<th style="width: 32%">Context</th>
							<th style="width: 35%">Description</th>
							<th style="width: 10%">Version</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>thumb</code></td>
							<td><code>{`{ index, item, isSelected }`}</code></td>
							<td>Custom content inside the moving thumb. <code>item</code> is typed as <code>T | undefined</code>.</td>
							<td><span class="badge bg-warning">2.0+ renamed from children/thumbTemplate</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="alert alert-info">
				<strong>v2.0 snippet rename.</strong> 1.x had two snippets (<code>children</code>
				and <code>thumbTemplate</code>); they collapsed into one (<code>thumb</code>) since
				they served the same role. Snippet context changed too: <code>currentIndex</code> →
				<code>index</code>, <code>currentItem</code> → <code>item</code>.
			</div>
		</div>

		<!-- Type Definitions -->
		<div class="mb-5">
			<h3 class="mb-4">📋 Type Definitions</h3>

			<h5>StepStyle interface</h5>
			<CodeBlock
				codeContent={`interface StepStyle {
  backgroundColor?: string;   // Track background colour
  thumbColor?: string;        // Thumb fill colour
  thumbBorderColor?: string;  // Thumb border colour
}`}
				languageType="typescript"
			/>

			<h5 class="mt-3">Generic items signature</h5>
			<CodeBlock
				codeContent={`// Switch.items is a strict 2-tuple, generic over T
type SwitchItems<T> = readonly [T, T] | null;

// Snippet context (typed via T)
type ThumbContext<T> = {
  index: number;
  item: T | undefined;
  isSelected: boolean;
};`}
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
<\/script>

<Switch bind:checked={isEnabled} />
<p>Status: {isEnabled ? 'ON' : 'OFF'}</p>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Custom Styling (per-instance)</h5>
					<CodeBlock
						codeContent={`<script>
  const customTheme = {
    backgroundColor: '#e3f2fd',
    thumbColor: '#1976d2',
    thumbBorderColor: '#0d47a1'
  };
<\/script>

<Switch
  bind:checked={value}
  itemStyles={customTheme} />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Custom thumb snippet</h5>
					<CodeBlock
						codeContent={`<Switch bind:checked={isDayMode} size={80}>
  {#snippet thumb()}
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
<\/script>

<Switch
  bind:checked={checked}
  onToggle={handleToggle} />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Named size (form-aligned)</h5>
					<CodeBlock
						codeContent={`<!-- Drops into pure-admin forms aligned with input heights -->
<Switch bind:checked={value} size="md" />

<!-- Other named sizes -->
<Switch bind:checked={value} size="xs" />  <!-- 31px -->
<Switch bind:checked={value} size="lg" />  <!-- 38px -->`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Vanilla JavaScript (mount + $state)</h5>
					<CodeBlock
						codeContent={`import { mount } from 'svelte';
import { Switch } from '@keenmate/svelte-switch';

const props = $state({ checked: false, size: 50 });
mount(Switch, {
  target: document.getElementById('host'),
  props
});

// Later — just mutate the state object
props.checked = true;
props.size = 80;`}
						languageType="javascript"
					/>
				</div>
			</div>
		</div>

		<!-- Theming -->
		<div class="mb-5">
			<h3 class="mb-4">🎨 Theming</h3>
			<p>
				v2.0 introduced a full theming layer. See the dedicated
				<a href="/examples/theming">Theming</a> page for the live preset gallery and
				variable list. Quick summary:
			</p>

			<CodeBlock
				codeContent={`/* Resolution order at every property:
   itemStyles data → --sw-* → --base-* → fallback */

/* App-wide theme — every nested switch picks it up */
:root {
  --base-accent-color: #6366f1;
  --base-primary-bg: #f3f4f6;
  --base-text-color-on-accent: #ffffff;
  --base-border-radius-sm: 1.2;     /* coefficient × --sw-rem */
  --base-shadow-sm: 0 2px 4px rgba(0,0,0,0.1);
}

/* Per-instance override */
<Switch style="--sw-bg-on: deeppink;" />`}
				languageType="css"
			/>

			<p class="mt-3 text-muted small">
				Full variable catalogue: <code>component-variables.manifest.json</code> at the
				package root.
			</p>
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
								<li>✅ Keyboard activation (Space, Enter)</li>
								<li>✅ Focus ring with theme-aware colour (<code>--sw-focus-color</code>)</li>
								<li>✅ ARIA <code>role="switch"</code> + <code>aria-checked</code></li>
								<li>✅ Screen reader support</li>
								<li>✅ Disabled state skips focus order</li>
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
								<li>🎯 Provide a label or accessible name nearby</li>
								<li>🎯 Ensure sufficient colour contrast on themed surfaces</li>
								<li>🎯 Test with keyboard navigation</li>
								<li>🎯 Consider reduced motion preferences</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
