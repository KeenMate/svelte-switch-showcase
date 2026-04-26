<script lang="ts">
	import { DocLayout, CodeBlock } from '@keenmate/svelte-docs';
</script>

<DocLayout
	titleText="MultiSwitch API Reference"
	descriptionText="Complete API documentation for the MultiSwitch component (v2.0+)">

	<div class="py-4">
		<!-- Overview -->
		<div class="mb-5">
			<h2 class="mb-3">📚 MultiSwitch Component</h2>
			<p class="lead">
				A multi-step switch (3+ options) with Svelte 5 runes, snippets, and generic typing.
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
<\/script>

<MultiSwitch
  bind:selectedIndex
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block" />`}
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
							<td><code>selectedIndex</code></td>
							<td><code>number</code></td>
							<td><code>0</code></td>
							<td>Currently selected index (bindable via <code>bind:selectedIndex</code>)</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
						<tr>
							<td><code>items</code></td>
							<td><code>readonly T[] | null</code></td>
							<td><code>null</code></td>
							<td>Array of options. Generic over <code>T</code> — type flows through to all snippets and callbacks.</td>
							<td><span class="badge bg-warning">2.0+ generic</span></td>
						</tr>
						<tr>
							<td><code>itemsCount</code></td>
							<td><code>number</code></td>
							<td><code>0</code></td>
							<td>Number of steps (when not deriving from <code>items</code>)</td>
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
							<td>Named size or numeric pixels. Default changed from <code>50</code> to <code>"md"</code> in 2.0.</td>
							<td><span class="badge bg-warning">2.0+ named</span></td>
						</tr>
						<tr>
							<td><code>itemStyles</code></td>
							<td><code>StepStyle | StepStyle[]</code></td>
							<td><code>undefined</code></td>
							<td>Per-step styles. Object applies to every step; array applies per-step (length = items.length).</td>
							<td><span class="badge bg-primary">1.0+</span></td>
						</tr>
						<tr>
							<td><code>shouldDisplayLabels</code></td>
							<td><code>boolean</code></td>
							<td><code>false</code></td>
							<td>Show or hide option labels</td>
							<td><span class="badge bg-success">1.3+</span></td>
						</tr>
						<tr>
							<td><code>labelPosition</code></td>
							<td><code>"top" | "bottom" | "left" | "right"</code></td>
							<td><code>"bottom"</code></td>
							<td>Position of labels relative to the switch</td>
							<td><span class="badge bg-success">1.3+</span></td>
						</tr>
						<tr>
							<td><code>labelRenderMode</code></td>
							<td><code>"absolute" | "block"</code></td>
							<td><code>"absolute"</code></td>
							<td><code>"block"</code> reserves layout space; <code>"absolute"</code> overlays (needs manual padding)</td>
							<td><span class="badge bg-warning">1.4+</span></td>
						</tr>
						<tr>
							<td><code>labelMember</code></td>
							<td><code>keyof T | string</code></td>
							<td><code>undefined</code></td>
							<td>Property name to read from each item (e.g., <code>"name"</code> reads <code>item.name</code>)</td>
							<td><span class="badge bg-warning">1.4+</span></td>
						</tr>
						<tr>
							<td><code>labelCallback</code></td>
							<td><code>(item: T | undefined, index: number) =&gt; string</code></td>
							<td><code>undefined</code></td>
							<td>Custom function returning the label text for each item</td>
							<td><span class="badge bg-warning">1.4+</span></td>
						</tr>
						<tr>
							<td><code>onItemChange</code></td>
							<td><code>(index: number) =&gt; void</code></td>
							<td><code>undefined</code></td>
							<td>Callback fired when the selection changes</td>
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
						<code>thumb</code> snippet.
					</li>
					<li>
						<code>update()</code> instance method — Svelte 5 props are reactive; mutate
						the <code>$state</code> object passed to <code>mount()</code>.
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
							<th style="width: 18%">Snippet</th>
							<th style="width: 32%">Context</th>
							<th style="width: 35%">Role</th>
							<th style="width: 15%">Version</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>thumb</code></td>
							<td><code>{`{ index, item }`}</code></td>
							<td>Renders <strong>once</strong> inside the moving thumb. <code>index</code> = active index.</td>
							<td><span class="badge bg-warning">2.0+ split</span></td>
						</tr>
						<tr>
							<td><code>segment</code></td>
							<td><code>{`{ index, item, isSelected }`}</code></td>
							<td>Renders <strong>once per step background</strong>. Use for static per-step content.</td>
							<td><span class="badge bg-warning">2.0+ split</span></td>
						</tr>
						<tr>
							<td><code>label</code></td>
							<td><code>{`{ index, item, isSelected }`}</code></td>
							<td>Custom per-step label content. Renamed from <code>labelTemplate</code> in 2.0.</td>
							<td><span class="badge bg-warning">2.0+ renamed</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="alert alert-info">
				<strong>v2.0 snippet rewrite.</strong> 1.x had one ambiguous <code>children</code>
				snippet that ran in BOTH the moving thumb and each step background. 2.0 split it
				into <code>thumb</code> (one render) + <code>segment</code> (one render per step)
				so each snippet has one job. <code>labelTemplate</code> was also renamed to
				<code>label</code>. Snippet context shape unified:
				<code>currentIndex</code> → <code>index</code>,
				<code>currentItem</code> → <code>item</code>.
			</div>
		</div>

		<!-- Type Definitions -->
		<div class="mb-5">
			<h3 class="mb-4">📋 Type Definitions</h3>

			<h5>StepStyle interface</h5>
			<CodeBlock
				codeContent={`interface StepStyle {
  backgroundColor?: string;   // Step background colour
  thumbColor?: string;        // Thumb fill colour
  thumbBorderColor?: string;  // Thumb border colour
}`}
				languageType="typescript"
			/>

			<h5 class="mt-3">Generic items signature</h5>
			<CodeBlock
				codeContent={`// MultiSwitch.items is generic over T
type MultiSwitchItems<T> = readonly T[] | null;

// Snippet contexts (typed via T)
type ThumbContext<T>   = { index: number; item: T | undefined };
type SegmentContext<T> = { index: number; item: T | undefined; isSelected: boolean };
type LabelContext<T>   = { index: number; item: T | undefined; isSelected: boolean };

// labelCallback signature
type LabelCallback<T> = (item: T | undefined, index: number) => string;`}
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
<\/script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block" />
<p>Selected: {options[selected]}</p>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>Per-Step Styling</h5>
					<CodeBlock
						codeContent={`<script>
  const styles = [
    { backgroundColor: '#ffebee', thumbColor: '#f44336' },
    { backgroundColor: '#e8f5e8', thumbColor: '#4caf50' },
    { backgroundColor: '#e3f2fd', thumbColor: '#2196f3' }
  ];
<\/script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={['Low', 'Medium', 'High']}
  itemStyles={styles}
  shouldDisplayLabels={true}
  labelRenderMode="block" />`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>label snippet (rich content)</h5>
					<CodeBlock
						codeContent={`<MultiSwitch
  bind:selectedIndex={selected}
  items={plans}
  shouldDisplayLabels={true}
  labelRenderMode="block">
  {#snippet label({ index, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold {isSelected ? 'text-primary' : ''}">
        {item?.name ?? ''}
      </div>
      <small class="text-muted">{item?.price ?? ''}</small>
    </div>
  {/snippet}
</MultiSwitch>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>thumb + segment snippets</h5>
					<CodeBlock
						codeContent={`<MultiSwitch
  bind:selectedIndex={selected}
  items={themes}
  orientation="vertical"
  size={80}>
  {#snippet thumb({ index, item })}
    <div class="text-center fs-4">
      {item?.icon ?? ''}
    </div>
  {/snippet}
  {#snippet segment({ index, item, isSelected })}
    <small class="opacity-{isSelected ? '100' : '50'}">
      {item?.icon ?? ''}
    </small>
  {/snippet}
</MultiSwitch>`}
						languageType="svelte"
					/>
				</div>

				<div class="col-lg-6">
					<h5>labelMember (object property)</h5>
					<CodeBlock
						codeContent={`<script>
  const products = [
    { name: 'Basic', price: 10 },
    { name: 'Pro', price: 25 },
    { name: 'Enterprise', price: 99 }
  ];
<\/script>

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
					<h5>labelCallback (computed string)</h5>
					<CodeBlock
						codeContent={`<script>
  const plans = [
    { tier: 'Basic', price: 9, features: 3 },
    { tier: 'Pro', price: 29, features: 10 },
    { tier: 'Enterprise', price: 99, features: 25 }
  ];
<\/script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={plans}
  labelCallback={(item, index) =>
    \`\${item?.tier ?? ''} - $\${item?.price ?? 0}/mo\`}
  shouldDisplayLabels={true}
  labelRenderMode="block" />`}
						languageType="svelte"
					/>
				</div>
			</div>
		</div>

		<!-- Label Positioning -->
		<div class="mb-5">
			<h3 class="mb-4">🏷️ Label Positioning & Rendering</h3>
			<div class="alert alert-success">
				<strong>💡 Recommended:</strong> Use <code>labelRenderMode="block"</code> in
				most cases — it reserves layout space automatically. <code>"absolute"</code> is
				the legacy default and requires manual padding.
			</div>

			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="table-light">
						<tr>
							<th>Position</th>
							<th>Required (absolute mode only)</th>
							<th>Works With</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><code>top</code></td>
							<td><code>padding-top: 3rem</code></td>
							<td>Horizontal only</td>
						</tr>
						<tr>
							<td><code>bottom</code> (default)</td>
							<td><code>padding-bottom: 2.5rem</code></td>
							<td>Horizontal only</td>
						</tr>
						<tr>
							<td><code>left</code></td>
							<td><code>padding-left: 5rem</code></td>
							<td>Vertical only</td>
						</tr>
						<tr>
							<td><code>right</code></td>
							<td><code>padding-right: 6–8rem</code></td>
							<td>Vertical only</td>
						</tr>
					</tbody>
				</table>
			</div>

			<CodeBlock
				codeContent={`<!-- Block mode — automatic spacing (recommended) -->
<MultiSwitch
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  labelRenderMode="block" />

<!-- Absolute mode — manual padding required -->
<div style="padding-bottom: 2.5rem;">
  <MultiSwitch
    items={options}
    shouldDisplayLabels={true}
    labelPosition="bottom"
    labelRenderMode="absolute" />
</div>`}
				languageType="svelte"
			/>
		</div>

		<!-- Label Content Features -->
		<div class="mb-5">
			<h3 class="mb-4">🔤 Label Content (priority system)</h3>
			<p>
				Label text resolves through this priority chain (highest to lowest):
			</p>
			<ol>
				<li><strong>label snippet</strong> — full custom rendering, takes precedence over everything</li>
				<li><strong>labelMember</strong> — read text from object property</li>
				<li><strong>labelCallback</strong> — compute text from item + index</li>
				<li><strong>Default</strong> — <code>"Option 1"</code>, <code>"Option 2"</code>, ...</li>
			</ol>

			<div class="alert alert-success">
				<strong>💡 Clickable per-step labels:</strong> In vertical mode with
				<code>"left"</code>/<code>"right"</code> label positions, labels render as real
				<code>&lt;button&gt;</code> elements with keyboard activation. This activates only
				when no <code>thumb</code> snippet is provided.
			</div>
		</div>

		<!-- Theming -->
		<div class="mb-5">
			<h3 class="mb-4">🎨 Theming</h3>
			<p>
				v2.0 introduced a full theming layer (<code>--base-*</code> cascade +
				<code>--sw-*</code> per-instance overrides). See the dedicated
				<a href="/examples/theming">Theming</a> page for the live preset gallery.
			</p>
			<p>
				MultiSwitch-specific variables added in 2.0:
			</p>
			<ul>
				<li><code>--sw-step-bg</code> / <code>--sw-step-bg-active</code> — step segment surfaces</li>
				<li><code>--sw-label-color</code> / <code>--sw-label-active-color</code> — label colours</li>
				<li><code>--sw-label-hover-bg</code> / <code>--sw-label-hover-bg-active</code> — clickable label hover</li>
			</ul>
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
								<li>✅ Per-step labels are real <code>&lt;button&gt;</code>s</li>
								<li>✅ Focus ring with theme-aware colour</li>
								<li>✅ ARIA <code>role</code> + <code>aria-selected</code></li>
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
								<li>🎯 Provide a label or accessible name nearby</li>
								<li>🎯 Ensure sufficient colour contrast on themed surfaces</li>
								<li>🎯 Test keyboard navigation</li>
								<li>🎯 Consider reduced motion preferences</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
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
<\/script>

<MultiSwitch
  bind:selectedIndex={quality}
  items={qualityOptions}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  labelPosition="bottom" />`}
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
    scrollToSection(tabs[index].toLowerCase());
  };
<\/script>

<MultiSwitch
  bind:selectedIndex={activeTab}
  items={tabs}
  onItemChange={handleTabChange}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  size="sm" />`}
						languageType="svelte"
					/>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
