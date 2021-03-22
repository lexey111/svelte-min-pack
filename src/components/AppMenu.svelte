<script lang="ts">
	import {onDestroy} from 'svelte';
	import {Link} from 'svelte-routing';
	import {menuRoutes} from '../config/menu.config';
	import {AppStateStore} from '../stores/app/app-state-store';

	let activeRoutes = [];
	let current_path = 'home';

	function getActiveClass(route: string): string {
		return current_path.includes(route) ? 'active' : '';
	}

	function getActiveRoutes() {
		activeRoutes = menuRoutes.map(entry => [entry[0], entry[1], getActiveClass(entry[0])]);
	}

	// initial state
	getActiveRoutes();

	// react on location change
	const appStateUnsubscribe = AppStateStore.subscribe(value => {
		if (current_path !== value.path) {
			current_path = value.path || 'home';
			getActiveRoutes();
		}
	});

	onDestroy(() => {
		appStateUnsubscribe();
	});
</script>

<nav class="app-navigation">
	{#each activeRoutes as [path, name, className], i}
		<Link to={path} class={className}>{name}</Link>
	{/each}
</nav>

<style lang="less">
	:global {
		.app-navigation {
			display: flex;
			flex-flow: row wrap;
			background-color: var(--app-menu-bg);
			justify-content: center;
			font-size: .8rem;
			height: 40px;
			transition: background-color .2s ease, color .1s ease;

			a, a:visited {
				display: flex;
				align-content: center;
				align-items: center;
				width: auto;
				padding: 8px 16px;
				color: var(--app-menu-text);
				text-decoration: none;
				transition: background-color .2s ease, color .1s ease;

				&:hover, &:active {
					color: #fff;
					background-color: rgba(255, 255, 255, .2);
				}

				&[aria-current="page"], &.active {
					background-color: #fff;
					color: var(--app-menu-bg);
				}
			}
		}
	}
</style>
