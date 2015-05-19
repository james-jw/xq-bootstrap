(:~ 
 : Provides helper functions for generating bootstrap component markup
 : @author James Wright
 : @version 1.0
 : @updated 5/19/2015
 :)
module namespace bootstrap = 'http://jw.bootstrap';

(:~ 
 : Generates a jumbotron
 : @param Title to display
 : @param Content to place below title
 : @param Style class of the content's container
 :)
declare function bootstrap:jumbotron($title as xs:string, $content as xs:string?, $style as xs:string?) as element(div) {
  <div class="jumbotron">
    <h1>{$title}</h1>
    {if($content) then <div class="alert {($style, 'bg-primary')[1]}">{$content}</div> else ()}
  </div>
};

(:~  
 : Creates a head object with standard meta tags 
 : @param Title of the page
 : @param Additional elements to add to the head 
 :)
declare function bootstrap:head($title as xs:string, $contents as node()*) as element(head) {
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>{$title}</title>
    {$contents}
  </head>
};

(:~  Bootstrap a titleless basic head :)
declare function bootstrap:head() as node() {
  bootstrap:head('', ())
};

(:~  Creates the final html output node with the provided page contents, head and navbar. 
 : @param Page contents to place within the main page container div
 : @param The head element to use for the page
 : @param A nav element for use on the page
 :)
declare function bootstrap:html($contents as item()*, $head as node(), $nav as node()?) as element(html) {
  <html>
     {$head}
     <body>
       {$nav}
       <div class="container">{$contents}</div>
     </body>
  </html>
};

(:~  Creates a table with rows for each map in the array and a column for the distinct key names 
 : @param Array of maps to generate table from
 : @param Style class to apply to the table
 : @param Denotes whether a row header containing the row index should be generated
:)
declare function bootstrap:table($array as array(map(xs:string, item()*)), $class as xs:string*, $numbered as xs:boolean) as element(table) {
  let $keys := distinct-values($array?* ! map:keys(.))
  return
    <table class="{('table', $class)}">
      {bootstrap:table-head($keys, $numbered)}
      {bootstrap:table-body($array, $keys, $numbered)}
    </table> 
};

(:~  Create a table with rows for each map in the array and a column for the distinct key names
 : @param Array of maps to generate the table from
 :)
declare function bootstrap:table($array as array(map(xs:string, item()*))) as element(table) {
  bootstrap:table($array, (), false())
};

(:~  Generates a thead node with the provied $headers 
 : @param list of string values to use as headers
 : @param includes a title row as first header with value '#'
:)
declare function bootstrap:table-head($headers as xs:string*, $numbered as xs:boolean) as element(thead) {
  <thead>
   { if($numbered) then <th>#</th> else ()}
   { for $header in $headers return <th>{$header}</th> }
  </thead>
};

(:~  Generate a tbody element 
 : @param Array of map items to geneate rows for
 : @param List of property keys to generate columns for
 : @param Denotes whether a numbered header row should be generated
 :)
declare function bootstrap:table-body($array as array(map(xs:string, item()*)), $keys as xs:string*, $numbered as xs:boolean) as element(tbody) {
  <tbody>
    {
      for $item at $i in $array?* return
        <tr>
          { if($numbered) then <th>{$i}</th> else ()}
          { for $key in $keys return <td>{$item($key)}</td> }        
        </tr>       
    }
  </tbody>
};

(:~  Generates a breadcrumb element from the provided elements
 : @param Items to generate the breadcrumb from. Each item should have a title and href property.
 :)
declare function bootstrap:breadcrumbs($array as array(map(xs:string, item()*))) as element(ol) {
  bootstrap:breadcrumbs($array, function ($item, $i) { 
    if($i = count($array))
     then <li class="active">{$item?title}</li>
     else <li>
            <a href="{$item?href}">{$item?title}</a>
          </li>
   })
};

(:~  Generates a breadcrumb element from the provided elements 
 : @param Item to generate the breadcrumb from.
 : @param Function to generate a single breadcrumb item provided a map
 :)
declare function bootstrap:breadcrumbs($array as array(*), $renderer as function(*)) as element(ol) {
  <ol class="breadcrumb">{$array?* ! $renderer(.)}</ol> 
};

(:~  Creates a label of the specified type.
 : @param Type of label to create: default, primary, success, info, warning, danger 
 : @param Content to place within the label
 :)
declare function bootstrap:label($type as xs:string, $contents as item()*) as element(span) {
  <span class="label label-{$type}">{$contents}</span>
};

(:~  Creates a 'default' label with the supplied contents. 
 : @param Content to place within the label
 :)
declare function bootstrap:label($contents as item()*) as element(span) {
  bootstrap:label('default', $contents)
};

(:~  Creates a badge element
 : @param Content to place within the badge
 :)
declare function bootstrap:badge($contents as item()*) as element(span) {
  <span class="badge">{$contents}</span>
};

(:~  Generates a panel 
 : @param Content to place within the head of the panel
 : @param Content to place within the body of the panel
 : @param Content to place within the footer of the panel
 : @param Style of panel to create.
 :)
declare function bootstrap:panel($head as node()*, $body as node()*, 
                                 $footer as node()*, $style as xs:string) as element(div) {
  <div class="panel panel-{$style}">
    {if($head) then <div class="panel-heading">{$head}</div> else ()}
    {if($body) then <div class="panel-body">{$body}</div> else ()}
    {if($footer) then <div class="panel-footer">{$footer}</div> else ()}
  </div>
};

(:~  Generates a default panel
 : @param Content to place within the head of the panel
 : @param Content to place within the body of the panel
 : @param Content to place within the footer of the panel
 :)
declare function bootstrap:panel($head as node()*, $body as node()*, $footer as node()*) as element(div) {
  bootstrap:panel($head, $body, $footer, 'default')                                   
};

(:~  Generates a list group 
 : @param Content to place within the list group. Items will be automatically wrapped in ul elements
 : @param Function to render the content
 :)
declare function bootstrap:list-group($content as array(*), $renderer as function(*)) as element(ul) {
  <ul class="list-group">{$content?* ! $renderer(.)}</ul>
}; 

(:~  Generates a list group 
 : @param Content to place within the list group. Items will be automatically wrapped in ul elements
 :)
declare function bootstrap:list-group($content as array(*)) as element(ul) {
  bootstrap:list-group($content, function ($item) {
    <li class="list-group-item">{$item}</li>
  })
};

(:~  Creates a composte list  
 : @param Content to place within the list group.
 : @param-key Path to the title for each content item
 : @param-key Path to the content for each content item
 :)
declare function bootstrap:list-group-custom($content as array(*), $title-key as xs:string, $content-key as xs:string) as element(ul) {
  bootstrap:list-group($content, function ($item) {
    <li class="list-group-item">
      <h4 class="list-group-item-heading">{$item($title-key)}</h4>
      <p> class="list-group-item-text">{$item($content-key)}</p>
    </li>
  })
};

(:~  Generates a grid row with the provided content, widths and offsets
 : @param Content to generate each row from
 : @param List of widths for each content item provided.
 : @param List of offsets for each content item provided. If offset is not provided, its assumed to be not offset.
 :)
declare function bootstrap:row($items as item()*, $widths as xs:integer*, $offsets as xs:integer*) as element(div) {
  <div class="row">
    {
      for $item at $i in $items 
      let $offset := ($offsets[$i], 0)[1]
      let $width := ($widths[$i], count($items)/12)[1] 
      return
        <div class="col-md-{$width} {if($offset > 0) then 'col-md-offset-' || $offset else ()}">
          {$item}
        </div>
    }
  </div>
};

(:~  Generate a grid 
 : @param Content to generate the grid from.
 : @param Number of items per row
 :)
declare function bootstrap:grid($items as array(*), $columns as xs:integer) as element(div)* {
  for tumbling window $group in $items?*
  start at $i when true()
  end at $e when $e - $i = $columns - 1
  return 
     bootstrap:row($group, $group ! (12 div $columns), ())
};

(:~  Adds popover functionality to the provided element 
 : @param Node to add the popover functionality too
 : @param Location where popover should appear: left, right, top, bottom.
 : @param Title of the popover
 : @param Text body of the popover
 : @param Style of the popover
 :)
declare function bootstrap:popover($element as element(*), $placement as xs:string, $title as xs:string?,
                                   $body as xs:string?, $style as xs:string?) as element(*) {
  copy $out := $element 
  modify insert nodes (
    attribute data-toggle { if($style) then $style else 'popover' },
    if($title) then attribute title { $title } else (),
    attribute data-placement { $placement },
    if($body) then attribute data-content { $body } else ()
  ) into $out
  return $out
};

(:~  Adds popover functionality to the provided element
 : @param Node to add the popover functionality too
 : @param Location where popover should appear: left, right, top, bottom.
 : @param Title of the popover
 :)
declare function bootstrap:tooltip($element as element(*), $placement as xs:string, $title as xs:string) as element(*) {
  bootstrap:popover($element, $placement, $title, (), 'tooltip')
};

(:~  Generates a tab panel 
 : @param Map of tags to be used in tab panel. Key is the title of the tag and the value is its content
 : @param Style of tab panel to create. Defaults to standard styling
 :)
declare function bootstrap:tab-panel($tabs as map(xs:string,item()), $style as xs:string?) as element(div) {
  let $tabs-out := 
    for $key at $i in map:keys($tabs) 
    let $id := lower-case($key) 
    return
      (<li role="presentation">
        {if($i = 1) then attribute class {'active'} else ()}
        <a href="#{$id}" aria-controls="{$id}" role="tab" data-toggle="{($style, 'tab')[1]}">{$key}</a>
      </li>,
      <div role="tabpanel" id="{$id}" class="tab-pane{if($i = 1) then ' active' else ()}">
         {$tabs($key)}
      </div>)
  return
    <div role="tabpanel">
      <ul class="nav {($style, 'nav-tabs')[1]}" role="tablist">{$tabs-out/li}</ul>
      <div class="tab-content">{$tabs-out/div}</div>
    </div>
};

(:~  Generates a modal dialog from the provided toggle element 
 : @param Button or anchor element with an id attribute to toggle the modal dialog
 : @param Title of the modal window
 : @param Content of the modal body
 : @param Content of the modal footer.
 : @param Size of the dialog: 'lg' or 'sm'
 :)
declare function bootstrap:modal($toggle as element(*), $title as xs:string, 
                                 $body as node()*, $footer as node()*, $size as xs:string?) as element(div) {
  let $id := replace($toggle/@data-target, '#', '') return
  <div class="modal fade" id="{$id}" tabindex="-1" 
       role="dialog" aria-labelledby="{$id}Label" aria-hidden="true">
    <div class="modal-dialog {if($size) then 'modal-' || $size else ()}">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&amp;times;</span></button>
          <h4 class="modal-title" id="{$id}Label">{$title}</h4>
        </div>
        <div class="modal-body">{$body}</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          {$footer}
        </div>
      </div>
    </div>
  </div>
};

(:~  Generates a set of attribute elements 
 : @param Map to use for generating the attributes. 
 :)
declare function bootstrap:attributes($items as map(*)) as attribute()* {
  for $key in map:keys($items) return attribute {$key} {$items($key)}
};

(:~  Generates a dropdown divider element :)
declare function bootstrap:divider() as element(li) { <li class="divider" role="presentation"></li> };

(:~  Adds dropdown capabilities to a provided button or anchor 
 : @param Element which will contain the dropdown button or anchor.
 : @param Button or anchor to add the drop down too
 : @param Elements to place in the dropdown
 :)
declare function bootstrap:dropdown($container as element(*), $button as element(), $items as element(li)*) as element(*) {
  let $id := replace($button/@id, '#', '') return
  copy $out := $container modify insert nodes (
    attribute class {'dropdown' },  
    copy $btn := $button 
    modify  (insert nodes (bootstrap:attributes(map { 'type':'button', 'data-toggle': 'dropdown', 
              'aria-haspopup': 'true', 'aria-extended': 'true'})) as first into $btn,
               insert node <span class="caret"></span> as last into $btn )
    return $btn, 
    <ul class="dropdown-menu" role="menu" aria-labelledby="{$id}">
      {for $item in $items return
       copy $out := $item
       modify insert node attribute role {"presentation"} into $out 
       return $out}
    </ul>
  ) into $out
  return $out
};

(:~  Adds dropdown capabilities to a provided button or anchor 
 : @param Button or anchor to add the drop down too
 : @param Elements to place in the dropdown
 :)
declare function bootstrap:dropdown($button as element(*), $items as element()*) as element(div) {
  let $container := <div /> return
  bootstrap:dropdown(<div />, $button, $items)
};

(:~  Adds scrollspy capabilities to the provided element 
 : @param Node to spy on. 
 : @param Navigation bar for the spied element
 :)
declare function bootstrap:scrollspy($element as element(*), $nav as element(div)) {
  copy $out := $element modify insert nodes (
    attribute style {$element/@style || ' position:relative;'},
    attribute data-spy {'scroll'},
    attribute data-target {'#' || $nav/@id}
  ) into $out 
  return $out
};

(:~  Adds scrollspy capabilities to the provided element 
 : @param Id to give the scrollspy group
 : @param Node containing content to spy on. 
 : @param Style of nav bar to generate for the spied content. A nav item is generated for each id content provided.
 :)
declare function bootstrap:scrollspy($id as xs:string, $element as element(*), $style as xs:string?) {
  let $nav := (
    let $links := for $section in $element/*[@id] return <a href="#{$section/@id}">{$section/text()}</a>
    return bootstrap:nav($id, $links, $style))
  return bootstrap:scrollspy($element, $nav)
};

(:~  Generates a nav bar 
 : @param Id to provide the navigation bar
 : @param Anchor elements to populate the nav bar
 : @param Style of nav bar to generate
 :)
declare function bootstrap:nav($id as xs:string, $links as element(a), $style as xs:string?) as element(div) {
  <div id="{$id}">
    <ul class="nav {($style, 'nav-tabs')[1]}">
      {for $link at $i in $links return
       <li role="presentation">
        {if($i = 1) then attribute class {'active'} else ()}
        {$link}
       </li>
      }
    </ul>
  </div>
};

(:~  Generates a progress bar 
 : @param Value of the progress bar.
 : @param Style of the progress bar.
 :)
declare function bootstrap:progress-bar($percent as xs:integer, $style as xs:string?, $showValue as xs:boolean) as element(div) {
  <div class="progress">
    <div class="progress-bar {$style}" role="progressbar" aria-valuenow="{$percent}" aria-valuemin="0" 
         aria-valuemax="100" style="width:{$percent}%;min-width:2%">
      <span>
        {if($showValue) then attribute class {'sr-only'} else ()}
        {$percent}%
      </span>
    </div>
  </div>
};
 
(:~  Generates a progress bar 
 : @param Value of the progress bar.
 :)
declare function bootstrap:progress-bar($percent as xs:integer) as element(div) {
  bootstrap:progress-bar($percent, (), true())
};

(:~  Adds collapsability to the provided contents 
 : @param Button or anchor to toggle the contents collapsile. 
 : @param Content to place withing the collapsable div
 :)
declare function bootstrap:collapse($control as node(), $contents as node()*) as element(div) {
  let $id := replace($control/(@href|@data-target), '#', '') return
  <div class="collapse" id="{$id}">
    {$contents}
  </div>
};
