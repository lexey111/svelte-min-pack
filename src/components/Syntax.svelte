<script lang="ts">
	import {onMount} from 'svelte';

	import '../assets/prism/prism';
	import '../assets/prism/prism.css';

	export let lang = 'ts';

	onMount(() => {
		window['Prism'].highlightAll();
	});
</script>

<pre><code class="language-{lang}"><slot></slot></code></pre>
