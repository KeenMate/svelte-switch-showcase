<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { MultiSwitch } from '@keenmate/svelte-switch';

	let basicLabelsIndex = $state(1);
	let topLabelsIndex = $state(0);
	let bottomLabelsIndex = $state(1);
	let leftLabelsIndex = $state(2);
	let rightLabelsIndex = $state(1);
	let customLabelsIndex = $state(1);
	let qualityIndex = $state(2);
	let noLabelsIndex = $state(1);
	let absoluteModeIndex = $state(1);
	let blockModeIndex = $state(1);
	let blockModeVerticalIndex = $state(1);
	let labelMemberIndex = $state(1);
	let labelCallbackIndex = $state(0);
	let clickableLabelsIndex = $state(2);
	let priorityDemoIndex = $state(1);

	const basicOptions = ['Option A', 'Option B', 'Option C'];
	const modes = ['Easy', 'Normal', 'Hard', 'Expert'];
	const temperatures = ['Cold', 'Cool', 'Warm', 'Hot'];

	const qualitySettings = [
		{ name: 'Low', resolution: '480p', size: '~200MB' },
		{ name: 'Medium', resolution: '720p', size: '~500MB' },
		{ name: 'High', resolution: '1080p', size: '~1GB' },
		{ name: 'Ultra', resolution: '4K', size: '~4GB' }
	];

	const statusOptions = [
		{ label: 'Offline', icon: '🔴', color: '#ef4444' },
		{ label: 'Connecting', icon: '🟡', color: '#f59e0b' },
		{ label: 'Online', icon: '🟢', color: '#10b981' }
	];

	const productSizes = [
		{ name: 'Small', code: 'S', price: 15 },
		{ name: 'Medium', code: 'M', price: 20 },
		{ name: 'Large', code: 'L', price: 25 },
		{ name: 'X-Large', code: 'XL', price: 30 }
	];

	const subscriptionPlans = [
		{ tier: 'Basic', monthlyPrice: 9, features: 3 },
		{ tier: 'Pro', monthlyPrice: 29, features: 10 },
		{ tier: 'Enterprise', monthlyPrice: 99, features: 25 }
	];

	const serverLocations = [
		{ city: 'New York', region: 'US East', latency: 12 },
		{ city: 'London', region: 'Europe', latency: 45 },
		{ city: 'Tokyo', region: 'Asia Pacific', latency: 89 },
		{ city: 'Sydney', region: 'Australia', latency: 156 }
	];

	const complexItems = [
		{ displayName: 'Custom Label', fallbackName: 'Fallback 1', id: 1 },
		{ displayName: 'Another Label', fallbackName: 'Fallback 2', id: 2 },
		{ displayName: 'Third Label', fallbackName: 'Fallback 3', id: 3 }
	];
</script>

<DocLayout
	titleText="Label Examples"
	descriptionText="Customize and position labels for MultiSwitch components">

	<div>
		<!-- Label Positioning -->
		<ShowcaseSection
			titleText="LB01 Label Positioning"
			subtitleText="Control where labels appear relative to the switch"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Position Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Top Labels:</span>
						<MultiSwitch
							bind:selectedIndex={topLabelsIndex}
							items={modes}
							shouldDisplayLabels={true}
							labelPosition="top"
							labelRenderMode="block" />
					</div>

					<div class="switch-demo">
						<span class="switch-label">Bottom Labels:</span>
						<MultiSwitch
							bind:selectedIndex={bottomLabelsIndex}
							items={modes}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block" />
					</div>

					<div class="switch-demo">
						<span class="switch-label">Left Labels:</span>
						<MultiSwitch
							bind:selectedIndex={leftLabelsIndex}
							items={temperatures}
							shouldDisplayLabels={true}
							labelPosition="left"
							labelRenderMode="block"
							orientation="vertical"
							size={60} />
					</div>

					<div class="switch-demo">
						<span class="switch-label">Right Labels:</span>
						<MultiSwitch
							bind:selectedIndex={rightLabelsIndex}
							items={temperatures}
							shouldDisplayLabels={true}
							labelPosition="right"
							labelRenderMode="block"
							orientation="vertical"
							size={60} />
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Top labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="top"
  labelRenderMode="block" />

<!-- Bottom labels (default) -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  labelRenderMode="block" />

<!-- Left labels (vertical only) -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="left"
  labelRenderMode="block"
  orientation="vertical"
  size={60} />

<!-- Right labels (vertical only) -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="right"
  labelRenderMode="block"
  orientation="vertical"
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Position Options</h4>
					<ul>
						<li><code>top</code> — Above the switch</li>
						<li><code>bottom</code> — Below the switch (default)</li>
						<li><code>left</code> — To the left (vertical only)</li>
						<li><code>right</code> — To the right (vertical only)</li>
					</ul>
					<h4>💡 Tip: Block render mode</h4>
					<p>
						All examples on this page use <code>labelRenderMode="block"</code>, which
						reserves space for labels in document flow. This is the recommended mode for
						most layouts.
					</p>
					<p>
						<code>labelRenderMode="absolute"</code> is the legacy default — labels are
						absolutely positioned and don't reserve space, requiring manual padding on
						the container. See the next section for the comparison.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Label Render Mode -->
		<ShowcaseSection
			titleText="LB02 Label Render Mode"
			subtitleText="Choose between absolute and block positioning for labels"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Render Mode Comparison">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div>
						<h5 class="mb-3">Absolute Mode (Default)</h5>
						<div class="border p-3 mb-2" style="background: #f8f9fa;">
							<div class="text-muted mb-2">⚠️ Labels don't reserve space — manual padding needed</div>
							<div class="switch-demo" style="padding-bottom: 2.5rem; background: white; border: 1px dashed #dee2e6;">
								<span class="switch-label">Absolute:</span>
								<MultiSwitch
									bind:selectedIndex={absoluteModeIndex}
									items={['Small', 'Medium', 'Large', 'X-Large']}
									shouldDisplayLabels={true}
									labelPosition="bottom"
									labelRenderMode="absolute"
									size={60} />
							</div>
							<div class="text-muted mt-2">Without padding-bottom, the next element overlaps the labels.</div>
						</div>
					</div>

					<div>
						<h5 class="mb-3">Block Mode</h5>
						<div class="border p-3 mb-2" style="background: #f8f9fa;">
							<div class="text-success mb-2">✅ Labels take up space automatically</div>
							<div class="switch-demo" style="background: white; border: 1px dashed #dee2e6;">
								<span class="switch-label">Block:</span>
								<MultiSwitch
									bind:selectedIndex={blockModeIndex}
									items={['Small', 'Medium', 'Large', 'X-Large']}
									shouldDisplayLabels={true}
									labelPosition="bottom"
									labelRenderMode="block"
									size={60} />
							</div>
							<div class="text-success mt-2">Next element flows naturally, no padding needed.</div>
						</div>
					</div>

					<div>
						<h5 class="mb-3">Block Mode — Vertical</h5>
						<div class="d-flex gap-4">
							<div class="border p-3" style="background: #f8f9fa;">
								<div class="text-success mb-2">✅ Block — works with vertical too</div>
								<MultiSwitch
									bind:selectedIndex={blockModeVerticalIndex}
									items={temperatures}
									shouldDisplayLabels={true}
									labelPosition="right"
									labelRenderMode="block"
									orientation="vertical"
									size={60} />
							</div>
							<div class="border p-3" style="background: #fff3cd;">
								<div class="text-warning mb-2">⚠️ Absolute — needs padding</div>
								<div style="padding-right: 4rem;">
									<MultiSwitch
										bind:selectedIndex={blockModeVerticalIndex}
										items={temperatures}
										shouldDisplayLabels={true}
										labelPosition="right"
										labelRenderMode="absolute"
										orientation="vertical"
										size={60} />
								</div>
							</div>
						</div>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Block mode — labels take up space automatically -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  labelRenderMode="block"
  size={60} />

<!-- Absolute mode (default) — needs manual padding -->
<div style="padding-bottom: 2.5rem;">
  <MultiSwitch
    bind:selectedIndex={selected}
    items={options}
    shouldDisplayLabels={true}
    labelPosition="bottom"
    labelRenderMode="absolute"
    size={60} />
</div>

<!-- Block mode with vertical orientation -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="right"
  labelRenderMode="block"
  orientation="vertical"
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Render Modes</h4>
					<dl>
						<dt><code>absolute</code> (default)</dt>
						<dd>
							<ul>
								<li>Labels use absolute positioning</li>
								<li>Don't affect layout flow</li>
								<li>Require manual padding</li>
								<li>More control over exact positioning</li>
							</ul>
						</dd>
						<dt><code>block</code></dt>
						<dd>
							<ul>
								<li>Labels use static positioning</li>
								<li>Take up space in document flow</li>
								<li>No padding needed</li>
								<li>Simpler to use, less flexible</li>
							</ul>
						</dd>
					</dl>
					<h4>Recommendation</h4>
					<p>
						Use <code>block</code> for most layouts; reach for <code>absolute</code>
						only when you need fixed-position label overlay (e.g., compact toolbars).
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Label Content Features -->
		<ShowcaseSection
			titleText="LB03 Label Content (labelMember & labelCallback)"
			subtitleText="Automatic label text from object items, plus clickable per-step labels"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Feature Details">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div>
						<h5 class="mb-3">1. labelMember Property</h5>
						<div class="switch-demo">
							<span class="switch-label">Product Sizes (labelMember="name"):</span>
							<MultiSwitch
								bind:selectedIndex={labelMemberIndex}
								items={productSizes}
								labelMember="name"
								shouldDisplayLabels={true}
								labelPosition="bottom"
								labelRenderMode="block"
								size={70} />
						</div>
					</div>

					<div>
						<h5 class="mb-3">2. labelCallback Function</h5>
						<div class="switch-demo">
							<span class="switch-label">Subscription Plans (labelCallback):</span>
							<MultiSwitch
								bind:selectedIndex={labelCallbackIndex}
								items={subscriptionPlans}
								labelCallback={(item, index) => `${item?.tier ?? ''} - $${item?.monthlyPrice ?? 0}/mo`}
								shouldDisplayLabels={true}
								labelPosition="bottom"
								labelRenderMode="block"
								size={80} />
						</div>
					</div>

					<div>
						<h5 class="mb-3">3. Clickable Labels (Vertical Mode)</h5>
						<div class="switch-demo">
							<span class="switch-label">Server Locations:</span>
							<div class="d-flex gap-4 align-items-start">
								<MultiSwitch
									bind:selectedIndex={clickableLabelsIndex}
									items={serverLocations}
									labelMember="city"
									shouldDisplayLabels={true}
									labelPosition="right"
									labelRenderMode="block"
									orientation="vertical"
									size={60} />
								<div class="alert alert-info small mb-0">
									<strong>💡 Try it:</strong> Click any city label to jump directly to that server.
									<br><small class="text-muted">Per-step labels become real <code>&lt;button&gt;</code>s when no <code>thumb</code> snippet is provided.</small>
								</div>
							</div>
						</div>
					</div>

					<div>
						<h5 class="mb-3">4. Label Priority System</h5>
						<div class="row g-3">
							<div class="col-md-6">
								<div class="switch-demo">
									<small class="text-muted">labelMember (highest priority)</small>
									<MultiSwitch
										bind:selectedIndex={priorityDemoIndex}
										items={complexItems}
										labelMember="displayName"
										shouldDisplayLabels={true}
										labelPosition="bottom"
										labelRenderMode="block" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="switch-demo">
									<small class="text-muted">labelCallback (when no labelMember)</small>
									<MultiSwitch
										bind:selectedIndex={priorityDemoIndex}
										items={complexItems}
										labelCallback={(item, index) => `Computed: ${item?.fallbackName ?? ''}`}
										shouldDisplayLabels={true}
										labelPosition="bottom"
										labelRenderMode="block" />
								</div>
							</div>
						</div>
						<div class="mt-2">
							<small class="text-muted">Without either: defaults to "Option 1", "Option 2", etc.</small>
						</div>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  const productSizes = [
    { name: 'Small', code: 'S', price: 15 },
    { name: 'Medium', code: 'M', price: 20 },
    { name: 'Large', code: 'L', price: 25 },
    { name: 'X-Large', code: 'XL', price: 30 }
  ];

  const subscriptionPlans = [
    { tier: 'Basic', monthlyPrice: 9, features: 3 },
    { tier: 'Pro', monthlyPrice: 29, features: 10 },
    { tier: 'Enterprise', monthlyPrice: 99, features: 25 }
  ];

  const serverLocations = [
    { city: 'New York', region: 'US East', latency: 12 },
    { city: 'London', region: 'Europe', latency: 45 },
    { city: 'Tokyo', region: 'Asia Pacific', latency: 89 }
  ];
<\/script>

<!-- 1. labelMember: Extract text from object property -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={productSizes}
  labelMember="name"
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<!-- 2. labelCallback: Custom function -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={subscriptionPlans}
  labelCallback={(item, index) => \`\${item.tier} - $\${item.monthlyPrice}/mo\`}
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<!-- 3. Clickable labels in vertical mode -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={serverLocations}
  labelMember="city"
  shouldDisplayLabels={true}
  labelPosition="right"
  orientation="vertical"
  labelRenderMode="block" />

<!-- Label priority (highest to lowest):
  1. label snippet (full custom rendering)
  2. labelMember (object property)
  3. labelCallback (computed string)
  4. Default: "Option 1", "Option 2", etc.
-->`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Object-aware label resolution</h4>
					<p>Both ways read structured data without writing a snippet.</p>

					<h4>1. labelMember</h4>
					<ul>
						<li>Extracts label text from an item property</li>
						<li>Example: <code>labelMember="name"</code> reads <code>item.name</code></li>
						<li>Null-safe: skips if property doesn't exist</li>
					</ul>

					<h4>2. labelCallback</h4>
					<ul>
						<li>Custom function: <code>(item: T, index: number) =&gt; string</code></li>
						<li>Access to both item data and index</li>
						<li>Ideal for computed or formatted labels</li>
					</ul>

					<h4>3. Clickable Labels</h4>
					<ul>
						<li>Available in vertical mode with left/right positions</li>
						<li>Active when no <code>thumb</code> snippet is provided</li>
						<li>Renders real <code>&lt;button&gt;</code> elements with keyboard activation</li>
					</ul>

					<h4>Label Priority</h4>
					<ol>
						<li><code>label</code> snippet (full custom)</li>
						<li><code>labelMember</code> (object property)</li>
						<li><code>labelCallback</code> (computed string)</li>
						<li>Default: "Option N"</li>
					</ol>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Custom Label Snippet -->
		<ShowcaseSection
			titleText="LB04 Custom label snippet"
			subtitleText="Rich label content via the label snippet (renamed from labelTemplate in 2.0)"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Snippet Features">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Quality Settings:</span>
						<MultiSwitch
							bind:selectedIndex={qualityIndex}
							items={qualitySettings}
							size={60}
							shouldDisplayLabels={true}
							labelPosition="right"
							labelRenderMode="block"
							orientation="vertical">
							{#snippet label({ index, item, isSelected })}
								<div class="ms-3 d-flex align-items-center gap-2">
									<span class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''}</span>
									<span class="small text-muted">•</span>
									<span class="small text-muted">{item?.resolution ?? ''}</span>
									<span class="small text-muted">•</span>
									<span class="small text-muted" style="opacity: 0.7">{item?.size ?? ''}</span>
								</div>
							{/snippet}
						</MultiSwitch>
					</div>

					<div class="switch-demo">
						<span class="switch-label">System Status:</span>
						<MultiSwitch
							bind:selectedIndex={customLabelsIndex}
							items={statusOptions}
							size={70}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block">
							{#snippet label({ index, item, isSelected })}
								<div class="text-center mt-2">
									<div class="d-flex align-items-center justify-content-center gap-1">
										<span>{item?.icon ?? ''}</span>
										<span class="fw-bold" style="color: {isSelected ? item?.color : '#6b7280'}">
											{item?.label ?? ''}
										</span>
									</div>
									{#if isSelected}
										<small class="text-muted">Active</small>
									{/if}
								</div>
							{/snippet}
						</MultiSwitch>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let qualityIndex = $state(2);
  let statusIndex = $state(1);

  const qualitySettings = [
    { name: 'Low', resolution: '480p', size: '~200MB' },
    { name: 'Medium', resolution: '720p', size: '~500MB' },
    { name: 'High', resolution: '1080p', size: '~1GB' },
    { name: 'Ultra', resolution: '4K', size: '~4GB' }
  ];

  const statusOptions = [
    { label: 'Offline', icon: '🔴', color: '#ef4444' },
    { label: 'Connecting', icon: '🟡', color: '#f59e0b' },
    { label: 'Online', icon: '🟢', color: '#10b981' }
  ];
<\/script>

<!-- Quality with detailed info -->
<MultiSwitch
  bind:selectedIndex={qualityIndex}
  items={qualitySettings}
  size={60}
  shouldDisplayLabels={true}
  labelPosition="right"
  labelRenderMode="block"
  orientation="vertical">
  {#snippet label({ index, item, isSelected })}
    <div class="ms-3 d-flex align-items-center gap-2">
      <span class="fw-bold {isSelected ? 'text-primary' : ''}">
        {item?.name ?? ''}
      </span>
      <span class="small text-muted">•</span>
      <span class="small text-muted">{item?.resolution ?? ''}</span>
      <span class="small text-muted">•</span>
      <span class="small text-muted" style="opacity: 0.7">
        {item?.size ?? ''}
      </span>
    </div>
  {/snippet}
</MultiSwitch>

<!-- Status with colored icons -->
<MultiSwitch
  bind:selectedIndex={statusIndex}
  items={statusOptions}
  shouldDisplayLabels={true}
  labelRenderMode="block">
  {#snippet label({ index, item, isSelected })}
    <div class="text-center mt-2">
      <div class="d-flex align-items-center justify-content-center gap-1">
        <span>{item?.icon ?? ''}</span>
        <span class="fw-bold" style="color: {isSelected ? item?.color : '#6b7280'}">
          {item?.label ?? ''}
        </span>
      </div>
      {#if isSelected}
        <small class="text-muted">Active</small>
      {/if}
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>label snippet (v2.0)</h4>
					<p>
						The <code>label</code> snippet (renamed from 1.x's <code>labelTemplate</code>)
						gives full control over per-item label rendering.
					</p>
					<h4>Snippet Parameters</h4>
					<ul>
						<li><code>index</code> — Index of this item (was <code>currentIndex</code>)</li>
						<li><code>item</code> — The item data (typed as <code>T | undefined</code>)</li>
						<li><code>isSelected</code> — Boolean for selection state</li>
					</ul>
					<h4>When to Use</h4>
					<ul>
						<li>Multi-line labels with descriptions</li>
						<li>Icons with text</li>
						<li>Conditional content based on selection</li>
						<li>Custom styling per state</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Show/Hide Labels -->
		<ShowcaseSection
			titleText="LB05 Label Visibility"
			subtitleText="Control when to show or hide labels"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Visibility Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">With Labels:</span>
						<MultiSwitch
							bind:selectedIndex={basicLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={true}
							labelRenderMode="block" />
					</div>

					<div class="switch-demo">
						<span class="switch-label">Without Labels:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={false} />
					</div>

					<div class="switch-demo">
						<span class="switch-label">Icons Only (segment snippet):</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={['👍', '👎', '🤷']}
							shouldDisplayLabels={false}
							size={60}>
							{#snippet segment({ index, item })}
								<div class="text-center fs-4">
									{item}
								</div>
							{/snippet}
						</MultiSwitch>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- With labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<!-- Without labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={false} />

<!-- Icons in each segment background, no labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={['👍', '👎', '🤷']}
  shouldDisplayLabels={false}
  size={60}>
  {#snippet segment({ index, item })}
    <div class="text-center fs-4">
      {item}
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>When to Hide Labels</h4>
					<ul>
						<li>When space is limited</li>
						<li>When using self-explanatory icons</li>
						<li>In compact UI designs</li>
						<li>When labels are shown elsewhere</li>
					</ul>
					<h4>Note: segment vs thumb</h4>
					<p>
						The icons example uses the <code>segment</code> snippet — it renders once
						per step background. Use <code>thumb</code> instead if you only want content
						inside the moving thumb.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Best Practices -->
		<div class="mt-3">
			<h2 class="mb-3">Label Best Practices</h2>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>📝 Content Guidelines</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Keep labels concise and clear</li>
								<li>✅ Use consistent terminology</li>
								<li>✅ Consider internationalization</li>
								<li>✅ Test with different text lengths</li>
								<li>✅ Ensure sufficient contrast</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>🎯 Layout Tips</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Default to <code>labelRenderMode="block"</code></li>
								<li>✅ Reach for <code>"absolute"</code> only when needed</li>
								<li>✅ Use <code>labelMember</code> for simple object items</li>
								<li>✅ Use <code>labelCallback</code> for computed strings</li>
								<li>✅ Use the <code>label</code> snippet for rich content</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Next Steps -->
		<div class="mt-3">
			<h2 class="mb-3">Next Steps</h2>
			<div class="row g-4">
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎨</div>
							<h5>Styling</h5>
							<p>Per-instance colors with itemStyles</p>
							<a href="/examples/styling" class="btn btn-primary">Styling Examples</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🌈</div>
							<h5>Theming</h5>
							<p>Cross-library --base-* cascade</p>
							<a href="/examples/theming" class="btn btn-outline-primary">Theming Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">📚</div>
							<h5>API Reference</h5>
							<p>Complete documentation</p>
							<a href="/api/multiswitch" class="btn btn-outline-primary">MultiSwitch API</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
