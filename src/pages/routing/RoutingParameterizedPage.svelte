<script lang="ts">
	import {Link, navigate} from 'svelte-routing';
	import Syntax from '../../components/Syntax.svelte';

	export let user;
	export let record;

	const goBack = () => {
		navigate('/routing');
	}
</script>

<div class="app-page">
	<h1>
		<Link to="routing">&larr;</Link>
		Parameterized route
	</h1>

	<h2>Parameters passed</h2>
	<pre class="json">User: <code class="text">{user}</code>
Record: <code class="text">{record}</code>
	</pre>

	<h3>Explanation</h3>
	<p>
		This page has route declared as <Syntax>&lt;Route path="routing/:user/:record" let:params component="{'{'}RoutingParameterizedPage}"/></Syntax>
	</p>

	<p>
		There are some tricks to make this route active in menu applied in <code class="text">AppMenu.svelte</code> component.
	</p>

	<p>
		To get the parameters just declare them in the Page component:
	</p>

	<Syntax>
		&lt;{`script lang="ts">
  export let user; // routing/:user/:record
  export let record;
</script>`}
	</Syntax>

	<p>
		<button class="press press-ghost press-blue" on:click={goBack}>&larr; Back</button>
	</p>

</div>
