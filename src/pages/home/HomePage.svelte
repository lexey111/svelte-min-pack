<script lang="ts">
	import Syntax from '../../components/Syntax.svelte';
</script>

<div class="app-page">
	<h1>Welcome to Svelte MinPack</h1>

	<p>
		This is my boilerplate for different Admin UIs and simple projects implemented with Svelte.
	</p>

	<p>
		It includes very basic things: infrastructure and very basic set of UI, literally only buttons and modals.
	</p>

	<h2>Infrastructure</h2>

	<ul>
		<li><a href="https://webpack.js.org/" target="_blank">Webpack</a> as a builder,</li>
		<li><a href="https://www.typescriptlang.org/" target="_blank">TypeScript</a> as main language,</li>
		<li><a href="http://lesscss.org/" target="_blank">LESS</a> as a stylesheet
			preprocessor (rather basic, so could by easily replaced with SASS or whatever),
		</li>
		<li><a href="https://svelte.dev/" target="_blank">Svelte</a>, and</li>
		<li><a href="https://eslint.org/" target="_blank">ESLint </a>as a linter.</li>
	</ul>

	<h2>Things included</h2>

	<ul>
		<li><a href="https://github.com/EmilTholin/svelte-routing" target="_blank">Svelte routing</a>,</li>
		<li><a href="https://press-css.io/" target="_blank">Press.CSS</a> buttons,</li>
		<li><a href="https://prismjs.com/index.html" target="_blank">Prism.js</a> for syntax highlight.</li>
	</ul>

	<h2>Configuration</h2>

	<h3>Garbage</h3>

	<p>
		To clean up unused things (pages, 3rd party components) you need to delete:
	</p>

	<ol>
		<li><code class="file">src/styles/syntax-example.less</code> &mdash; styles for example pages <br/>
			<i>Note: remove <code>@import "syntax-example";</code> line from <code class="file">src/styles/index.less</code> file.</i>
		</li>
		<li><code class="file">src/pages/home/HomePage.svelte</code> &mdash; syntax highlight component</li>
		<li><code class="file">src/assets/prism</code> folder &mdash; syntax highlight engine (prism)</li>
		<li>
			Unnecessary files: <code class="file">src/pages/*</code> folders.
		</li>
	</ol>

	<h3>Routing</h3>
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

	<p>
		So you need only to create your pages and declare them here.
	</p>

	<hr/>

	<p>
		Good luck!
	</p>

</div>
