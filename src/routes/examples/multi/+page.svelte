<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { MultiSwitch } from '@keenmate/svelte-switch';

	let basicMultiIndex = $state(0);
	let powerLevelIndex = $state(1);
	let moodIndex = $state(2);
	let sizeDemoIndex = $state(0);
	let verticalMultiIndex = $state(1);
	let noLabelsIndex = $state(0);
	let customLabelsIndex = $state(0);
	let callbackIndex = $state(0);
	let callbackMessage = $state('');

	const basicOptions = ['Option A', 'Option B', 'Option C'];
	const powerLevels = ['Off', 'Low', 'Medium', 'High', 'Maximum'];
	const moods = ['😢', '😐', '😊', '😍'];
	const sizes = ['Small', 'Medium', 'Large'];
	const customOptions = [
		{ name: 'Beginner', description: 'Just starting out' },
		{ name: 'Intermediate', description: 'Some experience' },
		{ name: 'Advanced', description: 'Highly skilled' },
		{ name: 'Expert', description: 'Master level' }
	];

	const handleSelectionChange = (index: number) => {
		callbackMessage = `Selected: ${basicOptions[index]} (index ${index}) at ${new Date().toLocaleTimeString()}`;
	};
</script>

<DocLayout
	titleText="MultiSwitch Examples"
	descriptionText="Learn how to use the MultiSwitch component for multi-state selections">

	<div class="py-4">
		<!-- Basic Usage -->
		<ShowcaseSection
			titleText="MS01 Basic Usage"
			subtitleText="Simple multi-option switch with labels"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Explanation">

			{#snippet demoContent()}
				<div class="switch-demo">
					<span class="switch-label">Choose option:</span>
					<MultiSwitch
						bind:selectedIndex={basicMultiIndex}
						items={basicOptions}
						shouldDisplayLabels={true}
						labelPosition="bottom"
						labelRenderMode="block" />
					<span class="switch-state">Selected: {basicOptions[basicMultiIndex]}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  import { MultiSwitch } from '@keenmate/svelte-switch';

  let selectedIndex = $state(0);
  const options = ['Option A', 'Option B', 'Option C'];
<\/script>

<MultiSwitch
  bind:selectedIndex={selectedIndex}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  labelRenderMode="block" />

<p>Selected: {options[selectedIndex]}</p>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Two-way Binding</h4>
					<p>
						Use <code>bind:selectedIndex</code> to track which option is currently selected.
					</p>
					<h4>Items Array</h4>
					<p>
						Pass an array of strings or objects to define the available options.
						The array type flows through to all snippet contexts via the generic <code>T</code>.
					</p>
					<h4>Block label rendering</h4>
					<p>
						<code>labelRenderMode="block"</code> reserves space for labels in document
						flow — no manual padding needed.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Different Option Counts -->
		<ShowcaseSection
			titleText="MS02 Different Option Counts"
			subtitleText="MultiSwitch adapts to any number of options"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Power Level (5 options):</span>
						<MultiSwitch
							bind:selectedIndex={powerLevelIndex}
							items={powerLevels}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block" />
						<span class="switch-state">Level: {powerLevels[powerLevelIndex]}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Mood (4 emojis):</span>
						<MultiSwitch
							bind:selectedIndex={moodIndex}
							items={moods}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block"
							size={60} />
						<span class="switch-state">Mood: {moods[moodIndex]}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let powerLevel = $state(1);
  let mood = $state(2);

  const powerLevels = ['Off', 'Low', 'Medium', 'High', 'Maximum'];
  const moods = ['😢', '😐', '😊', '😍'];
<\/script>

<MultiSwitch
  bind:selectedIndex={powerLevel}
  items={powerLevels}
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<MultiSwitch
  bind:selectedIndex={mood}
  items={moods}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Flexible Options</h4>
					<p>
						MultiSwitch works with any number of items ≥ 2. The component automatically
						adjusts spacing and stride math.
					</p>
					<h4>Content Types</h4>
					<ul>
						<li>Text labels</li>
						<li>Emoji characters</li>
						<li>Short abbreviations</li>
						<li>Custom objects (with <code>labelMember</code> / <code>labelCallback</code> / <code>label</code> snippet)</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Size Variations -->
		<ShowcaseSection
			titleText="MS03 Size Variations"
			subtitleText="Numeric and named sizes"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Size Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4 align-items-start">
					<div class="switch-demo">
						<span class="switch-label">size=&#123;40&#125; (compact):</span>
						<MultiSwitch
							bind:selectedIndex={sizeDemoIndex}
							items={sizes}
							shouldDisplayLabels={true}
							labelRenderMode="block"
							size={40} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size="md" (default):</span>
						<MultiSwitch
							bind:selectedIndex={sizeDemoIndex}
							items={sizes}
							shouldDisplayLabels={true}
							labelRenderMode="block" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">size=&#123;70&#125; (large):</span>
						<MultiSwitch
							bind:selectedIndex={sizeDemoIndex}
							items={sizes}
							shouldDisplayLabels={true}
							labelRenderMode="block"
							size={70} />
					</div>
				</div>
				<div class="mt-3">
					<span class="switch-state">Selected: {sizes[sizeDemoIndex]}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Compact -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  size={40} />

<!-- Default — 'md' = 35px -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<!-- Large -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  size={70} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Choosing Size</h4>
					<ul>
						<li><strong>xs / sm:</strong> Sidebars, compact tables</li>
						<li><strong>md (default):</strong> Forms — pure-admin aligned</li>
						<li><strong>lg / xl or 60–80px:</strong> Touch targets, emphasis</li>
					</ul>
					<h4>Label Considerations</h4>
					<p>
						Larger switches give more room for labels and better touch targets. See the
						<a href="/examples/sizes">Sizes</a> page for the full table.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Vertical Orientation -->
		<ShowcaseSection
			titleText="MS04 Vertical Orientation"
			subtitleText="Vertical layout for space-constrained designs"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="When to Use">

			{#snippet demoContent()}
				<div class="d-flex gap-5 justify-content-center">
					<div class="text-center">
						<div class="mb-3">Horizontal (default)</div>
						<MultiSwitch
							bind:selectedIndex={verticalMultiIndex}
							items={powerLevels}
							shouldDisplayLabels={true}
							labelRenderMode="block" />
					</div>
					<div class="text-center">
						<div class="mb-3">Vertical</div>
						<MultiSwitch
							bind:selectedIndex={verticalMultiIndex}
							items={powerLevels}
							shouldDisplayLabels={true}
							labelRenderMode="block"
							orientation="vertical"
							size={60}
							labelPosition="right" />
					</div>
				</div>
				<div class="text-center mt-3">
					<span class="switch-state">Selected: {powerLevels[verticalMultiIndex]}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Horizontal (default) -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block" />

<!-- Vertical with right-side labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  orientation="vertical"
  size={60}
  labelPosition="right" />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Vertical Benefits</h4>
					<ul>
						<li>Saves horizontal space</li>
						<li>Works well in sidebars</li>
						<li>Good for mobile layouts</li>
						<li>Per-step labels become clickable buttons (when no <code>thumb</code> snippet)</li>
					</ul>
					<h4>Label Positioning</h4>
					<p>
						Use <code>"right"</code> or <code>"left"</code> with vertical orientation.
						<code>"top"</code> / <code>"bottom"</code> are ignored on vertical switches.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Label Positioning -->
		<ShowcaseSection
			titleText="MS05 Label Positioning"
			subtitleText="Control where labels appear relative to the switch"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Position Options">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Labels on top:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={true}
							labelPosition="top"
							labelRenderMode="block" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Labels on bottom:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							labelRenderMode="block" />
					</div>
					<div class="switch-demo">
						<span class="switch-label">No labels:</span>
						<MultiSwitch
							bind:selectedIndex={noLabelsIndex}
							items={basicOptions}
							shouldDisplayLabels={false} />
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

<!-- No labels -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={false} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Available Positions</h4>
					<ul>
						<li><code>top</code> — Above the switch</li>
						<li><code>bottom</code> — Below the switch (default)</li>
						<li><code>left</code> — To the left (vertical only)</li>
						<li><code>right</code> — To the right (vertical only)</li>
					</ul>
					<h4>See also</h4>
					<p>
						The <a href="/examples/labels">Labels</a> page has the full matrix and
						covers <code>labelMember</code> / <code>labelCallback</code> for object items.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Event Handling -->
		<ShowcaseSection
			titleText="MS06 Event Handling"
			subtitleText="Respond to selection changes"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Event Details">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Select option:</span>
						<MultiSwitch
							bind:selectedIndex={callbackIndex}
							items={basicOptions}
							shouldDisplayLabels={true}
							labelRenderMode="block"
							onItemChange={handleSelectionChange} />
						<span class="switch-state">Current: {basicOptions[callbackIndex]}</span>
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
  let selectedIndex = $state(0);
  let message = $state('');

  const handleSelectionChange = (index) => {
    message = \`Selected: \${options[index]} (index \${index})\`;
    console.log('Selection changed to:', index);
  };
<\/script>

<MultiSwitch
  bind:selectedIndex={selectedIndex}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  onItemChange={handleSelectionChange} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>onItemChange Callback</h4>
					<p>
						The <code>onItemChange</code> prop accepts a function that receives
						the newly selected index.
					</p>
					<h4>Common Use Cases</h4>
					<ul>
						<li>Form validation</li>
						<li>Loading related data</li>
						<li>Updating other UI components</li>
						<li>Analytics tracking</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Custom Objects -->
		<ShowcaseSection
			titleText="MS07 Working with Custom Objects"
			subtitleText="Using the thumb and label snippets with object data"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="Snippet Roles">

			{#snippet demoContent()}
				<div class="switch-demo">
					<span class="switch-label">Skill level:</span>
					<MultiSwitch
						bind:selectedIndex={customLabelsIndex}
						items={customOptions}
						shouldDisplayLabels={true}
						labelPosition="bottom"
						labelRenderMode="block"
						size={60}>

						{#snippet thumb({ index, item })}
							<div class="text-center">
								<div class="fw-bold small">{item?.name?.charAt(0) ?? ''}</div>
							</div>
						{/snippet}

						{#snippet label({ index, item, isSelected })}
							<div class="text-center mt-2">
								<div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''}</div>
								<small class="text-muted">{item?.description ?? ''}</small>
							</div>
						{/snippet}
					</MultiSwitch>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  const options = [
    { name: 'Beginner', description: 'Just starting out' },
    { name: 'Intermediate', description: 'Some experience' },
    { name: 'Advanced', description: 'Highly skilled' },
    { name: 'Expert', description: 'Master level' }
  ];
<\/script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelRenderMode="block"
  size={60}>

  {#snippet thumb({ index, item })}
    <div class="text-center">
      <div class="fw-bold small">{item?.name?.charAt(0) ?? ''}</div>
    </div>
  {/snippet}

  {#snippet label({ index, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name ?? ''}</div>
      <small class="text-muted">{item?.description ?? ''}</small>
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>v2.0 Snippet Split</h4>
					<p>
						The 1.x <code>children</code> snippet (which ran in BOTH the moving thumb and
						each step background) was split in 2.0:
					</p>
					<ul>
						<li><strong>thumb</strong> — one render in the moving thumb (gets the active <code>item</code>)</li>
						<li><strong>segment</strong> — one render per step background</li>
						<li><strong>label</strong> — replaces 1.x <code>labelTemplate</code></li>
					</ul>
					<h4>Snippet Context</h4>
					<p>
						Context shape is unified: <code>&#123; index, item, isSelected &#125;</code>.
						<code>thumb</code> omits <code>isSelected</code> (it's always true for the
						moving thumb).
					</p>
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
							<div class="display-6 mb-3">🏷️</div>
							<h5>Labels</h5>
							<p>labelMember, labelCallback, label snippet</p>
							<a href="/examples/labels" class="btn btn-primary">Labels Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎨</div>
							<h5>Styling</h5>
							<p>Per-instance colors with itemStyles</p>
							<a href="/examples/styling" class="btn btn-outline-primary">Styling Guide</a>
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
