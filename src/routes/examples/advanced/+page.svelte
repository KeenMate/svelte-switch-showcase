<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	// Demo states
	let customThumbSwitch = $state(true);
	let iconSwitchState = $state(false);
	let customLabelMulti = $state(1);
	let customChildrenMulti = $state(2);
	let customThumbMulti = $state(0);
	let complexTemplateMulti = $state(1);
	let disabledThumbSwitch = $state(false);

	// Data for examples
	const statusLevels = [
		{ name: 'Offline', icon: '🔴', description: 'Service unavailable' },
		{ name: 'Warning', icon: '🟡', description: 'Limited functionality' },
		{ name: 'Online', icon: '🟢', description: 'Fully operational' }
	];

	const mediaControls = [
		{ name: 'Previous', icon: '⏮️' },
		{ name: 'Play', icon: '▶️' },
		{ name: 'Pause', icon: '⏸️' },
		{ name: 'Next', icon: '⏭️' }
	];

	const powerLevels = [
		{ level: 'Eco', percentage: 25, color: '#4caf50' },
		{ level: 'Normal', percentage: 50, color: '#2196f3' },
		{ level: 'Sport', percentage: 75, color: '#ff9800' },
		{ level: 'Race', percentage: 100, color: '#f44336' }
	];

	const qualitySettings = [
		{ name: 'Low', resolution: '480p', size: '~200MB' },
		{ name: 'Medium', resolution: '720p', size: '~500MB' },
		{ name: 'High', resolution: '1080p', size: '~1GB' },
		{ name: 'Ultra', resolution: '4K', size: '~4GB' }
	];
</script>

<DocLayout
	titleText="Advanced Examples"
	descriptionText="Explore advanced features including custom templates, snippets, and complex interactions">

	<div class="py-4">
		<!-- Custom Thumb Templates -->
		<ShowcaseSection
			titleText="Custom Thumb Templates"
			subtitleText="Replace the default thumb with custom content"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Thumb Customization">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Custom Icon Thumb:</span>
						<Switch
							bind:checked={iconSwitchState}
							size={80}>
							{#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
								<div class="d-flex align-items-center justify-content-center h-100 w-100">
									{iconSwitchState ? '🌞' : '🌙'}
								</div>
							{/snippet}
						</Switch>
						<span class="switch-state">{iconSwitchState ? 'Day Mode' : 'Night Mode'}</span>
					</div>

					<div class="switch-demo">
						<span class="switch-label">Power Switch:</span>
						<Switch
							bind:checked={customThumbSwitch}
							size={100}
							itemStyles={{
								backgroundColor: customThumbSwitch ? '#e8f5e8' : '#ffebee',
								thumbColor: customThumbSwitch ? '#4caf50' : '#f44336'
							}}>
							{#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
								<div class="d-flex align-items-center justify-content-center h-100 w-100 text-white fw-bold">
									{customThumbSwitch ? 'ON' : 'OFF'}
								</div>
							{/snippet}
						</Switch>
						<span class="switch-state">Power: {customThumbSwitch ? 'ON' : 'OFF'}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let isDayMode = $state(false);
  let powerOn = $state(true);
</script>

<!-- Icon thumb template -->
<Switch bind:checked={isDayMode} size={80}>
  {#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
    <div class="d-flex align-items-center justify-content-center h-100 w-100">
      {isDayMode ? '🌞' : '🌙'}
    </div>
  {/snippet}
</Switch>

<!-- Text thumb template -->
<Switch bind:checked={powerOn} size={100}>
  {#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
    <div class="d-flex align-items-center justify-content-center h-100 w-100 text-white fw-bold">
      {powerOn ? 'ON' : 'OFF'}
    </div>
  {/snippet}
</Switch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>thumbTemplate Snippet</h4>
					<p>
						The <code>thumbTemplate</code> snippet receives context about the current state
						and allows you to render custom content inside the thumb.
					</p>
					<h4>Available Parameters</h4>
					<ul>
						<li><code>currentIndex</code> - Current selected index</li>
						<li><code>currentItem</code> - Current item data</li>
						<li><code>itemsCount</code> - Total number of items</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Custom Children Templates -->
		<ShowcaseSection
			titleText="Custom Children Templates"
			subtitleText="Customize the content and layout of switch items"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Children Customization">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Status Monitor:</span>
						<MultiSwitch
							bind:selectedIndex={customChildrenMulti}
							items={statusLevels}
							size={80}
							shouldDisplayLabels={false}>
							{#snippet children({ currentIndex, item, isSelected })}
								<div class="text-center h-100 d-flex flex-column align-items-center justify-content-center {isSelected ? 'bg-white' : ''}">
									<div style="font-size: 1.2rem;">{item?.icon || ''}</div>
									<small class="fw-bold" style="font-size: 0.7rem;">{item?.name || ''}</small>
								</div>
							{/snippet}
						</MultiSwitch>
						<span class="switch-state">Status: {statusLevels[customChildrenMulti].name} - {statusLevels[customChildrenMulti].description}</span>
					</div>

					<div class="switch-demo" style="padding-bottom: 2.5rem;">
						<span class="switch-label">Media Controls:</span>
						<MultiSwitch
							bind:selectedIndex={customThumbMulti}
							items={mediaControls}
							size={60}
							shouldDisplayLabels={true}
							labelPosition="bottom">
							{#snippet children({ currentIndex, item, isSelected })}
								<div class="text-center">
									<div class="fs-5">{item?.icon || ''}</div>
								</div>
							{/snippet}
							{#snippet labelTemplate({ currentIndex, item, isSelected })}
								<div class="text-center mt-2">
									<small class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name || ''}</small>
								</div>
							{/snippet}
						</MultiSwitch>
						<span class="switch-state">Action: {mediaControls[customThumbMulti].name}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let statusIndex = $state(2);

  const statusLevels = [
    { name: 'Offline', icon: '🔴', description: 'Service unavailable' },
    { name: 'Warning', icon: '🟡', description: 'Limited functionality' },
    { name: 'Online', icon: '🟢', description: 'Fully operational' }
  ];

  const mediaControls = [
    { name: 'Previous', icon: '⏮️' },
    { name: 'Play', icon: '▶️' },
    { name: 'Pause', icon: '⏸️' },
    { name: 'Next', icon: '⏭️' }
  ];
</script>

<!-- Status monitor with custom children -->
<MultiSwitch
  bind:selectedIndex={statusIndex}
  items={statusLevels}
  size={80}
  shouldDisplayLabels={false}>
  {#snippet children({ currentIndex, item, isSelected })}
    <div class="text-center p-2 {isSelected ? 'bg-white' : ''}">
      <div class="fs-4">{item?.icon || ''}</div>
      <small class="fw-bold">{item?.name || ''}</small>
    </div>
  {/snippet}
</MultiSwitch>

<!-- Media controls -->
<MultiSwitch
  bind:selectedIndex={mediaIndex}
  items={mediaControls}
  size={60}>
  {#snippet children({ currentIndex, item, isSelected })}
    <div class="text-center">
      <div class="fs-5">{item?.icon || ''}</div>
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>children Snippet</h4>
					<p>
						The <code>children</code> snippet allows you to completely customize
						the content rendered for each switch option.
					</p>
					<h4>Available Parameters</h4>
					<ul>
						<li><code>currentIndex</code> - Index of this item</li>
						<li><code>item</code> - The item data</li>
						<li><code>isSelected</code> - Whether this item is selected</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Custom Label Templates -->
		<ShowcaseSection
			titleText="Custom Label Templates"
			subtitleText="Advanced label customization for MultiSwitch"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Label Customization">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Power Levels:</span>
						<MultiSwitch
							bind:selectedIndex={customLabelMulti}
							items={powerLevels}
							size={70}
							shouldDisplayLabels={true}
							labelPosition="bottom">
							{#snippet labelTemplate({ currentIndex, item, isSelected })}
								<div class="text-center mt-2">
									<div class="fw-bold" style="color: {item?.color || '#000'}">{item?.level || ''}</div>
									<div class="small text-muted">{item?.percentage || 0}%</div>
								</div>
							{/snippet}
						</MultiSwitch>
						<!-- <span class="switch-state">Power: {owerLevels[customLabelMulti].level} ({powerLevels[customLabelMulti].percentage}%)</span> -->
					</div>

					<div class="switch-demo">
						<span class="switch-label">Quality Settings:</span>
						<MultiSwitch
							bind:selectedIndex={complexTemplateMulti}
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
						<!-- <span class="switch-state">Quality: {qualitySettings[complexTemplateMulti].name} ({qualitySettings[complexTemplateMulti].resolution})</span> -->
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let powerLevel = $state(1);
  let quality = $state(1);

  const powerLevels = [
    { level: 'Eco', percentage: 25, color: '#4caf50' },
    { level: 'Normal', percentage: 50, color: '#2196f3' },
    { level: 'Sport', percentage: 75, color: '#ff9800' },
    { level: 'Race', percentage: 100, color: '#f44336' }
  ];

  const qualitySettings = [
    { name: 'Low', resolution: '480p', size: '~200MB' },
    { name: 'Medium', resolution: '720p', size: '~500MB' },
    { name: 'High', resolution: '1080p', size: '~1GB' },
    { name: 'Ultra', resolution: '4K', size: '~4GB' }
  ];
</script>

<!-- Power levels with colored labels -->
<MultiSwitch
  bind:selectedIndex={powerLevel}
  items={powerLevels}
  shouldDisplayLabels={true}
  labelPosition="bottom">
  {#snippet labelTemplate({ currentIndex, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold" style="color: {item?.color || '#000'}">{item?.level || ''}</div>
      <div class="small text-muted">{item?.percentage || 0}%</div>
    </div>
  {/snippet}
</MultiSwitch>

<!-- Quality settings with detailed info -->
<MultiSwitch
  bind:selectedIndex={quality}
  items={qualitySettings}
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
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>labelTemplate Snippet</h4>
					<p>
						The <code>labelTemplate</code> snippet gives you complete control over
						how labels are rendered for each option.
					</p>
					<h4>Rich Label Content</h4>
					<p>
						Labels can include multiple lines, colors, icons, and any other
						HTML/Svelte content you need.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Complex Combined Example -->
		<ShowcaseSection
			titleText="Complete Custom Example"
			subtitleText="Combining all templating features"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Advanced Integration">

			{#snippet demoContent()}
				<div class="switch-demo" style="padding-bottom: 3rem;">
					<span class="switch-label">Theme Selector:</span>
					<MultiSwitch
						bind:selectedIndex={complexTemplateMulti}
						items={[
							{ name: 'Light', icon: '☀️', bg: '#ffffff', text: '#000000' },
							{ name: 'Dark', icon: '🌙', bg: '#1a1a1a', text: '#ffffff' },
							{ name: 'Auto', icon: '🔄', bg: '#6366f1', text: '#ffffff' }
						]}
						size={90}
						shouldDisplayLabels={true}
						labelPosition="bottom"
						itemStyles={[
							{ backgroundColor: '#f8fafc', thumbColor: '#fbbf24', thumbBorderColor: '#f59e0b' },
							{ backgroundColor: '#1e293b', thumbColor: '#64748b', thumbBorderColor: '#475569' },
							{ backgroundColor: '#e0e7ff', thumbColor: '#6366f1', thumbBorderColor: '#4f46e5' }
						]}>
						{#snippet children({ currentIndex, item, isSelected })}
							<div class="text-center h-100 d-flex align-items-center justify-content-center">
								<div class="fs-3">{item?.icon || ''}</div>
							</div>
						{/snippet}
						{#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
							<div
								class="h-100 w-100 d-flex align-items-center justify-content-center"
								style="background: {currentItem?.bg || '#ffffff'}; color: {currentItem?.text || '#000000'}; border-radius: 2px; margin: 2px;">
								<small class="fw-bold" style="font-size: 10px;">{currentItem?.name || ''}</small>
							</div>
						{/snippet}
						{#snippet labelTemplate({ currentIndex, item, isSelected })}
							<div class="text-center mt-2">
								<div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name || ''} Theme</div>
								<div class="small text-muted">
									{#if item?.name === 'Light'}
										Best for daytime use
									{:else if item?.name === 'Dark'}
										Easy on the eyes
									{:else if item?.name === 'Auto'}
										Matches system setting
									{:else}
										Select a theme
									{/if}
								</div>
							</div>
						{/snippet}
					</MultiSwitch>
					<span class="switch-state">Selected Theme: {['Light', 'Dark', 'Auto'][complexTemplateMulti]}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let themeIndex = $state(1);

  const themes = [
    { name: 'Light', icon: '☀️', bg: '#ffffff', text: '#000000' },
    { name: 'Dark', icon: '🌙', bg: '#1a1a1a', text: '#ffffff' },
    { name: 'Auto', icon: '🔄', bg: '#6366f1', text: '#ffffff' }
  ];

  const themeStyles = [
    { backgroundColor: '#f8fafc', thumbColor: '#fbbf24', thumbBorderColor: '#f59e0b' },
    { backgroundColor: '#1e293b', thumbColor: '#64748b', thumbBorderColor: '#475569' },
    { backgroundColor: '#e0e7ff', thumbColor: '#6366f1', thumbBorderColor: '#4f46e5' }
  ];
</script>

<MultiSwitch
  bind:selectedIndex={themeIndex}
  items={themes}
  size={90}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  itemStyles={themeStyles}>

  {#snippet children({ currentIndex, item, isSelected })}
    <div class="text-center h-100 d-flex align-items-center justify-content-center">
      <div class="fs-3">{item?.icon || ''}</div>
    </div>
  {/snippet}

  {#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
    <div
      class="h-100 w-100 d-flex align-items-center justify-content-center rounded-circle"
      style="background: {currentItem?.bg || '#ffffff'}; color: {currentItem?.text || '#000000'}">
      <small class="fw-bold">{currentItem?.name || ''}</small>
    </div>
  {/snippet}

  {#snippet labelTemplate({ currentIndex, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name || ''} Theme</div>
      <div class="small text-muted">
        {#if item?.name === 'Light'}
          Best for daytime use
        {:else if item?.name === 'Dark'}
          Easy on the eyes
        {:else}
          Matches system setting
        {/if}
      </div>
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Complete Customization</h4>
					<p>
						This example combines all templating features: custom children,
						thumb template, label template, and individual styling.
					</p>
					<h4>Real-world Use Cases</h4>
					<ul>
						<li>Theme selectors</li>
						<li>Media players</li>
						<li>Dashboard controls</li>
						<li>Configuration panels</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Disabled State with Templates -->
		<div class="mt-5">
			<h2 class="mb-4">Templates with Disabled State</h2>
			<div class="row">
				<div class="col-lg-6">
					<div class="switch-demo">
						<span class="switch-label">Disabled Custom Switch:</span>
						<Switch
							bind:checked={disabledThumbSwitch}
							isDisabled={true}
							size={80}
							itemStyles={{
								backgroundColor: '#f5f5f5',
								thumbColor: '#bdbdbd',
								thumbBorderColor: '#9e9e9e'
							}}>
							{#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
								<div class="d-flex align-items-center justify-content-center h-100 w-100 text-muted">
									🔒
								</div>
							{/snippet}
						</Switch>
						<span class="switch-state">Locked</span>
					</div>
				</div>
				<div class="col-lg-6">
					<CodeBlock
						codeContent={`<Switch
  bind:checked={isLocked}
  isDisabled={true}
  size={80}
  itemStyles={{
    backgroundColor: '#f5f5f5',
    thumbColor: '#bdbdbd',
    thumbBorderColor: '#9e9e9e'
  }}>
  {#snippet thumbTemplate({ currentIndex, currentItem, itemsCount })}
    <div class="d-flex align-items-center justify-content-center h-100 w-100 text-muted">
      🔒
    </div>
  {/snippet}
</Switch>`}
						languageType="svelte"
					/>
				</div>
			</div>
		</div>

		<!-- Performance Tips -->
		<div class="mt-5">
			<h2 class="mb-4">Performance & Best Practices</h2>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>⚡ Performance Tips</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Keep template logic simple</li>
								<li>✅ Avoid heavy computations in templates</li>
								<li>✅ Use `$derived` for computed values</li>
								<li>✅ Minimize DOM elements in templates</li>
								<li>✅ Cache expensive operations</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>🎯 Template Guidelines</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Design for touch interfaces</li>
								<li>✅ Ensure content fits in available space</li>
								<li>✅ Test with different data lengths</li>
								<li>✅ Consider loading states</li>
								<li>✅ Maintain consistent styling</li>
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
							<div class="display-6 mb-3">📚</div>
							<h5>API Reference</h5>
							<p>Complete documentation of all props and methods</p>
							<a href="/api/switch" class="btn btn-primary">Switch API</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎮</div>
							<h5>Playground</h5>
							<p>Interactive playground to test your ideas</p>
							<a href="/examples/basic" class="btn btn-outline-primary">Basic Examples</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🏠</div>
							<h5>Back to Home</h5>
							<p>Return to the main showcase page</p>
							<a href="/" class="btn btn-outline-primary">Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>