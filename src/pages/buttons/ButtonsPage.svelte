<script lang="ts">
	import Syntax from '../../components/Syntax.svelte';
	//
	const colors = [
		'red', 'pink', 'purple', 'deeppurple', 'indigo', 'blue', 'lightblue',
		'cyan', 'teal', 'green', 'lightgreen', 'lime', 'yellow', 'amber',
		'orange', 'deeporange', 'brown', 'grey', 'bluegrey', 'black'
	];
</script>

<div class="app-page">
	<h1>Buttons</h1>

	<p>
		Pack uses <a href="https://press-css.io/" target="_blank">Press.CSS</a> buttons:
	</p>

	<h2>Examples</h2>
	<Syntax>{`<button class="press press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-{color}">{color}</button>
		{/each}
	</div>

	<h3>Round</h3>
	<Syntax>{`<button class="press press-round press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-round press-{color}">{color}</button>
		{/each}

	</div>

	<h3>Pill</h3>
	<Syntax>{`<button class="press press-pill press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-pill press-{color}">{color}</button>
		{/each}
	</div>

	<h3>Ghost</h3>
	<Syntax>{`<button class="press press-ghost press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-ghost press-{color}">{color}</button>
		{/each}
	</div>

	<h3>Round Ghost</h3>
	<Syntax>{`<button class="press press-round press-ghost press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-round press-ghost press-{color}">{color}</button>
		{/each}
	</div>

	<h3>Round Ghost Small</h3>
	<Syntax>{`<button class="press press-sm press-round press-ghost press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-sm press-round press-ghost press-{color}">{color}</button>
		{/each}
	</div>

	<h3>Raised</h3>
	<Syntax>{`<button class="press press-raised press-{color}">{color}</button>`}</Syntax>
	<div class="buttons-example">
		{#each colors as color}
			<button class="press press-raised press-{color}">{color}</button>
		{/each}
	</div>
</div>
