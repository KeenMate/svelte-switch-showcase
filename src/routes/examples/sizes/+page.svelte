<script lang="ts">
	import { DocLayout, ShowcaseSection, CodeBlock } from '@keenmate/svelte-docs';
	import { Switch, MultiSwitch } from '@keenmate/svelte-switch';

	const sizes = [
		{ name: 'xs' as const, height: '31px', coefficient: '3.1' },
		{ name: 'sm' as const, height: '33px', coefficient: '3.3' },
		{ name: 'md' as const, height: '35px', coefficient: '3.5', isDefault: true },
		{ name: 'lg' as const, height: '38px', coefficient: '3.8' },
		{ name: 'xl' as const, height: '41px', coefficient: '4.1' }
	];

	const states = $state(sizes.map(() => ({ checked: false, multi: 1 })));
	const numericStates = $state([true, true, true, true]);
</script>

<DocLayout
	titleText="Sizes"
	descriptionText="Named sizes (xs / sm / md / lg / xl) aligned to pure-admin form heights, plus numeric pixel sizing">

	<div class="py-4">
		<!-- Named sizes -->
		<div>
			<h2>Named sizes</h2>
			<p class="text-muted">
				Each size resolves through <code>--base-input-size-&#123;size&#125;-height</code> ×
				<code>--sw-rem</code> (default 10px). Drop a switch into a pure-admin form-size context
				and it matches automatically; or pass <code>size="sm"</code> explicitly.
			</p>

			<div class="table-responsive">
				<table class="table table-bordered align-middle">
					<thead class="table-light">
						<tr>
							<th>Prop</th>
							<th>Coefficient</th>
							<th>Resolved height</th>
							<th>Switch</th>
							<th>MultiSwitch</th>
						</tr>
					</thead>
					<tbody>
						{#each sizes as s, i}
							<tr>
								<td>
									<code>size="{s.name}"</code>
									{#if s.isDefault}<span class="badge bg-info ms-2">default</span>{/if}
								</td>
								<td><code>{s.coefficient}</code></td>
								<td><code>{s.height}</code></td>
								<td>
									<Switch bind:checked={states[i].checked} size={s.name} />
								</td>
								<td>
									<MultiSwitch
										bind:selectedIndex={states[i].multi}
										items={['Lo', 'Md', 'Hi']}
										size={s.name} />
								</td>
							</tr>
						{/each}
					</tbody>
				</table>
			</div>
		</div>

		<!-- Numeric sizes -->
		<ShowcaseSection
			titleText="SZ01 Numeric sizes (legacy / explicit)"
			subtitleText="Pass a number to set --scale directly: scale = size / 50"
			col1Title="Live Demo"
			col2Title="Code"
			col3Title="When to use">

			{#snippet demoContent()}
				<div class="d-flex gap-4 align-items-center flex-wrap">
					{#each [40, 60, 80, 100] as n, i}
						<div class="text-center">
							<div class="mb-2"><code>size=&#123;{n}&#125;</code></div>
							<Switch bind:checked={numericStates[i]} size={n} />
						</div>
					{/each}
				</div>
			{/snippet}

			{#snippet controlsContent()}
				<CodeBlock
					codeContent={`<Switch bind:checked={value} size={40} />
<Switch bind:checked={value} size={60} />
<Switch bind:checked={value} size={80} />
<Switch bind:checked={value} size={100} />`}
					languageType="svelte"
				/>
			{/snippet}

			{#snippet descriptionContent()}
				<div class="prose">
					<h4>How it works</h4>
					<p>
						Numeric <code>size</code> sets <code>--scale = size / 50</code> inline.
						<code>size=&#123;50&#125;</code> renders the natural 32px height,
						<code>size=&#123;80&#125;</code> scales it to ~51px.
					</p>
					<h4>When to use numeric</h4>
					<p>
						Use numeric size for one-off displays where you need an exact pixel value
						that doesn't match the form table. For form-aligned defaults, use named sizes.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Pure-admin integration -->
		<ShowcaseSection
			titleText="SZ02 Pure-admin integration"
			subtitleText="Aligning switch sizes with pure-admin's font-size baseline"
			col1Title="Recipe"
			col2Title="Why it works"
			columnCountType={2}>

			{#snippet demoContent()}
				<CodeBlock
					codeContent={`/* In your pure-admin app */
:root {
  --sw-rem: 1rem;  /* aligns with pure-admin's 10px font-size baseline */
}

/* Or override individual sizes app-wide */
:root {
  --base-input-size-md-height: 4.0;  /* 40px instead of 35px default */
}`}
					languageType="css"
				/>
			{/snippet}

			{#snippet controlsContent()}
				<div class="prose">
					<p>
						Pure-admin sets <code>html &#123; font-size: 10px &#125;</code>, so
						<code>1rem = 10px</code> in that context. Setting
						<code>--sw-rem: 1rem</code> means switches scale with the user's font-size
						preference, like the rest of the form chrome.
					</p>
					<p>
						All five named sizes derive from
						<code>--base-input-size-&#123;name&#125;-height</code> — overriding any of
						them on a wrapper rescales every default-sized switch underneath.
					</p>
				</div>
			{/snippet}
		</ShowcaseSection>

		<!-- Migration note -->
		<div class="alert alert-warning mt-4">
			<strong>v2.0 default size change.</strong> The default size is now <code>'md'</code>
			(35px), up from the 1.x default of <code>50</code> (numeric, ≈32px). Switches with no
			explicit <code>size</code> are now ~3px taller — most consumers won't notice, but if
			you depended on the old default, pass <code>size=&#123;50&#125;</code> explicitly or
			set <code>--base-input-size-md-height: 3.2</code> globally.
		</div>
	</div>
</DocLayout>
