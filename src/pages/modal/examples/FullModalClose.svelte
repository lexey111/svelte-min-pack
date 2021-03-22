<script lang="ts">
	export let onClose: () => void;
	export let title: string;
</script>

<div class="modal-header">Danger</div>

<div class="modal-content" style="width:20em">
	<p>
		This window could be closed only by button below.
	</p>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab accusantium ad architecto consequatur cupiditate eos esse eum, fugit ipsum nam nostrum quas
		quibusdam quo temporibus ullam velit vitae! Temporibus, vero.
	</p>
</div>

<div class="modal-footer">
	<button class="press press-ghost press-white" on:click={onClose}>{title}</button>
</div>
