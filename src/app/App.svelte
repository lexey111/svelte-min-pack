<script lang="ts">
	import {onDestroy, setContext} from 'svelte';
	import {Router} from 'svelte-routing';

	import AppMenu from '../components/AppMenu.svelte';
	import Footer from '../components/Footer.svelte';

	import Routing from '../config/Routing.svelte';

	import {AppStateStore} from '../stores/app/app-state-store';
	import {extendHistoryTracking} from './history-helper';
	import ModalComponent from './modal/ModalComponent.svelte';

	// app context (state)
	let app_state = {
		modal: {},
		path: ''
	};
	const appStateUnsubscribe = AppStateStore.subscribe(value => {
		app_state.modal = value.modal;
		app_state.path = value.path;
	});
	setContext('AppState', app_state);

	// routing ans history
	export let url = '';

	extendHistoryTracking();
	updateCurrentLocation();

	function updateCurrentLocation() {
		AppStateStore.setPath(window.location.pathname);
	}

	['hashchange', 'locationchange'].forEach(eventName => {
		window.addEventListener(eventName, updateCurrentLocation)
	});

	// lifecycle
	onDestroy(() => {
		appStateUnsubscribe();
	});
</script>

<ModalComponent/>

<main class='app-content'>
	<h1>Svelte | minpack</h1>

	<Router url="{url}">
		<AppMenu/>
		<Routing/>
	</Router>

	<Footer/>
</main>

<style lang="less">
	main {
		h1 {
			color: #1f3e5f;
			font-weight: 100;
			display: inline-flex;
			justify-content: center;
			align-items: center;
			margin: .5em 0;
			padding: 0;
			text-transform: uppercase;
			font-size: 2rem;
		}
	}
</style>
