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
</script>

<DocLayout
	titleText="Label Examples"
	descriptionText="Learn how to customize and position labels for MultiSwitch components">

	<div class="py-4">
		<!-- Label Positioning -->
		<ShowcaseSection
			titleText="Label Positioning"
			subtitleText="Control where labels appear relative to the switch"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Position Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-5">
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
						<strong>All labels are absolutely positioned</strong> and don't reserve space in the layout.
						Add appropriate padding to the container in all directions to prevent overlap with other content.
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
						<span class="switch-state">Selected: {basicOptions[basicLabelsIndex]}</span>
					</div>

					<div class="switch-demo">
						<span class="switch-label">Without Labels:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={false}
							size={50} />
						<span class="switch-state">Selected: {basicOptions[noLabelsIndex]}</span>
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
		<div class="mt-5">
			<h2 class="mb-4">Label Best Practices</h2>
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
		<div class="mt-5">
			<h2 class="mb-4">Next Steps</h2>
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