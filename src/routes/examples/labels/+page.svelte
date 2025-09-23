<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { MultiSwitch } from '@keenmate/svelte-switch';

	// Demo states
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

	// Demo data
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

	// New label features demo data
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

	// Complex priority demo data
	const complexItems = [
		{ displayName: 'Custom Label', fallbackName: 'Fallback 1', id: 1 },
		{ displayName: 'Another Label', fallbackName: 'Fallback 2', id: 2 },
		{ displayName: 'Third Label', fallbackName: 'Fallback 3', id: 3 }
	];
</script>

<DocLayout
	titleText="Label Examples"
	descriptionText="Learn how to customize and position labels for MultiSwitch components">

	<div>
		<!-- Label Positioning -->
		<ShowcaseSection
			titleText="Label Positioning"
			subtitleText="Control where labels appear relative to the switch"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Position Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<!-- Top Labels -->
					<div class="switch-demo" style="padding-top: 3rem;">
						<span class="switch-label">Top Labels:</span>
						<MultiSwitch
							bind:selectedIndex={topLabelsIndex}
							items={modes}
							shouldDisplayLabels={true}
							labelPosition="top"
							size={50} />
					</div>

					<!-- Bottom Labels (default) -->
					<div class="switch-demo" style="padding-bottom: 2.5rem;">
						<span class="switch-label">Bottom Labels:</span>
						<MultiSwitch
							bind:selectedIndex={bottomLabelsIndex}
							items={modes}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							size={50} />
					</div>

					<!-- Left Labels (vertical only) -->
					<div class="switch-demo">
						<span class="switch-label">Left Labels:</span>
						<div style="padding-left: 5rem;">
							<MultiSwitch
								bind:selectedIndex={leftLabelsIndex}
								items={temperatures}
								shouldDisplayLabels={true}
								labelPosition="left"
								orientation="vertical"
								size={60} />
						</div>
					</div>

					<!-- Right Labels (vertical only) -->
					<div class="switch-demo">
						<span class="switch-label">Right Labels:</span>
						<div style="padding-right: 8rem;">
							<MultiSwitch
								bind:selectedIndex={rightLabelsIndex}
								items={temperatures}
								shouldDisplayLabels={true}
								labelPosition="right"
								orientation="vertical"
								size={60} />
						</div>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Top labels - add padding-top to container -->
<div style="padding-top: 3rem;">
  <MultiSwitch
    bind:selectedIndex={selected}
    items={options}
    shouldDisplayLabels={true}
    labelPosition="top"
    size={50} />
</div>

<!-- Bottom labels - add padding-bottom to container -->
<div style="padding-bottom: 2.5rem;">
  <MultiSwitch
    bind:selectedIndex={selected}
    items={options}
    shouldDisplayLabels={true}
    labelPosition="bottom"
    size={50} />
</div>

<!-- Left labels - wrap switch in padded container -->
<span class="switch-label">Left Labels:</span>
<div style="padding-left: 5rem;">
  <MultiSwitch
    bind:selectedIndex={selected}
    items={options}
    shouldDisplayLabels={true}
    labelPosition="left"
    orientation="vertical"
    size={60} />
</div>

<!-- Right labels - wrap switch in padded container -->
<span class="switch-label">Right Labels:</span>
<div style="padding-right: 8rem;">
  <MultiSwitch
    bind:selectedIndex={selected}
    items={options}
    shouldDisplayLabels={true}
    labelPosition="right"
    orientation="vertical"
    size={60} />
</div>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Position Options</h4>
					<ul>
						<li><code>top</code> - Above the switch (needs padding-top)</li>
						<li><code>bottom</code> - Below the switch (needs padding-bottom)</li>
						<li><code>left</code> - To the left (vertical only, needs padding-left)</li>
						<li><code>right</code> - To the right (vertical only, needs padding-right)</li>
					</ul>
					<h4>⚠️ Important: Spacing</h4>
					<p>
						<strong>By default, labels are absolutely positioned</strong> and don't reserve space in the layout.
						Add appropriate padding to the container in all directions to prevent overlap with other content.
						Alternatively, use <code>labelRenderMode="block"</code> for automatic spacing.
					</p>
					<h4>Recommended Padding</h4>
					<ul>
						<li><strong>Top:</strong> 3rem padding-top</li>
						<li><strong>Bottom:</strong> 2.5rem padding-bottom</li>
						<li><strong>Left:</strong> 5rem padding-left</li>
						<li><strong>Right:</strong> 6-8rem padding-right</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Label Render Mode -->
		<ShowcaseSection
			titleText="Label Render Mode"
			subtitleText="Choose between absolute and block positioning for labels"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Render Mode Comparison"
			demoColumnHeight="500px">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<!-- Absolute Mode (Default) -->
					<div>
						<h5 class="mb-3">Absolute Mode (Default)</h5>
						<div class="border p-3 mb-2" style="background: #f8f9fa;">
							<div class="text-muted mb-2">⚠️ Labels don't take up space - need manual padding</div>
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
							<div class="text-muted mt-2">Next element would overlap without padding!</div>
						</div>
					</div>

					<!-- Block Mode -->
					<div>
						<h5 class="mb-3">Block Mode (New)</h5>
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
							<div class="text-success mt-2">Next element flows naturally - no padding needed!</div>
						</div>
					</div>

					<!-- Block Mode with Vertical Orientation -->
					<div>
						<h5 class="mb-3">Block Mode - Vertical</h5>
						<div class="d-flex gap-4">
							<div class="border p-3" style="background: #f8f9fa;">
								<div class="text-success mb-2">✅ Works great with vertical switches</div>
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
								<div class="text-warning mb-2">⚠️ Absolute mode needs padding</div>
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
					codeContent={`<!-- Block mode - labels take up space automatically -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  labelRenderMode="block"
  size={60} />

<!-- Absolute mode (default) - needs manual padding -->
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
  size={60} />

<!-- Comparison: absolute vs block -->
<div class="d-flex gap-4">
  <!-- Block mode: no padding needed -->
  <MultiSwitch
    items={items}
    labelRenderMode="block"
    shouldDisplayLabels={true} />

  <!-- Absolute mode: padding required -->
  <div style="padding-bottom: 2rem;">
    <MultiSwitch
      items={items}
      labelRenderMode="absolute"
      shouldDisplayLabels={true} />
  </div>
</div>`}
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
					<h4>When to Use Block Mode</h4>
					<ul>
						<li>Dynamic content where padding is hard to predict</li>
						<li>Simpler layouts without overlapping elements</li>
						<li>When you want automatic spacing</li>
						<li>Responsive designs that adapt to content</li>
					</ul>
					<h4>When to Use Absolute Mode</h4>
					<ul>
						<li>Precise control over label positioning</li>
						<li>Complex layouts with overlapping elements</li>
						<li>Fixed-size components</li>
						<li>Backwards compatibility (default behavior)</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Label Content Features (v1.4.0+) -->
		<ShowcaseSection
			className="mt-3"
			titleText="Label Content Features (v1.4.0+)"
			subtitleText="Advanced label text handling with labelMember, labelCallback, and clickable labels"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Feature Details"
			demoColumnHeight="600px">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<!-- labelMember Demo -->
					<div>
						<h5 class="mb-3">1. labelMember Property</h5>
						<div class="switch-demo">
							<span class="switch-label">Product Sizes (using labelMember="name"):</span>
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

					<!-- labelCallback Demo -->
					<div>
						<h5 class="mb-3">2. labelCallback Function</h5>
						<div class="switch-demo">
							<span class="switch-label">Subscription Plans (using labelCallback):</span>
							<MultiSwitch
								bind:selectedIndex={labelCallbackIndex}
								items={subscriptionPlans}
								labelCallback={(item, index) => `${item.tier} - $${item.monthlyPrice}/mo`}
								shouldDisplayLabels={true}
								labelPosition="bottom"
								labelRenderMode="block"
								size={80} />
						</div>
					</div>

					<!-- Clickable Labels Demo -->
					<div>
						<h5 class="mb-3">3. Clickable Labels (Vertical Mode)</h5>
						<div class="switch-demo">
							<span class="switch-label">Server Locations (click labels to navigate):</span>
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
								<div class="alert alert-info small">
									<strong>💡 Try it:</strong> Click any city label to jump directly to that server!
									<br><small class="text-muted">Labels are clickable in vertical mode when no thumbTemplate is used.</small>
								</div>
							</div>
						</div>
					</div>

					<!-- Priority Demo -->
					<div>
						<h5 class="mb-3">4. Label Priority System</h5>
						<div class="row g-3">
							<div class="col-md-6">
								<div class="switch-demo">
									<small class="text-muted">Priority 1: labelMember</small>
									<MultiSwitch
										bind:selectedIndex={priorityDemoIndex}
										items={complexItems}
										labelMember="displayName"
										shouldDisplayLabels={true}
										labelPosition="bottom"
										labelRenderMode="block"
										size={50} />
								</div>
							</div>
							<div class="col-md-6">
								<div class="switch-demo">
									<small class="text-muted">Priority 2: labelCallback (if no labelMember)</small>
									<MultiSwitch
										bind:selectedIndex={priorityDemoIndex}
										items={complexItems}
										labelCallback={(item, index) => `Computed: ${item.fallbackName}`}
										shouldDisplayLabels={true}
										labelPosition="bottom"
										labelRenderMode="block"
										size={50} />
								</div>
							</div>
						</div>
						<div class="mt-2">
							<small class="text-muted">Without either property: defaults to "Option 1", "Option 2", etc.</small>
						</div>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  // Sample data structures
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
</script>

<!-- 1. labelMember: Extract text from object property -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={productSizes}
  labelMember="name"
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<!-- 2. labelCallback: Custom function with item access -->
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
  1. labelMember (if property exists on item)
  2. labelCallback (if function provided)
  3. labelTemplate (complete custom control)
  4. Default: "Option 1", "Option 2", etc.
-->`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>New in v1.4.0</h4>
					<p>Enhanced label system with automatic text extraction and interactive features.</p>

					<h4>1. labelMember Property</h4>
					<ul>
						<li>Extracts label text from object property</li>
						<li>Example: <code>labelMember="name"</code> reads <code>item.name</code></li>
						<li>Perfect for arrays of objects</li>
						<li>Null-safe: skips if property doesn't exist</li>
					</ul>

					<h4>2. labelCallback Function</h4>
					<ul>
						<li>Custom function: <code>(item: any, index: number) => string</code></li>
						<li>Access to both item data and index</li>
						<li>Ideal for computed labels or formatting</li>
						<li>Can combine multiple object properties</li>
					</ul>

					<h4>3. Clickable Labels</h4>
					<ul>
						<li>Available in vertical orientation with left/right positions</li>
						<li>Only active when no <code>thumbTemplate</code> is defined</li>
						<li>Click any label to jump directly to that option</li>
						<li>Visual hover effects indicate interactivity</li>
					</ul>

					<h4>Label Priority System</h4>
					<ol>
						<li><strong>labelMember</strong> - Object property extraction</li>
						<li><strong>labelCallback</strong> - Custom function</li>
						<li><strong>labelTemplate</strong> - Full custom rendering</li>
						<li><strong>Default</strong> - "Option 1", "Option 2", etc.</li>
					</ol>

					<h4>Best Practices</h4>
					<ul>
						<li>Use <code>labelMember</code> for simple object properties</li>
						<li>Use <code>labelCallback</code> for computed or formatted text</li>
						<li>Use <code>labelTemplate</code> for rich content (HTML, styling)</li>
						<li>Combine with <code>labelRenderMode="block"</code> for easier layouts</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Custom Label Templates -->
		<ShowcaseSection
			titleText="Custom Label Templates"
			subtitleText="Rich label content with custom templates"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Template Features">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<!-- Quality Settings with custom labels -->
					<div class="switch-demo">
						<span class="switch-label">Quality Settings:</span>
						<MultiSwitch
							bind:selectedIndex={qualityIndex}
							items={qualitySettings}
							size={60}
							shouldDisplayLabels={true}
							labelPosition="right"
							orientation="vertical">
							{#snippet labelTemplate({ currentIndex, item, isSelected })}
								<div class="ms-3 d-flex align-items-center gap-2">
									<span class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name || ''}</span>
									<span class="small text-muted">•</span>
									<span class="small text-muted">{item?.resolution || ''}</span>
									<span class="small text-muted">•</span>
									<span class="small text-muted" style="opacity: 0.7">{item?.size || ''}</span>
								</div>
							{/snippet}
						</MultiSwitch>
					</div>

					<!-- Status with colored labels -->
					<div class="switch-demo">
						<span class="switch-label">System Status:</span>
						<MultiSwitch
							bind:selectedIndex={customLabelsIndex}
							items={statusOptions}
							size={70}
							shouldDisplayLabels={true}
							labelPosition="bottom">
							{#snippet labelTemplate({ currentIndex, item, isSelected })}
								<div class="text-center mt-2">
									<div class="d-flex align-items-center justify-content-center gap-1">
										<span>{item?.icon || ''}</span>
										<span class="fw-bold" style="color: {isSelected ? item?.color : '#6b7280'}">
											{item?.label || ''}
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
</script>

<!-- Quality with detailed info -->
<MultiSwitch
  bind:selectedIndex={qualityIndex}
  items={qualitySettings}
  size={60}
  shouldDisplayLabels={true}
  labelPosition="right"
  orientation="vertical">
  {#snippet labelTemplate({ currentIndex, item, isSelected })}
    <div class="ms-3 d-flex align-items-center gap-2">
      <span class="fw-bold {isSelected ? 'text-primary' : ''}">
        {item?.name || ''}
      </span>
      <span class="small text-muted">•</span>
      <span class="small text-muted">{item?.resolution || ''}</span>
      <span class="small text-muted">•</span>
      <span class="small text-muted" style="opacity: 0.7">
        {item?.size || ''}
      </span>
    </div>
  {/snippet}
</MultiSwitch>

<!-- Status with colored icons -->
<MultiSwitch
  bind:selectedIndex={statusIndex}
  items={statusOptions}
  shouldDisplayLabels={true}
  labelPosition="bottom">
  {#snippet labelTemplate({ currentIndex, item, isSelected })}
    <div class="text-center mt-2">
      <div class="d-flex align-items-center justify-content-center gap-1">
        <span>{item?.icon || ''}</span>
        <span class="fw-bold" style="color: {isSelected ? item?.color : '#6b7280'}">
          {item?.label || ''}
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
					<h4>labelTemplate Snippet</h4>
					<p>
						The <code>labelTemplate</code> snippet allows complete customization
						of how labels are rendered for each option.
					</p>
					<h4>Template Parameters</h4>
					<ul>
						<li><code>currentIndex</code> - Index of this item</li>
						<li><code>item</code> - The item data object</li>
						<li><code>isSelected</code> - Boolean for selection state</li>
					</ul>
					<h4>Use Cases</h4>
					<ul>
						<li>Multi-line labels with descriptions</li>
						<li>Icons with text</li>
						<li>Conditional content based on selection</li>
						<li>Custom styling and colors</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Show/Hide Labels -->
		<ShowcaseSection
			titleText="Label Visibility"
			subtitleText="Control when to show or hide labels"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Visibility Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">With Labels:</span>
						<MultiSwitch
							bind:selectedIndex={basicLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={true}
							size={50} />
						</div>

					<div class="switch-demo">
						<span class="switch-label">Without Labels:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={false}
							size={50} />
						</div>

					<div class="switch-demo">
						<span class="switch-label">Icons Only:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={['👍', '👎', '🤷']}
							shouldDisplayLabels={false}
							size={60}>
							{#snippet children({ currentIndex, item, isSelected })}
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
					codeContent={`<!-- With labels (default) -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  size={50} />

<!-- Without labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={false}
  size={50} />

<!-- Icons only, no labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={['👍', '👎', '🤷']}
  shouldDisplayLabels={false}
  size={60}>
  {#snippet children({ currentIndex, item, isSelected })}
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
					<h4>Accessibility Note</h4>
					<p>
						When hiding labels, ensure the options are still understandable
						through context, tooltips, or nearby text.
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
							<h5>🎯 Positioning Tips</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Add padding for top/left positions</li>
								<li>✅ Consider viewport constraints</li>
								<li>✅ Test on different screen sizes</li>
								<li>✅ Match position to layout flow</li>
								<li>✅ Be consistent across your app</li>
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
							<p>Customize colors and appearance</p>
							<a href="/examples/styling" class="btn btn-primary">Styling Examples</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">⚡</div>
							<h5>Advanced</h5>
							<p>Templates and complex features</p>
							<a href="/examples/advanced" class="btn btn-outline-primary">Advanced Examples</a>
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