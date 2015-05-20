# xquery-bootstrap
A set of utility functions for generating Bootstrap 3.1 markup in XQuery for server and client side rendering.

<div class="section">
  <h1>bootstrap.xqm</h1>
  <p>Provides helper functions for generating bootstrap component markup</p>
  <p>Namespace: <span class="badge">http://jw.bootstrap</span>
  </p>
  <p>Author: James Wright</p>
  <p>Version: 1.0</p>
  <p>Last Updated: 5/19/2015</p>
  <h2>Functions</h2>
  <div class="section" id="bootstrap:attributes1">
    <h4>bootstrap:attributes</h4>Generates a set of attribute elements<h5>Signature</h5>bootstrap:attributes($items as map(*)) as attribute()*<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>items</td>
          <td>1</td>
          <td>map(*)</td>
          <td>Map to use for generating the attributes.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>attribute()</div>
  <div class="section" id="bootstrap:badge1">
    <h4>bootstrap:badge</h4>Creates a badge element<h5>Signature</h5>bootstrap:badge($contents as item()*) as element(span)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>contents</td>
          <td>*</td>
          <td>item()</td>
          <td>Content to place within the badge</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(span)</div>
  <div class="section" id="bootstrap:breadcrumbs1">
    <h4>bootstrap:breadcrumbs</h4>Generates a breadcrumb element from the provided elements<h5>Signature</h5>bootstrap:breadcrumbs($array as array(map(xs:string, item()*))) as element(ol)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>array</td>
          <td>1</td>
          <td>array(map(xs:string, item()*))</td>
          <td>Items to generate the breadcrumb from. Each item should have a title and href property.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(ol)</div>
  <div class="section" id="bootstrap:breadcrumbs2">
    <h4>bootstrap:breadcrumbs</h4>Generates a breadcrumb element from the provided elements<h5>Signature</h5>bootstrap:breadcrumbs($array as array(*), $renderer as function(*)) as element(ol)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>array</td>
          <td>1</td>
          <td>array(*)</td>
          <td>Item to generate the breadcrumb from.</td>
        </tr>
        <tr>
          <td>renderer</td>
          <td>1</td>
          <td>function(*)</td>
          <td>Function to generate a single breadcrumb item provided a map</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(ol)</div>
  <div class="section" id="bootstrap:collapse2">
    <h4>bootstrap:collapse</h4>Adds collapsability to the provided contents<h5>Signature</h5>bootstrap:collapse($control as node(), $contents as node()*) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>control</td>
          <td>1</td>
          <td>node()</td>
          <td>Button or anchor to toggle the contents collapsile.</td>
        </tr>
        <tr>
          <td>contents</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place withing the collapsable div</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:divider0">
    <h4>bootstrap:divider</h4>Generates a dropdown divider element<h5>Signature</h5>bootstrap:divider() as element(li)<h5>Parameters</h5>
    <table class="table">
      <thead/>
      <tbody/>
    </table>
    <h5>Returns</h5>element(li)</div>
  <div class="section" id="bootstrap:dropdown2">
    <h4>bootstrap:dropdown</h4>Adds dropdown capabilities to a provided button or anchor<h5>Signature</h5>bootstrap:dropdown($button as element(*), $items as element()*) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>button</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Button or anchor to add the drop down too</td>
        </tr>
        <tr>
          <td>items</td>
          <td>*</td>
          <td>element()</td>
          <td>Elements to place in the dropdown</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:dropdown3">
    <h4>bootstrap:dropdown</h4>Adds dropdown capabilities to a provided button or anchor<h5>Signature</h5>bootstrap:dropdown($container as element(*), $button as element(), $items as element(li)*) as element(*)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>container</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Element which will contain the dropdown button or anchor.</td>
        </tr>
        <tr>
          <td>button</td>
          <td>1</td>
          <td>element()</td>
          <td>Button or anchor to add the drop down too</td>
        </tr>
        <tr>
          <td>items</td>
          <td>*</td>
          <td>element(li)</td>
          <td>Elements to place in the dropdown</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(*)</div>
  <div class="section" id="bootstrap:grid2">
    <h4>bootstrap:grid</h4>Generate a grid<h5>Signature</h5>bootstrap:grid($items as array(*), $columns as xs:integer) as element(div)*<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>items</td>
          <td>1</td>
          <td>array(*)</td>
          <td>Content to generate the grid from.</td>
        </tr>
        <tr>
          <td>columns</td>
          <td>1</td>
          <td>xs:integer</td>
          <td>Number of items per row</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:head0">
    <h4>bootstrap:head</h4>Bootstrap a titleless basic head<h5>Signature</h5>bootstrap:head() as node()<h5>Parameters</h5>
    <table class="table">
      <thead/>
      <tbody/>
    </table>
    <h5>Returns</h5>node()</div>
  <div class="section" id="bootstrap:head2">
    <h4>bootstrap:head</h4>Creates a head object with standard meta tags<h5>Signature</h5>bootstrap:head($title as xs:string, $contents as node()*) as element(head)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>title</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Title of the page</td>
        </tr>
        <tr>
          <td>contents</td>
          <td>*</td>
          <td>node()</td>
          <td>Additional elements to add to the head</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(head)</div>
  <div class="section" id="bootstrap:html3">
    <h4>bootstrap:html</h4>Creates the final html output node with the provided page contents, head and navbar.<h5>Signature</h5>bootstrap:html($contents as item()*, $head as node(), $nav as node()?) as element(html)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>contents</td>
          <td>*</td>
          <td>item()</td>
          <td>Page contents to place within the main page container div</td>
        </tr>
        <tr>
          <td>head</td>
          <td>1</td>
          <td>node()</td>
          <td>The head element to use for the page</td>
        </tr>
        <tr>
          <td>nav</td>
          <td>?</td>
          <td>node()</td>
          <td>A nav element for use on the page</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(html)</div>
  <div class="section" id="bootstrap:jumbotron3">
    <h4>bootstrap:jumbotron</h4>Generates a jumbotron<h5>Signature</h5>bootstrap:jumbotron($title as xs:string, $content as xs:string?, $style as xs:string?) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>title</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Title to display</td>
        </tr>
        <tr>
          <td>content</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Content to place below title</td>
        </tr>
        <tr>
          <td>style</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Style class of the content's container</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:label1">
    <h4>bootstrap:label</h4>Creates a 'default' label with the supplied contents.<h5>Signature</h5>bootstrap:label($contents as item()*) as element(span)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>contents</td>
          <td>*</td>
          <td>item()</td>
          <td>Content to place within the label</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(span)</div>
  <div class="section" id="bootstrap:label2">
    <h4>bootstrap:label</h4>Creates a label of the specified type.<h5>Signature</h5>bootstrap:label($type as xs:string, $contents as item()*) as element(span)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>type</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Type of label to create: default, primary, success, info, warning, danger</td>
        </tr>
        <tr>
          <td>contents</td>
          <td>*</td>
          <td>item()</td>
          <td>Content to place within the label</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(span)</div>
  <div class="section" id="bootstrap:list-group-custom3">
    <h4>bootstrap:list-group-custom</h4>Creates a composte list<h5>Signature</h5>bootstrap:list-group-custom($content as array(*), $title-key as xs:string, $content-key as xs:string) as element(ul)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>content</td>
          <td>1</td>
          <td>array(*)</td>
          <td>Content to place within the list group.</td>
        </tr>
        <tr>
          <td>title-key</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Path to the title for each content item</td>
        </tr>
        <tr>
          <td>content-key</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Path to the content for each content item</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(ul)</div>
  <div class="section" id="bootstrap:list-group1">
    <h4>bootstrap:list-group</h4>Generates a list group<h5>Signature</h5>bootstrap:list-group($content as array(*)) as element(ul)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>content</td>
          <td>1</td>
          <td>array(*)</td>
          <td>Content to place within the list group. Items will be automatically wrapped in ul elements</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(ul)</div>
  <div class="section" id="bootstrap:list-group2">
    <h4>bootstrap:list-group</h4>Generates a list group<h5>Signature</h5>bootstrap:list-group($content as array(*), $renderer as function(*)) as element(ul)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>content</td>
          <td>1</td>
          <td>array(*)</td>
          <td>Content to place within the list group. Items will be automatically wrapped in ul elements</td>
        </tr>
        <tr>
          <td>renderer</td>
          <td>1</td>
          <td>function(*)</td>
          <td>Function to render the content</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(ul)</div>
  <div class="section" id="bootstrap:modal5">
    <h4>bootstrap:modal</h4>Generates a modal dialog from the provided toggle element<h5>Signature</h5>bootstrap:modal($toggle as element(*), $title as xs:string, $body as node()*, $footer as node()*, $size as xs:string?) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>toggle</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Button or anchor element with an id attribute to toggle the modal dialog</td>
        </tr>
        <tr>
          <td>title</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Title of the modal window</td>
        </tr>
        <tr>
          <td>body</td>
          <td>*</td>
          <td>node()</td>
          <td>Content of the modal body</td>
        </tr>
        <tr>
          <td>footer</td>
          <td>*</td>
          <td>node()</td>
          <td>Content of the modal footer.</td>
        </tr>
        <tr>
          <td>size</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Size of the dialog: 'lg' or 'sm'</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:nav3">
    <h4>bootstrap:nav</h4>Generates a nav bar<h5>Signature</h5>bootstrap:nav($id as xs:string, $links as element(a), $style as xs:string?) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>id</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Id to provide the navigation bar</td>
        </tr>
        <tr>
          <td>links</td>
          <td>1</td>
          <td>element(a)</td>
          <td>Anchor elements to populate the nav bar</td>
        </tr>
        <tr>
          <td>style</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Style of nav bar to generate</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:panel3">
    <h4>bootstrap:panel</h4>Generates a default panel<h5>Signature</h5>bootstrap:panel($head as node()*, $body as node()*, $footer as node()*) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>head</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place within the head of the panel</td>
        </tr>
        <tr>
          <td>body</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place within the body of the panel</td>
        </tr>
        <tr>
          <td>footer</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place within the footer of the panel</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:panel4">
    <h4>bootstrap:panel</h4>Generates a panel<h5>Signature</h5>bootstrap:panel($head as node()*, $body as node()*, $footer as node()*, $style as xs:string) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>head</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place within the head of the panel</td>
        </tr>
        <tr>
          <td>body</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place within the body of the panel</td>
        </tr>
        <tr>
          <td>footer</td>
          <td>*</td>
          <td>node()</td>
          <td>Content to place within the footer of the panel</td>
        </tr>
        <tr>
          <td>style</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Style of panel to create.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:popover5">
    <h4>bootstrap:popover</h4>Adds popover functionality to the provided element<h5>Signature</h5>bootstrap:popover($element as element(*), $placement as xs:string, $title as xs:string?, $body as xs:string?, $style as xs:string?) as element(*)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>element</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Node to add the popover functionality too</td>
        </tr>
        <tr>
          <td>placement</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Location where popover should appear: left, right, top, bottom.</td>
        </tr>
        <tr>
          <td>title</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Title of the popover</td>
        </tr>
        <tr>
          <td>body</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Text body of the popover</td>
        </tr>
        <tr>
          <td>style</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Style of the popover</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(*)</div>
  <div class="section" id="bootstrap:progress-bar1">
    <h4>bootstrap:progress-bar</h4>Generates a progress bar<h5>Signature</h5>bootstrap:progress-bar($percent as xs:integer) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>percent</td>
          <td>1</td>
          <td>xs:integer</td>
          <td>Value of the progress bar.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:progress-bar3">
    <h4>bootstrap:progress-bar</h4>Generates a progress bar<h5>Signature</h5>bootstrap:progress-bar($percent as xs:integer, $style as xs:string?, $showValue as xs:boolean) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>percent</td>
          <td>1</td>
          <td>xs:integer</td>
          <td>Value of the progress bar.</td>
        </tr>
        <tr>
          <td>style</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Style of the progress bar.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:row3">
    <h4>bootstrap:row</h4>Generates a grid row with the provided content, widths and offsets<h5>Signature</h5>bootstrap:row($items as item()*, $widths as xs:integer*, $offsets as xs:integer*) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>items</td>
          <td>*</td>
          <td>item()</td>
          <td>Content to generate each row from</td>
        </tr>
        <tr>
          <td>widths</td>
          <td>*</td>
          <td>xs:integer</td>
          <td>List of widths for each content item provided.</td>
        </tr>
        <tr>
          <td>offsets</td>
          <td>*</td>
          <td>xs:integer</td>
          <td>List of offsets for each content item provided. If offset is not provided, its assumed to be not offset.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:scrollspy2">
    <h4>bootstrap:scrollspy</h4>Adds scrollspy capabilities to the provided element<h5>Signature</h5>bootstrap:scrollspy($element as element(*), $nav as element(div)) as item()*<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>element</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Node to spy on.</td>
        </tr>
        <tr>
          <td>nav</td>
          <td>1</td>
          <td>element(div)</td>
          <td>Navigation bar for the spied element</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>item()</div>
  <div class="section" id="bootstrap:scrollspy3">
    <h4>bootstrap:scrollspy</h4>Adds scrollspy capabilities to the provided element<h5>Signature</h5>bootstrap:scrollspy($id as xs:string, $element as element(*), $style as xs:string?) as item()*<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>id</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Id to give the scrollspy group</td>
        </tr>
        <tr>
          <td>element</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Node containing content to spy on.</td>
        </tr>
        <tr>
          <td>style</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Style of nav bar to generate for the spied content. A nav item is generated for each id content provided.</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>item()</div>
  <div class="section" id="bootstrap:tab-panel2">
    <h4>bootstrap:tab-panel</h4>Generates a tab panel<h5>Signature</h5>bootstrap:tab-panel($tabs as map(xs:string, item()), $style as xs:string?) as element(div)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>tabs</td>
          <td>1</td>
          <td>map(xs:string, item())</td>
          <td>Map of tags to be used in tab panel. Key is the title of the tag and the value is its content</td>
        </tr>
        <tr>
          <td>style</td>
          <td>?</td>
          <td>xs:string</td>
          <td>Style of tab panel to create. Defaults to standard styling</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(div)</div>
  <div class="section" id="bootstrap:table-body3">
    <h4>bootstrap:table-body</h4>Generate a tbody element<h5>Signature</h5>bootstrap:table-body($array as array(map(xs:string, item()*)), $keys as xs:string*, $numbered as xs:boolean) as element(tbody)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>array</td>
          <td>1</td>
          <td>array(map(xs:string, item()*))</td>
          <td>Array of map items to geneate rows for</td>
        </tr>
        <tr>
          <td>keys</td>
          <td>*</td>
          <td>xs:string</td>
          <td>List of property keys to generate columns for</td>
        </tr>
        <tr>
          <td>numbered</td>
          <td>1</td>
          <td>xs:boolean</td>
          <td>Denotes whether a numbered header row should be generated</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(tbody)</div>
  <div class="section" id="bootstrap:table-head2">
    <h4>bootstrap:table-head</h4>Generates a thead node with the provied $headers<h5>Signature</h5>bootstrap:table-head($headers as xs:string*, $numbered as xs:boolean) as element(thead)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>headers</td>
          <td>*</td>
          <td>xs:string</td>
          <td>list of string values to use as headers</td>
        </tr>
        <tr>
          <td>numbered</td>
          <td>1</td>
          <td>xs:boolean</td>
          <td>includes a title row as first header with value '#'</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(thead)</div>
  <div class="section" id="bootstrap:table1">
    <h4>bootstrap:table</h4>Create a table with rows for each map in the array and a column for the distinct key names<h5>Signature</h5>bootstrap:table($array as array(map(xs:string, item()*))) as element(table)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>array</td>
          <td>1</td>
          <td>array(map(xs:string, item()*))</td>
          <td>Array of maps to generate the table from</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(table)</div>
  <div class="section" id="bootstrap:table3">
    <h4>bootstrap:table</h4>Creates a table with rows for each map in the array and a column for the distinct key names<h5>Signature</h5>bootstrap:table($array as array(map(xs:string, item()*)), $class as xs:string*, $numbered as xs:boolean) as element(table)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>array</td>
          <td>1</td>
          <td>array(map(xs:string, item()*))</td>
          <td>Array of maps to generate table from</td>
        </tr>
        <tr>
          <td>class</td>
          <td>*</td>
          <td>xs:string</td>
          <td>Style class to apply to the table</td>
        </tr>
        <tr>
          <td>numbered</td>
          <td>1</td>
          <td>xs:boolean</td>
          <td>Denotes whether a row header containing the row index should be generated</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(table)</div>
  <div class="section" id="bootstrap:tooltip3">
    <h4>bootstrap:tooltip</h4>Adds popover functionality to the provided element<h5>Signature</h5>bootstrap:tooltip($element as element(*), $placement as xs:string, $title as xs:string) as element(*)<h5>Parameters</h5>
    <table class="table">
      <thead>
        <th>Name</th>
        <th>Occurrence</th>
        <th>Type</th>
        <th>Description</th>
      </thead>
      <tbody>
        <tr>
          <td>element</td>
          <td>1</td>
          <td>element(*)</td>
          <td>Node to add the popover functionality too</td>
        </tr>
        <tr>
          <td>placement</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Location where popover should appear: left, right, top, bottom.</td>
        </tr>
        <tr>
          <td>title</td>
          <td>1</td>
          <td>xs:string</td>
          <td>Title of the popover</td>
        </tr>
      </tbody>
    </table>
    <h5>Returns</h5>element(*)</div>
</div>
