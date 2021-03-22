<script lang="ts">
	import {Route} from 'svelte-routing';
	import HomePage from '../pages/home/HomePage.svelte';
	import ModalPage from '../pages/modal/ModalPage.svelte';
	import ButtonsPage from '../pages/buttons/ButtonsPage.svelte';
	import RoutingPage from '../pages/routing/RoutingPage.svelte';
	import RoutingParameterizedPage from '../pages/routing/RoutingParameterizedPage.svelte';
	import RoutingSecondaryPage from '../pages/routing/RoutingSecondaryPage.svelte';
</script>

<div class="app-pages">
	<Route path="buttons" component="{ButtonsPage}"/>
	<Route path="routing" component="{RoutingPage}"/>
	<Route path="routing/secondary" component="{RoutingSecondaryPage}"/>
	<Route path="routing/:user/:record" let:params component="{RoutingParameterizedPage}"/>
	<Route path="modal" component="{ModalPage}"/>
	<Route path="home" component="{HomePage}"/>
	<Route path="/">
		<HomePage/>
	</Route>
</div>
