<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { MultiSwitch } from '@keenmate/svelte-switch';

	// Demo states
	let basicMultiIndex = $state(0);
	let powerLevelIndex = $state(1);
	let moodIndex = $state(2);
	let sizeDemoIndex = $state(0);
	let verticalMultiIndex = $state(1);
	let noLabelsIndex = $state(0);
	let customLabelsIndex = $state(0);
	let callbackIndex = $state(0);
	let callbackMessage = $state('');

	// Demo data
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
			titleText="Basic Usage"
			subtitleText="Simple multi-option switch with labels"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Explanation">

			{#snippet demoContent()}
				<div class="switch-demo">
					<span class="switch-label">Choose option:</span>
					<div style="padding-bottom: 2.5rem;">
						<MultiSwitch
							bind:selectedIndex={basicMultiIndex}
							items={basicOptions}
							shouldDisplayLabels={true}
							labelPosition="bottom" />
					</div>
					<span class="switch-state">Selected: {basicOptions[basicMultiIndex]}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  import { MultiSwitch } from '@keenmate/svelte-switch';

  let selectedIndex = $state(0);
  const options = ['Option A', 'Option B', 'Option C'];
</script>

<MultiSwitch
  bind:selectedIndex={selectedIndex}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom" />

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
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Different Option Counts -->
		<ShowcaseSection
			titleText="Different Option Counts"
			subtitleText="MultiSwitch adapts to any number of options"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Power Level (5 options):</span>
						<div style="padding-bottom: 2.5rem;">
							<MultiSwitch
								bind:selectedIndex={powerLevelIndex}
								items={powerLevels}
								shouldDisplayLabels={true}
								labelPosition="bottom" />
						</div>
						<span class="switch-state">Level: {powerLevels[powerLevelIndex]}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Mood (4 emojis):</span>
						<div style="padding-bottom: 2.5rem;">
							<MultiSwitch
								bind:selectedIndex={moodIndex}
								items={moods}
								shouldDisplayLabels={true}
								labelPosition="bottom"
								size={60} />
						</div>
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
</script>

<!-- 5 options -->
<MultiSwitch
  bind:selectedIndex={powerLevel}
  items={powerLevels}
  shouldDisplayLabels={true} />

<!-- 4 emoji options -->
<MultiSwitch
  bind:selectedIndex={mood}
  items={moods}
  shouldDisplayLabels={true}
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Flexible Options</h4>
					<p>
						MultiSwitch works with 3 or more options. The component automatically
						adjusts spacing and positioning.
					</p>
					<h4>Content Types</h4>
					<ul>
						<li>Text labels</li>
						<li>Emoji characters</li>
						<li>Short abbreviations</li>
						<li>Custom objects</li>
					</ul>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Size Variations -->
		<ShowcaseSection
			titleText="Size Variations"
			subtitleText="Control the size for different use cases"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Size Guidelines">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4 align-items-start">
					<div class="switch-demo">
						<span class="switch-label">Small (40px):</span>
						<MultiSwitch
							bind:selectedIndex={sizeDemoIndex}
							items={sizes}
							shouldDisplayLabels={true}
							size={40} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Default (50px):</span>
						<MultiSwitch
							bind:selectedIndex={sizeDemoIndex}
							items={sizes}
							shouldDisplayLabels={true} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Large (70px):</span>
						<MultiSwitch
							bind:selectedIndex={sizeDemoIndex}
							items={sizes}
							shouldDisplayLabels={true}
							size={70} />
					</div>
				</div>
				<div class="mt-3">
					<span class="switch-state">Selected size: {sizes[sizeDemoIndex]}</span>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<!-- Small switch -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  size={40} />

<!-- Default size (50px) -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true} />

<!-- Large switch -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  size={70} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Choosing Size</h4>
					<ul>
						<li><strong>Small (30-40px):</strong> Compact layouts, sidebars</li>
						<li><strong>Default (50px):</strong> Most common use cases</li>
						<li><strong>Large (60-80px):</strong> Touch interfaces, emphasis</li>
					</ul>
					<h4>Label Considerations</h4>
					<p>
						Larger switches provide more space for labels and better touch targets.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Orientation -->
		<ShowcaseSection
			titleText="Vertical Orientation"
			subtitleText="Vertical layout for space-constrained designs"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="When to Use">

			{#snippet demoContent()}
				<div class="d-flex gap-5 justify-content-center">
					<div class="text-center">
						<div class="mb-3">Horizontal (default)</div>
						<div style="padding-bottom: 2.5rem;">
							<MultiSwitch
								bind:selectedIndex={verticalMultiIndex}
								items={powerLevels}
								shouldDisplayLabels={true} />
						</div>
					</div>
					<div class="text-center">
						<div class="mb-3">Vertical</div>
						<div style="padding-right: 6rem;">
							<MultiSwitch
								bind:selectedIndex={verticalMultiIndex}
								items={powerLevels}
								shouldDisplayLabels={true}
								orientation="vertical"
								size={60}
								labelPosition="right" />
						</div>
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
  shouldDisplayLabels={true} />

<!-- Vertical orientation -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
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
						<li>Creates visual hierarchy</li>
					</ul>
					<h4>Label Positioning</h4>
					<p>
						Consider using "right" or "left" label positions with vertical switches
						for better readability.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Label Positioning -->
		<ShowcaseSection
			titleText="Label Positioning"
			subtitleText="Control where labels appear relative to the switch"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Position Options">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Labels on top:</span>
						<div style="padding-top: 3rem;">
							<MultiSwitch
								bind:selectedIndex={noLabelsIndex}
								items={basicOptions}
								shouldDisplayLabels={true}
								labelPosition="top" />
						</div>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Labels on bottom:</span>
						<div style="padding-bottom: 2.5rem;">
							<MultiSwitch
								bind:selectedIndex={noLabelsIndex}
								items={basicOptions}
								shouldDisplayLabels={true}
								labelPosition="bottom" />
						</div>
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
					codeContent={`<!-- Labels on top -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="top" />

<!-- Labels on bottom -->
<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  labelPosition="bottom" />

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
						<li><code>top</code> - Above the switch</li>
						<li><code>bottom</code> - Below the switch (default)</li>
						<li><code>left</code> - To the left (vertical only)</li>
						<li><code>right</code> - To the right (vertical only)</li>
					</ul>
					<h4>Design Tips</h4>
					<p>
						Choose label position based on your layout constraints and visual hierarchy.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Event Handling -->
		<ShowcaseSection
			titleText="Event Handling"
			subtitleText="Respond to selection changes"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Event Details">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-3">
					<div class="switch-demo">
						<span class="switch-label">Select option:</span>
						<div style="padding-bottom: 2.5rem;">
							<MultiSwitch
								bind:selectedIndex={callbackIndex}
								items={basicOptions}
								shouldDisplayLabels={true}
								onItemChange={handleSelectionChange} />
						</div>
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
    // Perform additional actions
    console.log('Selection changed to:', index);
  };
</script>

<MultiSwitch
  bind:selectedIndex={selectedIndex}
  items={options}
  shouldDisplayLabels={true}
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
			titleText="Working with Custom Objects"
			subtitleText="Using both children and labelTemplate with complex data"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Template Usage">

			{#snippet demoContent()}
				<div class="switch-demo">
					<span class="switch-label">Skill level:</span>
					<div style="padding-bottom: 4rem;">
						<MultiSwitch
							bind:selectedIndex={customLabelsIndex}
							items={customOptions}
							shouldDisplayLabels={true}
							labelPosition="bottom"
							size={60}>

							{#snippet children({ item, isSelected })}
								<div class="text-center">
									<div class="fw-bold small">{item?.name?.charAt(0) || ''}</div>
								</div>
							{/snippet}

							{#snippet labelTemplate({ currentIndex, item, isSelected })}
								<div class="text-center mt-2">
									<div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name || ''}</div>
									<small class="text-muted">{item?.description || ''}</small>
								</div>
							{/snippet}
						</MultiSwitch>
					</div>
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
</script>

<MultiSwitch
  bind:selectedIndex={selected}
  items={options}
  shouldDisplayLabels={true}
  size={60}>

  {#snippet children({ item, isSelected })}
    <div class="text-center">
      <div class="fw-bold small">{item?.name?.charAt(0) || ''}</div>
    </div>
  {/snippet}

  {#snippet labelTemplate({ currentIndex, item, isSelected })}
    <div class="text-center mt-2">
      <div class="fw-bold {isSelected ? 'text-primary' : ''}">{item?.name || ''}</div>
      <small class="text-muted">{item?.description || ''}</small>
    </div>
  {/snippet}
</MultiSwitch>`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Custom Object Support</h4>
					<p>
						When using complex objects, provide both <code>children</code> and
						<code>labelTemplate</code> snippets to display different parts of your data.
					</p>
					<h4>Template Roles</h4>
					<ul>
						<li><strong>children:</strong> Compact display in switch area (first letter)</li>
						<li><strong>labelTemplate:</strong> Full details in labels (name + description)</li>
					</ul>
					<h4>Best Practices</h4>
					<p>
						Keep switch content minimal and use labels for detailed information
						to maintain readability and usability.
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
							<div class="display-6 mb-3">🎨</div>
							<h5>Styling</h5>
							<p>Learn to customize colors and styles</p>
							<a href="/examples/styling" class="btn btn-primary">Styling Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">⚡</div>
							<h5>Advanced</h5>
							<p>Advanced features and techniques</p>
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