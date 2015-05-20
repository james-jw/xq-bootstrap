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
    <h3>bootstrap:attributes</h3>
    <p>Generates a set of attribute elements</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:attributes($items as map(*)) as attribute()*</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>attribute()</p>
  </div>
  <div class="section" id="bootstrap:badge1">
    <h3>bootstrap:badge</h3>
    <p>Creates a badge element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:badge($contents as item()*) as element(span)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(span)</p>
  </div>
  <div class="section" id="bootstrap:breadcrumbs1">
    <h3>bootstrap:breadcrumbs</h3>
    <p>Generates a breadcrumb element from the provided elements</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:breadcrumbs($array as array(map(xs:string, item()*))) as element(ol)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(ol)</p>
  </div>
  <div class="section" id="bootstrap:breadcrumbs2">
    <h3>bootstrap:breadcrumbs</h3>
    <p>Generates a breadcrumb element from the provided elements</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:breadcrumbs($array as array(*), $renderer as function(*)) as element(ol)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(ol)</p>
  </div>
  <div class="section" id="bootstrap:collapse2">
    <h3>bootstrap:collapse</h3>
    <p>Adds collapsability to the provided contents</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:collapse($control as node(), $contents as node()*) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:divider0">
    <h3>bootstrap:divider</h3>
    <p>Generates a dropdown divider element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:divider() as element(li)</p>
    <h4>Parameters</h4>
    <table class="table">
      <thead/>
      <tbody/>
    </table>
    <h4>Returns</h4>
    <p>element(li)</p>
  </div>
  <div class="section" id="bootstrap:dropdown2">
    <h3>bootstrap:dropdown</h3>
    <p>Adds dropdown capabilities to a provided button or anchor</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:dropdown($button as element(*), $items as element()*) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:dropdown3">
    <h3>bootstrap:dropdown</h3>
    <p>Adds dropdown capabilities to a provided button or anchor</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:dropdown($container as element(*), $button as element(), $items as element(li)*) as element(*)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(*)</p>
  </div>
  <div class="section" id="bootstrap:grid2">
    <h3>bootstrap:grid</h3>
    <p>Generate a grid</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:grid($items as array(*), $columns as xs:integer) as element(div)*</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:head0">
    <h3>bootstrap:head</h3>
    <p>Bootstrap a titleless basic head</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:head() as node()</p>
    <h4>Parameters</h4>
    <table class="table">
      <thead/>
      <tbody/>
    </table>
    <h4>Returns</h4>
    <p>node()</p>
  </div>
  <div class="section" id="bootstrap:head2">
    <h3>bootstrap:head</h3>
    <p>Creates a head object with standard meta tags</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:head($title as xs:string, $contents as node()*) as element(head)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(head)</p>
  </div>
  <div class="section" id="bootstrap:html3">
    <h3>bootstrap:html</h3>
    <p>Creates the final html output node with the provided page contents, head and navbar.</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:html($contents as item()*, $head as node(), $nav as node()?) as element(html)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(html)</p>
  </div>
  <div class="section" id="bootstrap:jumbotron3">
    <h3>bootstrap:jumbotron</h3>
    <p>Generates a jumbotron</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:jumbotron($title as xs:string, $content as xs:string?, $style as xs:string?) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:label1">
    <h3>bootstrap:label</h3>
    <p>Creates a 'default' label with the supplied contents.</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:label($contents as item()*) as element(span)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(span)</p>
  </div>
  <div class="section" id="bootstrap:label2">
    <h3>bootstrap:label</h3>
    <p>Creates a label of the specified type.</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:label($type as xs:string, $contents as item()*) as element(span)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(span)</p>
  </div>
  <div class="section" id="bootstrap:list-group-custom3">
    <h3>bootstrap:list-group-custom</h3>
    <p>Creates a composte list</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:list-group-custom($content as array(*), $title-key as xs:string, $content-key as xs:string) as element(ul)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(ul)</p>
  </div>
  <div class="section" id="bootstrap:list-group1">
    <h3>bootstrap:list-group</h3>
    <p>Generates a list group</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:list-group($content as array(*)) as element(ul)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(ul)</p>
  </div>
  <div class="section" id="bootstrap:list-group2">
    <h3>bootstrap:list-group</h3>
    <p>Generates a list group</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:list-group($content as array(*), $renderer as function(*)) as element(ul)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(ul)</p>
  </div>
  <div class="section" id="bootstrap:modal5">
    <h3>bootstrap:modal</h3>
    <p>Generates a modal dialog from the provided toggle element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:modal($toggle as element(*), $title as xs:string, $body as node()*, $footer as node()*, $size as xs:string?) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:nav3">
    <h3>bootstrap:nav</h3>
    <p>Generates a nav bar</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:nav($id as xs:string, $links as element(a), $style as xs:string?) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:panel3">
    <h3>bootstrap:panel</h3>
    <p>Generates a default panel</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:panel($head as node()*, $body as node()*, $footer as node()*) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:panel4">
    <h3>bootstrap:panel</h3>
    <p>Generates a panel</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:panel($head as node()*, $body as node()*, $footer as node()*, $style as xs:string) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:popover5">
    <h3>bootstrap:popover</h3>
    <p>Adds popover functionality to the provided element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:popover($element as element(*), $placement as xs:string, $title as xs:string?, $body as xs:string?, $style as xs:string?) as element(*)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(*)</p>
  </div>
  <div class="section" id="bootstrap:progress-bar1">
    <h3>bootstrap:progress-bar</h3>
    <p>Generates a progress bar</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:progress-bar($percent as xs:integer) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:progress-bar3">
    <h3>bootstrap:progress-bar</h3>
    <p>Generates a progress bar</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:progress-bar($percent as xs:integer, $style as xs:string?, $showValue as xs:boolean) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:row3">
    <h3>bootstrap:row</h3>
    <p>Generates a grid row with the provided content, widths and offsets</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:row($items as item()*, $widths as xs:integer*, $offsets as xs:integer*) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:scrollspy2">
    <h3>bootstrap:scrollspy</h3>
    <p>Adds scrollspy capabilities to the provided element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:scrollspy($element as element(*), $nav as element(div)) as item()*</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>item()</p>
  </div>
  <div class="section" id="bootstrap:scrollspy3">
    <h3>bootstrap:scrollspy</h3>
    <p>Adds scrollspy capabilities to the provided element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:scrollspy($id as xs:string, $element as element(*), $style as xs:string?) as item()*</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>item()</p>
  </div>
  <div class="section" id="bootstrap:tab-panel2">
    <h3>bootstrap:tab-panel</h3>
    <p>Generates a tab panel</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:tab-panel($tabs as map(xs:string, item()), $style as xs:string?) as element(div)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(div)</p>
  </div>
  <div class="section" id="bootstrap:table-body3">
    <h3>bootstrap:table-body</h3>
    <p>Generate a tbody element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:table-body($array as array(map(xs:string, item()*)), $keys as xs:string*, $numbered as xs:boolean) as element(tbody)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(tbody)</p>
  </div>
  <div class="section" id="bootstrap:table-head2">
    <h3>bootstrap:table-head</h3>
    <p>Generates a thead node with the provied $headers</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:table-head($headers as xs:string*, $numbered as xs:boolean) as element(thead)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(thead)</p>
  </div>
  <div class="section" id="bootstrap:table1">
    <h3>bootstrap:table</h3>
    <p>Create a table with rows for each map in the array and a column for the distinct key names</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:table($array as array(map(xs:string, item()*))) as element(table)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(table)</p>
  </div>
  <div class="section" id="bootstrap:table3">
    <h3>bootstrap:table</h3>
    <p>Creates a table with rows for each map in the array and a column for the distinct key names</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:table($array as array(map(xs:string, item()*)), $class as xs:string*, $numbered as xs:boolean) as element(table)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(table)</p>
  </div>
  <div class="section" id="bootstrap:tooltip3">
    <h3>bootstrap:tooltip</h3>
    <p>Adds popover functionality to the provided element</p>
    <h4>Signature</h4>
    <p>declare function bootstrap:tooltip($element as element(*), $placement as xs:string, $title as xs:string) as element(*)</p>
    <h4>Parameters</h4>
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
    <h4>Returns</h4>
    <p>element(*)</p>
  </div>
</div>
