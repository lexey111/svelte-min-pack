<script lang="ts">
	export let onApply: () => void;
	export let onCancel: () => void;
</script>

<div class="modal-header">Confirmation</div>

<div class="modal-content" style="width:40em">
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab accusantium ad architecto consequatur cupiditate eos esse eum, fugit ipsum nam nostrum quas
		quibusdam quo temporibus ullam velit vitae! Temporibus, vero.
	</p>
	<p>Adipisci corporis culpa dolor dolorem excepturi explicabo, facere fugit laboriosam molestiae natus nisi nulla obcaecati odit officiis omnis reiciendis
		rem reprehenderit sequi velit veniam! Alias atque eaque ipsum laudantium minima?
	</p>
</div>

<div class="modal-footer">
	<button class="press press-deeppurple" on:click={onApply}>Apply</button>
	<button class="press press-blue press-ghost" on:click={onCancel}>Cancel</button>
</div>
