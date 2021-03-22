<script lang="ts">
	import {Link, navigate} from 'svelte-routing';
	import Syntax from '../../components/Syntax.svelte';

	const goBack = () => {
		navigate('/routing');
	}
</script>

<div class="app-page">
	<h1>
		<Link to="routing">&larr;</Link>
		Secondary page
	</h1>

	<p>
		This page has route declared as <Syntax>&lt;Route path="routing/secondary" component="{'{'}RoutingSecondaryPage}"/></Syntax>
	</p>

	<p>
		There are some tricks to make this route active in menu applied in <code class="text">AppMenu.svelte</code> component.
	</p>

	<p>
		<button class="press press-ghost press-blue" on:click={goBack}>&larr; Back</button>
	</p>

</div>
