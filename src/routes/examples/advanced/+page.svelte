<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	let customThumbSwitch = $state(true);
	let iconSwitchState = $state(false);
	let customLabelMulti = $state(1);
	let customSegmentMulti = $state(2);
	let mediaThumbMulti = $state(0);
	let themeMulti = $state(1);
	let qualityMulti = $state(1);
	let disabledThumbSwitch = $state(false);

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

	const themeOptions = [
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

<DocLayout
	titleText="Advanced Examples"
	descriptionText="Custom snippets and complex interactions">

	<div class="py-4">
		<div class="alert alert-info">
			<strong>Snippet API in v2.0.</strong> Switch uses one snippet — <code>thumb</code>.
			MultiSwitch has three: <code>thumb</code> (one render in the moving thumb),
			<code>segment</code> (one render per step background), and <code>label</code>
			(per-step label). All snippet contexts use <code>&#123; index, item, isSelected &#125;</code>
			(<code>thumb</code> on MultiSwitch omits <code>isSelected</code> — it's always true).
		</div>

		<!-- Switch.thumb -->
		<ShowcaseSection
			titleText="AD01 Switch — thumb snippet"
			subtitleText="Custom content inside the moving thumb"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Notes">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Day/Night:</span>
						<Switch bind:checked={iconSwitchState} size={80}>
							{#snippet thumb()}
								<div class="d-flex align-items-center justify-content-center h-100 w-100">
									{iconSwitchState ? '🌞' : '🌙'}
								</div>
							{/snippet}
						</Switch>
						<span class="switch-state">{iconSwitchState ? 'Day Mode' : 'Night Mode'}</span>
					</div>

					<div class="switch-demo">
						<span class="switch-label">Power label:</span>
						<Switch
							bind:checked={customThumbSwitch}
							size={100}
							itemStyles={{
								backgroundColor: customThumbSwitch ? '#e8f5e8' : '#ffebee',
								thumbColor: customThumbSwitch ? '#4caf50' : '#f44336'
							}}>
							{#snippet thumb()}
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
<\/script>

<!-- Day/night thumb -->
<Switch bind:checked={isDayMode} size={80}>
  {#snippet thumb()}
    <div class="d-flex align-items-center justify-content-center h-100 w-100">
      {isDayMode ? '🌞' : '🌙'}
    </div>
  {/snippet}
</Switch>

<!-- Text-label thumb with state-driven itemStyles -->
<Switch
  bind:checked={powerOn}
  size={100}
  itemStyles={{
    backgroundColor: powerOn ? '#e8f5e8' : '#ffebee',
    thumbColor: powerOn ? '#4caf50' : '#f44336'
  }}>
  {#snippet thumb()}
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
					<h4>The thumb snippet</h4>
					<p>
						The <code>thumb</code> snippet replaces the default thumb content. For a
						binary Switch, the snippet runs once and you usually read the
						<code>checked</code> state from your own scope (as both examples here do).
					</p>
					<h4>Snippet context</h4>
					<p>
						If you supply <code>items</code>, the snippet receives
						<code>&#123; index, item &#125;</code> describing the active half of the tuple.
						For pure binary toggles you can ignore the context entirely.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- MultiSwitch.segment -->
		<ShowcaseSection
			titleText="AD02 MultiSwitch — segment snippet"
			subtitleText="Custom content rendered once per step background. Pair with thumb to also fill the moving thumb."
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="When to use segment">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Status Monitor:</span>
						<MultiSwitch
							bind:selectedIndex={customSegmentMulti}
							items={statusLevels}
							size={80}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block">
							{#snippet thumb({ index, item })}
								<div class="text-center h-100 d-flex flex-column align-items-center justify-content-center">
									<div style="font-size: 1.2rem;">{item?.icon ?? ''}</div>
									<small class="fw-bold" style="font-size: 0.7rem;">{item?.name ?? ''}</small>
								</div>
							{/snippet}
							{#snippet segment({ index, item, isSelected })}
								<div class="text-center h-100 d-flex flex-column align-items-center justify-content-center">
									<div style="font-size: 1.2rem; opacity: {isSelected ? 0 : 0.6};">{item?.icon ?? ''}</div>
									<small class="fw-bold" style="font-size: 0.7rem; opacity: {isSelected ? 0 : 0.6};">{item?.name ?? ''}</small>
								</div>
							{/snippet}
							{#snippet label({ index, item, isSelected })}
								<div class="text-center mt-2">
									<small class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''}</small>
									<div class="small text-muted">{item?.description ?? ''}</div>
								</div>
							{/snippet}
						</MultiSwitch>
					</div>

					<div class="switch-demo">
						<span class="switch-label">Media Controls:</span>
						<MultiSwitch
							bind:selectedIndex={mediaThumbMulti}
							items={mediaControls}
							size={60}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block">
							{#snippet thumb({ index, item })}
								<div class="text-center">
									<div class="fs-5">{item?.icon ?? ''}</div>
								</div>
							{/snippet}
							{#snippet segment({ index, item, isSelected })}
								<div class="text-center" style="opacity: {isSelected ? 0 : 0.5};">
									<div class="fs-5">{item?.icon ?? ''}</div>
								</div>
							{/snippet}
							{#snippet label({ index, item, isSelected })}
								<div class="text-center mt-2">
									<small class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''}</small>
								</div>
							{/snippet}
						</MultiSwitch>
						<span class="switch-state">Action: {mediaControls[mediaThumbMulti].name}</span>
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
<\/script>

<!-- thumb fills the moving thumb (active item) -->
<!-- segment fills each step background; we dim the active one -->
<!-- to avoid double-rendering under the thumb. -->
<MultiSwitch
  bind:selectedIndex={statusIndex}
  items={statusLevels}
  size={80}
  shouldDisplayLabels={true}
  labelRenderMode="block">
  {#snippet thumb({ index, item })}
    <div class="text-center">
      <div class="fs-4">{item?.icon ?? ''}</div>
      <small class="fw-bold">{item?.name ?? ''}</small>
    </div>
  {/snippet}
  {#snippet segment({ index, item, isSelected })}
    <div class="text-center" style="opacity: {isSelected ? 0 : 0.6};">
      <div class="fs-4">{item?.icon ?? ''}</div>
      <small class="fw-bold">{item?.name ?? ''}</small>
    </div>
  {/snippet}
  {#snippet label({ index, item, isSelected })}
    <div class="text-center mt-2">
      <small class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''}</small>
      <div class="small text-muted">{item?.description ?? ''}</div>
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>v2.0 split</h4>
					<p>
						In 1.x <code>children</code> ran in BOTH the moving thumb and each step
						background. 2.0 split that into <code>thumb</code> (one render) and
						<code>segment</code> (one render per step) so each snippet has one job.
					</p>
					<h4>1.x parity pattern</h4>
					<p>
						To get the v1.x behaviour where the thumb showed the active item's content,
						pass <strong>both</strong> <code>thumb</code> and <code>segment</code> with
						the same markup. Optionally hide the active segment
						(<code>opacity: isSelected ? 0 : ...</code>) to avoid double-rendering
						underneath the thumb.
					</p>
					<h4>segment context</h4>
					<ul>
						<li><code>index</code> — Index of the step (was <code>currentIndex</code>)</li>
						<li><code>item</code> — The item data for this step</li>
						<li><code>isSelected</code> — <code>index === activeIndex</code></li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- MultiSwitch.label -->
		<ShowcaseSection
			titleText="AD03 MultiSwitch — label snippet"
			subtitleText="Rich per-step labels with full HTML/Svelte content"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Notes">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Power Levels:</span>
						<MultiSwitch
							bind:selectedIndex={customLabelMulti}
							items={powerLevels}
							size={70}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block">
							{#snippet label({ index, item, isSelected })}
								<div class="text-center mt-2">
									<div class="fw-bold" style="color: {item?.color ?? '#000'}">{item?.level ?? ''}</div>
									<div class="small text-muted">{item?.percentage ?? 0}%</div>
								</div>
							{/snippet}
						</MultiSwitch>
						<span class="switch-state">
							{powerLevels[customLabelMulti].level} ({powerLevels[customLabelMulti].percentage}%)
						</span>
					</div>

					<div class="switch-demo">
						<span class="switch-label">Quality:</span>
						<MultiSwitch
							bind:selectedIndex={qualityMulti}
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
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let powerLevel = $state(1);
  let quality = $state(1);

  const powerLevels = [
    { level: 'Eco',    percentage: 25,  color: '#4caf50' },
    { level: 'Normal', percentage: 50,  color: '#2196f3' },
    { level: 'Sport',  percentage: 75,  color: '#ff9800' },
    { level: 'Race',   percentage: 100, color: '#f44336' }
  ];

  const qualitySettings = [
    { name: 'Low',    resolution: '480p',  size: '~200MB' },
    { name: 'Medium', resolution: '720p',  size: '~500MB' },
    { name: 'High',   resolution: '1080p', size: '~1GB' },
    { name: 'Ultra',  resolution: '4K',    size: '~4GB' }
  ];
<\/script>

<!-- Coloured labels -->
<MultiSwitch
  bind:selectedIndex={powerLevel}
  items={powerLevels}
  shouldDisplayLabels={true}
  labelRenderMode="block">
  {#snippet label({ index, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold" style="color: {item?.color ?? '#000'}">{item?.level ?? ''}</div>
      <div class="small text-muted">{item?.percentage ?? 0}%</div>
    </div>
  {/snippet}
</MultiSwitch>

<!-- Detailed multi-piece labels -->
<MultiSwitch
  bind:selectedIndex={quality}
  items={qualitySettings}
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
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>label snippet (v2.0)</h4>
					<p>
						Renamed from 1.x <code>labelTemplate</code>. Same role: full control over
						each per-step label.
					</p>
					<h4>Snippet context</h4>
					<ul>
						<li><code>index</code> — Index of this label</li>
						<li><code>item</code> — Item data (typed as <code>T | undefined</code>)</li>
						<li><code>isSelected</code> — Whether this label corresponds to the active step</li>
					</ul>
					<h4>Easier alternatives</h4>
					<p>
						If you only need label text, prefer <code>labelMember</code> or
						<code>labelCallback</code> — see <a href="/examples/labels">Labels</a>.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Combined example -->
		<ShowcaseSection
			titleText="AD04 Combined example — thumb + segment + label + itemStyles"
			subtitleText="Theme selector using all four customization points at once"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Combined Use">

			{#snippet demoContent()}
				<div class="switch-demo">
					<span class="switch-label">Theme:</span>
					<MultiSwitch
						bind:selectedIndex={themeMulti}
						items={themeOptions}
						size={90}
						shouldDisplayLabels={true}
						labelPosition="bottom"
						labelRenderMode="block"
						itemStyles={themeStyles}>
						{#snippet segment({ index, item })}
							<div class="text-center h-100 d-flex align-items-center justify-content-center">
								<div class="fs-3">{item?.icon ?? ''}</div>
							</div>
						{/snippet}
						{#snippet thumb({ index, item })}
							<div
								class="h-100 w-100 d-flex align-items-center justify-content-center"
								style="background: {item?.bg ?? '#ffffff'}; color: {item?.text ?? '#000000'}; border-radius: 2px; margin: 2px;">
								<small class="fw-bold" style="font-size: 10px;">{item?.name ?? ''}</small>
							</div>
						{/snippet}
						{#snippet label({ index, item, isSelected })}
							<div class="text-center mt-2">
								<div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''} Theme</div>
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
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let themeIndex = $state(1);

  const themes = [
    { name: 'Light', icon: '☀️', bg: '#ffffff', text: '#000000' },
    { name: 'Dark',  icon: '🌙', bg: '#1a1a1a', text: '#ffffff' },
    { name: 'Auto',  icon: '🔄', bg: '#6366f1', text: '#ffffff' }
  ];

  const themeStyles = [
    { backgroundColor: '#f8fafc', thumbColor: '#fbbf24', thumbBorderColor: '#f59e0b' },
    { backgroundColor: '#1e293b', thumbColor: '#64748b', thumbBorderColor: '#475569' },
    { backgroundColor: '#e0e7ff', thumbColor: '#6366f1', thumbBorderColor: '#4f46e5' }
  ];
<\/script>

<MultiSwitch
  bind:selectedIndex={themeIndex}
  items={themes}
  size={90}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  itemStyles={themeStyles}>

  {#snippet segment({ index, item })}
    <div class="text-center h-100 d-flex align-items-center justify-content-center">
      <div class="fs-3">{item?.icon ?? ''}</div>
    </div>
  {/snippet}

  {#snippet thumb({ index, item })}
    <div
      class="h-100 w-100 d-flex align-items-center justify-content-center"
      style="background: {item?.bg ?? '#ffffff'}; color: {item?.text ?? '#000000'}">
      <small class="fw-bold">{item?.name ?? ''}</small>
    </div>
  {/snippet}

  {#snippet label({ index, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''} Theme</div>
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
					<h4>All four together</h4>
					<p>
						<code>itemStyles</code> drives per-step background colours,
						<code>segment</code> renders the static icon per step,
						<code>thumb</code> shows the theme name in the moving thumb,
						<code>label</code> renders the rich per-step caption.
					</p>
					<h4>Real-world fit</h4>
					<ul>
						<li>Theme selectors</li>
						<li>Media players</li>
						<li>Dashboard controls</li>
						<li>Configuration panels</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Disabled with snippet -->
		<div class="mt-5">
			<h2 class="mb-4">Snippets with Disabled State</h2>
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
							{#snippet thumb()}
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
  {#snippet thumb()}
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

		<!-- Best Practices -->
		<div class="mt-5">
			<h2 class="mb-4">Performance & Best Practices</h2>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>⚡ Performance Tips</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled mb-0">
								<li>✅ Keep snippet logic simple</li>
								<li>✅ Avoid heavy computations in snippets</li>
								<li>✅ Use <code>$derived</code> for computed values</li>
								<li>✅ Minimize DOM elements in snippets</li>
								<li>✅ Cache expensive operations outside the snippet</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>🎯 Snippet Guidelines</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled mb-0">
								<li>✅ Pick the right snippet (thumb vs segment vs label)</li>
								<li>✅ Design for touch interfaces</li>
								<li>✅ Ensure content fits in available space</li>
								<li>✅ Use <code>?.</code> on optional item properties</li>
								<li>✅ Test with different item shapes</li>
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
							<p>Complete documentation of all props</p>
							<a href="/api/switch" class="btn btn-primary">Switch API</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎨</div>
							<h5>Theming</h5>
							<p>Cross-library --base-* cascade</p>
							<a href="/examples/theming" class="btn btn-outline-primary">Theming</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🏠</div>
							<h5>Back to Home</h5>
							<p>Return to the showcase landing page</p>
							<a href="/" class="btn btn-outline-primary">Home</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>
