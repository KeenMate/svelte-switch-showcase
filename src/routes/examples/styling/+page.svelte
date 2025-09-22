<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	// Demo states
	let basicStyledSwitch = $state(false);
	let customColorSwitch = $state(true);
	let gradientSwitch = $state(false);
	let themedSwitches = $state([false, true, false, false]);
	let styledMultiSwitch = $state(1);
	let customMultiSwitch = $state(2);

	// Style configurations
	const redTheme = {
		backgroundColor: '#ffebee',
		thumbColor: '#f44336',
		thumbBorderColor: '#d32f2f'
	};

	const greenTheme = {
		backgroundColor: '#e8f5e8',
		thumbColor: '#4caf50',
		thumbBorderColor: '#388e3c'
	};

	const blueTheme = {
		backgroundColor: '#e3f2fd',
		thumbColor: '#2196f3',
		thumbBorderColor: '#1976d2'
	};

	const purpleTheme = {
		backgroundColor: '#f3e5f5',
		thumbColor: '#9c27b0',
		thumbBorderColor: '#7b1fa2'
	};

	const multiSwitchStyles = [
		{ backgroundColor: '#ffebee', thumbColor: '#f44336', thumbBorderColor: '#d32f2f' },
		{ backgroundColor: '#fff3e0', thumbColor: '#ff9800', thumbBorderColor: '#f57c00' },
		{ backgroundColor: '#e8f5e8', thumbColor: '#4caf50', thumbBorderColor: '#388e3c' },
		{ backgroundColor: '#e3f2fd', thumbColor: '#2196f3', thumbBorderColor: '#1976d2' }
	];

	const priorityLevels = ['Low', 'Medium', 'High', 'Critical'];
	const powerModes = ['Eco', 'Normal', 'Sport', 'Race'];

	// Toggle function for theme demo
	const toggleThemeSwitch = (index: number) => {
		themedSwitches[index] = !themedSwitches[index];
	};
</script>

<DocLayout
	titleText="Styling Examples"
	descriptionText="Learn how to customize the appearance of switch components with colors, themes, and styles">

	<div class="py-4">
		<!-- Basic Color Customization -->
		<ShowcaseSection
			titleText="Color Customization"
			subtitleText="Customize colors using itemStyles prop"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Color Properties">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Custom Red:</span>
						<Switch
							bind:checked={basicStyledSwitch}
							itemStyles={redTheme}
							size={60} />
						<span class="switch-state">State: {basicStyledSwitch ? 'ON' : 'OFF'}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Custom Green:</span>
						<Switch
							bind:checked={customColorSwitch}
							itemStyles={greenTheme}
							size={60} />
						<span class="switch-state">State: {customColorSwitch ? 'ON' : 'OFF'}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let isEnabled = $state(false);

  const redTheme = {
    backgroundColor: '#ffebee',
    thumbColor: '#f44336',
    thumbBorderColor: '#d32f2f'
  };

  const greenTheme = {
    backgroundColor: '#e8f5e8',
    thumbColor: '#4caf50',
    thumbBorderColor: '#388e3c'
  };
</script>

<Switch
  bind:checked={isEnabled}
  itemStyles={redTheme}
  size={60} />

<Switch
  bind:checked={isEnabled}
  itemStyles={greenTheme}
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Available Style Properties</h4>
					<ul>
						<li><code>backgroundColor</code> - Track background color</li>
						<li><code>thumbColor</code> - Thumb (handle) color</li>
						<li><code>thumbBorderColor</code> - Thumb border color</li>
					</ul>
					<h4>Color Formats</h4>
					<p>
						Use any valid CSS color format: hex, rgb, rgba, hsl, or named colors.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Theme Collection -->
		<ShowcaseSection
			titleText="Pre-defined Themes"
			subtitleText="Collection of ready-to-use color themes"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Theme Usage">

			{#snippet demoContent()}
				<div class="row g-3">
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Red Theme:</span>
							<Switch
								checked={themedSwitches[0]}
								onToggle={() => toggleThemeSwitch(0)}
								itemStyles={redTheme}
								size={50} />
						</div>
					</div>
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Green Theme:</span>
							<Switch
								checked={themedSwitches[1]}
								onToggle={() => toggleThemeSwitch(1)}
								itemStyles={greenTheme}
								size={50} />
						</div>
					</div>
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Blue Theme:</span>
							<Switch
								checked={themedSwitches[2]}
								onToggle={() => toggleThemeSwitch(2)}
								itemStyles={blueTheme}
								size={50} />
						</div>
					</div>
					<div class="col-md-6">
						<div class="switch-demo">
							<span class="switch-label">Purple Theme:</span>
							<Switch
								checked={themedSwitches[3]}
								onToggle={() => toggleThemeSwitch(3)}
								itemStyles={purpleTheme}
								size={50} />
						</div>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`const themes = {
  red: {
    backgroundColor: '#ffebee',
    thumbColor: '#f44336',
    thumbBorderColor: '#d32f2f'
  },
  green: {
    backgroundColor: '#e8f5e8',
    thumbColor: '#4caf50',
    thumbBorderColor: '#388e3c'
  },
  blue: {
    backgroundColor: '#e3f2fd',
    thumbColor: '#2196f3',
    thumbBorderColor: '#1976d2'
  },
  purple: {
    backgroundColor: '#f3e5f5',
    thumbColor: '#9c27b0',
    thumbBorderColor: '#7b1fa2'
  }
};

<Switch itemStyles={themes.red} />
<Switch itemStyles={themes.green} />
<Switch itemStyles={themes.blue} />
<Switch itemStyles={themes.purple} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Consistent Design</h4>
					<p>
						Create a collection of themes to maintain consistent styling
						across your application.
					</p>
					<h4>Material Design Colors</h4>
					<p>
						These examples use Material Design color palette for professional
						appearance and accessibility.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- MultiSwitch Styling -->
		<ShowcaseSection
			titleText="MultiSwitch Styling"
			subtitleText="Individual styling for each option"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Per-Item Styling">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4">
					<div class="switch-demo">
						<span class="switch-label">Priority Level:</span>
						<MultiSwitch
							bind:selectedIndex={styledMultiSwitch}
							items={priorityLevels}
							itemStyles={multiSwitchStyles}
							shouldDisplayLabels={false}
							size={60} />
						<span class="switch-state">Priority: {priorityLevels[styledMultiSwitch]}</span>
					</div>
					<div class="switch-demo">
						<span class="switch-label">Power Mode:</span>
						<MultiSwitch
							bind:selectedIndex={customMultiSwitch}
							items={powerModes}
							itemStyles={multiSwitchStyles}
							shouldDisplayLabels={false}
							size={50} />
						<span class="switch-state">Mode: {powerModes[customMultiSwitch]}</span>
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<script>
  let selectedIndex = $state(1);

  const priorityLevels = ['Low', 'Medium', 'High', 'Critical'];

  const styles = [
    { backgroundColor: '#ffebee', thumbColor: '#f44336', thumbBorderColor: '#d32f2f' },
    { backgroundColor: '#fff3e0', thumbColor: '#ff9800', thumbBorderColor: '#f57c00' },
    { backgroundColor: '#e8f5e8', thumbColor: '#4caf50', thumbBorderColor: '#388e3c' },
    { backgroundColor: '#e3f2fd', thumbColor: '#2196f3', thumbBorderColor: '#1976d2' }
  ];
</script>

<MultiSwitch
  bind:selectedIndex={selectedIndex}
  items={priorityLevels}
  itemStyles={styles}
  shouldDisplayLabels={true}
  labelPosition="bottom"
  size={60} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Array of Styles</h4>
					<p>
						Pass an array of style objects to customize each option individually.
						Each style corresponds to the option at the same index.
					</p>
					<h4>Visual Hierarchy</h4>
					<p>
						Use different colors to create visual hierarchy and meaning
						(e.g., red for critical, green for safe).
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Size Variations with Styling -->
		<ShowcaseSection
			titleText="Size and Style Combinations"
			subtitleText="Combining different sizes with custom styling"
			demoColumnTitle="Live Demo"
			controlsColumnTitle="Code"
			descriptionColumnTitle="Design Tips">

			{#snippet demoContent()}
				<div class="d-flex flex-column gap-4 align-items-start">
					<div class="switch-demo">
						<span class="switch-label">Compact (40px):</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={blueTheme}
							size={40} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Standard (60px):</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={blueTheme}
							size={60} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Large (80px):</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={blueTheme}
							size={80} />
					</div>
					<div class="switch-demo">
						<span class="switch-label">Vertical + Styled:</span>
						<Switch
							bind:checked={gradientSwitch}
							itemStyles={purpleTheme}
							orientation="vertical"
							size={100} />
					</div>
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`const theme = {
  backgroundColor: '#e3f2fd',
  thumbColor: '#2196f3',
  thumbBorderColor: '#1976d2'
};

<!-- Different sizes with same theme -->
<Switch itemStyles={theme} size={40} />
<Switch itemStyles={theme} size={60} />
<Switch itemStyles={theme} size={80} />

<!-- Vertical with custom size -->
<Switch
  itemStyles={theme}
  orientation="vertical"
  size={100} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>Scalable Styling</h4>
					<p>
						Custom styles work consistently across all sizes. The component
						automatically scales colors and proportions.
					</p>
					<h4>Responsive Design</h4>
					<p>
						Consider using different sizes for different screen sizes:
						smaller for mobile, larger for touch interfaces.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- CSS Custom Properties -->
		<div class="mt-5">
			<h2 class="mb-4">Advanced CSS Customization</h2>
			<div class="row">
				<div class="col-lg-6">
					<h4>CSS Variables</h4>
					<p>For more advanced styling, you can also use CSS custom properties:</p>
					<CodeBlock
						codeContent={`:global(.custom-switch) {
  --switch-track-bg: linear-gradient(45deg, #667eea 0%, #764ba2 100%);
  --switch-thumb-color: #ffffff;
  --switch-thumb-shadow: 0 4px 8px rgba(0,0,0,0.2);
  --switch-border-radius: 25px;
  --switch-transition: all 0.3s cubic-bezier(0.4, 0.0, 0.2, 1);
}

.custom-switch:hover {
  --switch-thumb-shadow: 0 6px 12px rgba(0,0,0,0.3);
}`}
						languageType="css"
						titleText="custom-styles.css"
					/>
				</div>
				<div class="col-lg-6">
					<h4>SCSS Mixins</h4>
					<p>Create reusable styling mixins for consistent theming:</p>
					<CodeBlock
						codeContent={`@mixin switch-theme($primary, $secondary, $accent) {
  .switch-theme {
    --switch-track-bg: #{$secondary};
    --switch-thumb-color: #{$primary};
    --switch-thumb-border: #{$accent};

    &.checked {
      --switch-track-bg: #{$primary};
      --switch-thumb-color: #{$secondary};
    }
  }
}

// Usage
@include switch-theme(#3f51b5, #e8eaf6, #1a237e);`}
						languageType="scss"
						titleText="themes.scss"
					/>
				</div>
			</div>
		</div>

		<!-- Best Practices -->
		<div class="mt-5">
			<h2 class="mb-4">Styling Best Practices</h2>
			<div class="row g-4">
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>🎨 Color Guidelines</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Ensure sufficient contrast for accessibility</li>
								<li>✅ Use consistent color palette across your app</li>
								<li>✅ Consider color-blind users</li>
								<li>✅ Test colors in light and dark themes</li>
								<li>✅ Follow your brand guidelines</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card h-100">
						<div class="card-header">
							<h5>📐 Size Guidelines</h5>
						</div>
						<div class="card-body">
							<ul class="list-unstyled">
								<li>✅ Minimum 44px for touch interfaces</li>
								<li>✅ Scale proportionally with text size</li>
								<li>✅ Maintain aspect ratios</li>
								<li>✅ Test on different screen densities</li>
								<li>✅ Consider responsive breakpoints</li>
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
							<div class="display-6 mb-3">⚡</div>
							<h5>Advanced Examples</h5>
							<p>Custom templates and advanced features</p>
							<a href="/examples/advanced" class="btn btn-primary">Advanced Guide</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">📚</div>
							<h5>API Reference</h5>
							<p>Complete documentation of all props</p>
							<a href="/api/switch" class="btn btn-outline-primary">API Docs</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card text-center h-100">
						<div class="card-body">
							<div class="display-6 mb-3">🎮</div>
							<h5>Playground</h5>
							<p>Interactive styling playground</p>
							<a href="/examples/advanced" class="btn btn-outline-primary">Advanced Examples</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</DocLayout>