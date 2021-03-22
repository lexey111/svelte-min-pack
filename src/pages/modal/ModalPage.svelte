<script lang="ts">
	import {getContext} from 'svelte';

	import Syntax from '../../components/Syntax.svelte';

	import {TAppModal} from '../../stores/app/app-state-store.interface';
	import FullModal from './examples/FullModal.svelte';
	import FullModalClose from './examples/FullModalClose.svelte';
	import FullscreenModal from './examples/FullscreenModal.svelte';
	import SimpleModal from './examples/SimpleModal.svelte';

	const modal = (getContext('AppState') as { modal: TAppModal }).modal;

	const handleModal = () => {
		modal.open(SimpleModal);
	}

	const handleModalWithClose = () => {
		modal.open(SimpleModal, {closeButton: true});
	}

	const handleModalFullscreen = () => {
		modal.open(FullscreenModal, {
			closeButton: false,
			extraClass: 'fullscreen',
			componentProps: {
				onClose: () => modal.close(),
			}
		});
	}

	const handleFullModalClose = () => {
		modal.open(FullModal, {
			closeButton: true,
			componentProps: {
				onCancel: () => modal.close(),
				onApply: () => {
					alert('Confirmed!');
					modal.close();
				}
			}
		});
	}

	const handleModalManually = () => {
		modal.open(
			FullModalClose,
			{
				closeButton: false,
				closeOnEsc: false,
				closeOnOuterClick: false,
				extraClass: 'danger',
				componentProps: {
					onClose: () => modal.close(),
					title: 'Cancel'
				}
			});
	}
</script>

<div class="app-page syntax-example">
	<h1>Modal</h1>

	<p>
		Pack includes super-simple implementation of modal subsystem. "Modal" here is an overlay which intercepts the UI focus and wait some
		user input, or background process, or whatever, on the foreground.
	</p>

	<p>
		In this pack pretty primitive implementation is included. Main restriction is &mdash; only one Modal can be displayed at any given moment: it is a
		global singleton.
	</p>

	<p>
		By default Modal can be closed by ESC key, clicking outside content and clicking close button (if it is visible). All these options could be disabled.
	</p>

	<p>
		Modal allows passing custom <code class="text">extraClass</code> property to tune appearance.
	</p>

	<h2>Examples</h2>

	<p>
		To show the modal, only two things needed. First, <code class="text">modal</code> singleton itself, and second &mdash; the component to be displayed
		as a content of the Modal.
	</p>

	<Syntax>{`import {getContext} from 'svelte';
const modal = (getContext('AppState') as { modal: TAppModal }).modal;
`}</Syntax>

	<p>
		<code class="text">TModal</code> is declared as
	</p>
	<Syntax>{`export type TAppModal = {
	open: (component: any, props?: {
		closeButton?: boolean
		closeOnEsc?: boolean
		closeOnOuterClick?: boolean

		extraClass?: string

		componentProps?: any
	}) => void

	close: () => void
};
`}</Syntax>

	<h3>Simple modal</h3>
	<button class="press press-ghost press-blue" on:click={handleModal}>Show modal</button>

	<p class="path">SomePage.svelte</p>
	<Syntax>{`import {getContext} from 'svelte';
import SimpleModal from './examples/SimpleModal.svelte';

const modal = (getContext('AppState') as { modal: TAppModal }).modal;

const handleModal = () => {
  modal.open(SimpleModal);
}
...
<button class="press..." on:click={handleModal}>Show modal</button>
`}
	</Syntax>

	<p class="path">SimpleModal.svelte</p>
	<Syntax lang="html">{`<h1>Hello!</h1>`}</Syntax>

	<h3>Simple modal with close button</h3>
	<button class="press press-ghost press-blue" on:click={handleModalWithClose}>With close button</button>

	<p>
		Modal supports some customization of the way how it could be closed.
	</p>

	<Syntax>{`export const closeButton = true;
export const closeOnEsc = true;
export const closeOnOuterClick = true;
`}
	</Syntax>

	<p class="path">SomePage.svelte</p>
	<Syntax>{`import {getContext} from 'svelte';
import SimpleModal from './examples/SimpleModal.svelte';

const modal = (getContext('AppState') as { modal: TAppModal }).modal;

const handleModalWithClose = () => {
  modal.open(SimpleModal, {closeButton: true});
}
...
<button class="press..." on:click={handleModalWithClose}>With close button</button>
`}
	</Syntax>

	<h3>Markup and callbacks</h3>
	<button class="press press-ghost press-blue" on:click={handleFullModalClose}>Full markup</button>

	<p>
		To display Modal in "dialog" style there is a few special classes available:
	</p>

	<p class="path">SomePage.svelte</p>
	<Syntax>{`import {getContext} from 'svelte';
import FullModal from './examples/FullModal.svelte';

const modal = (getContext('AppState') as { modal: TAppModal }).modal;

const handleFullModalClose = () => {

  modal.open(FullModal, {
    closeButton: true,
    componentProps: {
      onCancel: () => modal.close(),

      onApply: () => {
        alert('Confirmed!');
        modal.close();
      }
    }
  });
}
...
<button class="press..." on:click={handleFullModalClose}>Full markup</button>
`}
	</Syntax>
	<p class="path">FullModal.svelte</p>

	<Syntax lang="html">&lt;{`script lang="ts">
  export let onApply: () => void;
  export let onCancel: () => void;
</script>

<div class="modal-header">Confirmation</div>

<div class="modal-content" style="width:40em">
  ...
</div>

<div class="modal-footer">
  <button class="press press-deeppurple" on:click={onApply}>Apply</button>
  <button class="press press-blue press-ghost" on:click={onCancel}>Cancel</button>
</div>`}</Syntax>

	<h4>Passing class and strict close mode</h4>
	<button class="press press-ghost press-blue" on:click={handleModalManually}>Only close button</button>

	<p>
		To set up class and disable close methods, use parameters:
	</p>

	<p class="path">SomePage.svelte</p>
	<Syntax>{`import {getContext} from 'svelte';
import FullModalClose from './examples/FullModalClose.svelte';

const modal = (getContext('AppState') as { modal: TAppModal }).modal;

const handleModalManually = () => {
  modal.open(
    FullModalClose,
    {
      closeButton: false,
      closeOnEsc: false,
      closeOnOuterClick: false,

      extraClass: 'danger',

      componentProps: {
        onClose: () => modal.close(),
        title: 'Cancel'
      }
  });
}
...
<button class="press..." on:click={handleModalManually}>Only close button</button>
`}</Syntax>

	<p>And declare the class <code class="text">.danger</code>:</p>

	<p class="path">SomePage.svelte</p>
	<Syntax lang="less">&lt;{`style lang="less">
:global {
  #app-full-screen-message {
    &.modal-like {

      div.modal-like-content {
        &.danger {
          border: 4px solid #ff005c;
          background-color: #d50c52;
          color: #fff;

          .modal-header, .modal-footer {
            border-color: #ff005c;
          }
        }
      }
    }
  }
}
</style>
`}</Syntax>

	<h4>Full screen</h4>
	<button class="press press-ghost press-blue" on:click={handleModalFullscreen}>Full screen</button>
	<p>
		Just pass the class <code class="text">fullscreen</code>:
	</p>

	<p class="path">SomePage.svelte</p>
	<Syntax>{`import {getContext} from 'svelte';
import FullscreenModal from './examples/FullscreenModal.svelte';

const modal = (getContext('AppState') as { modal: TAppModal }).modal;

const handleModalFullscreen = () => {
  modal.open(FullscreenModal, {
    closeButton: false,

    extraClass: 'fullscreen',

    componentProps: {
      onClose: () => modal.close(),
    }
  });
}
...
<button class="press..." on:click={handleModalFullscreen}>Full screen</button>
`}</Syntax>

	<p class="path">FullscreenModal.svelte</p>

	<Syntax lang="html">&lt;{`script lang="ts">
  export let onClose: () => void;
</script>

<div class="modal-header">Information</div>

<div class="modal-content" style="width:40em">
...
</div>

<div class="modal-footer">
  <button class="press press-deeppurple" on:click={onClose}>Close</button>
</div>`}</Syntax>

</div>


<style lang="less">
	:global {
		#app-full-screen-message {
			&.modal-like {

				div.modal-like-content {
					&.danger {
						border: 4px solid #ff005c;
						background-color: #d50c52;
						color: #fff;

						.modal-header, .modal-footer {
							border-color: #ff005c;
						}
					}
				}
			}
		}
	}
</style>
