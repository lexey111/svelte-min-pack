<script lang="ts">
	import {Link} from 'svelte-routing';
	import Syntax from '../../components/Syntax.svelte';
</script>

<div class="app-page">
	<h1>Routing</h1>
	<ul>
		<li>
			<Link to="routing/secondary">Secondary page</Link>
		</li>
		<li>
			<Link to="routing/abc-def/a123-456">Parameterized route</Link>
		</li>
	</ul>

	<h2>Explanation</h2>
	<p>
		Routing in the application uses two files: <code class="file">src/config/Routing.svelte</code>
		and <code class="file">src/pages/home/HomePage.svelte</code>.
	</p>

	<p>
		First one is a <i>physical</i> routing: declaration of available routes:
	</p>

	<Syntax lang="html">&lt;{'script lang="ts">\n' +
	'  import {Route} from "svelte-routing";\n' +
	'  import HomePage from "../pages/home/HomePage.svelte";\n' +
	'  import ModalPage from "../pages/modal/ModalPage.svelte";\n' +
	'  import ButtonsPage from "../pages/buttons/ButtonsPage.svelte";\n' +
	'  import RoutingPage from "../pages/routing/RoutingPage.svelte";\n' +
	'  import RoutingParameterizedPage from "../pages/routing/RoutingParameterizedPage.svelte";\n' +
	'  import RoutingSecondaryPage from "../pages/routing/RoutingSecondaryPage.svelte";\n' +
	'</script>\n' +
	'\n' +
	'<div class="app-pages">\n' +
	'  <Route path="buttons" component="{ButtonsPage}"/>\n' +
	'  <Route path="routing" component="{RoutingPage}"/>\n' +
	'  <Route path="routing/secondary" component="{RoutingSecondaryPage}"/>\n' +
	'  <Route path="routing/:user/:record" let:params component="{RoutingParameterizedPage}"/>\n' +
	'  <Route path="modal" component="{ModalPage}"/>\n' +
	'  <Route path="home" component="{HomePage}"/>\n' +
	'  <Route path="/"><HomePage/></Route>\n' +
	'</div>'}`
	</Syntax>

	<p>
		Second file is declaration of routes which are <i>displayed in main menu</i>:
	</p>

	<Syntax>{`export const menuRoutes = [
  ['home', 'Home'], // [route, title]
  ['routing', 'Routing'],
  ['modal', 'Modal'],
  ['buttons', 'Buttons'],
];
`}</Syntax>


</div>
