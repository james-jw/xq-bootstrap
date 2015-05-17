module namespace bootstrap = 'http://jw.bootstrap';

declare function bootstrap:head($title as xs:string, $contents as node()*) as node() {
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>{$title}</title>
    {$contents}
  </head>
};

declare function bootstrap:head() as node() {
  bootstrap:head('', ())
};

declare function bootstrap:html($contents as node()*, $head as node(), $nav as node()?) as node() {
  <html lang="en" xmlns="http://www.w3.org/1999/xhtml">
     {$head}
     <body>
       {$nav}
       <div class="container">{$contents}</div>
     </body>
  </html>
};

declare function bootstrap:table($array as item(), $class as xs:string*, $numbered as xs:boolean) as node() {
  let $keys := distinct-values($array?* ! map:keys(.))
  return
    <table class="{('table', $class)}">
      {bootstrap:table-head($keys, $numbered)}
      {bootstrap:table-body($array, $keys, $numbered)}
    </table> 
};

declare function bootstrap:table($array as item()) as node() {
  bootstrap:table($array, (), false())
};

declare function bootstrap:table-head($headers as xs:string*, $numbered as xs:boolean) as node() {
  <thead>
   { if($numbered) then <th>#</th> else ()}
   { for $header in $headers return <th>{$header}</th> }
  </thead>
};

declare function bootstrap:table-body($array as item()*, $keys as xs:string*, $numbered as xs:boolean) as node() {
  <tbody>
    {
      for $item at $i in $array return
        <tr>
          { if($numbered) then <th>{$i}</th> else ()}
          { for $key in $keys return <td>{$item($key)}</td> }        
        </tr>       
    }
  </tbody>
};

(: assumes array has title and href keys :)
declare function bootstrap:breadcrumbs($array as item()) as node() {
  bootstrap:breadcrumbs($array, function ($item, $i) { 
    if($i = count($array))
     then <li class="active">{$item?title}</li>
     else <li>
            <a href="{$item?href}">{$item?title}</a>
          </li>
   })
};

declare function bootstrap:breadcrumbs($array as item(), $renderer ) as node() {
  <ol class="breadcrumb">{$array?* ! $renderer(.)}</ol> 
};

(: Creates a label of the specified type.
   Types: default, primary, success, info, warning, danger :)
declare function bootstrap:label($type as xs:string, $contents as item()) as node() {
  <span class="label label-{$type}">{$contents}</span>
};

(: Creates a 'default' label with the supplied contents. :)
declare function bootstrap:label($contents as item()) as node() {
  bootstrap:label('default', $contents)
};

declare function bootstrap:badge($contents as item()) as node() {
  <span class="badge">{$contents}</span>
};

declare function bootstrap:panel($head as node()?, $body as node()?, 
                                 $footer as node()?, $type as xs:string) as node() {
  <div class="panel panel-{$type}">
    {if($head) then <div class="panel-heading">{$head}</div> else ()}
    {if($body) then <div class="panel-body">{$body}</div> else ()}
    {if($footer) then <div class="panel-footer">{$footer}</div> else ()}
  </div>
};

declare function bootstrap:panel($head as node()?, $body as node()?, $footer as node()?) as node() {
  bootstrap:panel($head, $body, $footer, 'default')                                   
};

declare function bootstrap:list-group($items as item(), $renderer as item()) as node() {
  <ul class="list-group">{$items?* ! $renderer(.)}</ul>
}; 

declare function bootstrap:list-group($items as item()) as node() {
  bootstrap:list-group($items, function ($item) {
    <li class="list-group-item">{$item}</li>
  })
};

(: Creates a custom list from the array pulling the heading and text from the supplied keys respectively :)
declare function bootstrap:list-group-custom($items as item(), $keys as item()*) as node() {
  bootstrap:list-group($items, function ($item) {
    <li class="list-group-item">
      <h4 class="list-group-item-heading">{$item($keys[1])}</h4>
      <p> class="list-group-item-text">{$item($keys[2])}</p>
    </li>
  })
};

declare function bootstrap:row($items as item()*, $widths as xs:integer*, $offsets as xs:integer*) as node() {
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

declare function bootstrap:grid($items as item(), $columns as xs:integer) as node()* {
  for tumbling window $group in $items?*
  start at $i when true()
  end at $e when $e - $i = $columns - 1
  return 
     bootstrap:row($group, $group ! (12 div $columns), ())
};

declare function bootstrap:popover($element as element(), $placement as xs:string, $title as xs:string?,
                                   $body as xs:string?, $type as xs:string?) as element() {
  copy $out := $element 
  modify insert nodes (
    attribute type { 'button' },
    attribute data-toggle { if($type) then $type else 'popover' },
    if($title) then attribute title { $title } else (),
    attribute data-placement { $placement },
    if($body) then attribute data-content { $body } else ()
  ) into $out
  return $out
};

declare function bootstrap:tooltip($element as element(), $placement as xs:string, $title as xs:string) {
  bootstrap:popover($element, $placement, $title, (), 'tooltip')
};

declare function bootstrap:tab-panel($tabs as item(), $style as xs:string?) as element(div) {
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

declare function bootstrap:modal($toggle as element(), $title as xs:string, 
                                 $body as node()*, $footer as node()*, $size as xs:string?) {
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

declare function bootstrap:attributes($element as node(), $items as item()) as node()* {
  for $key in map:keys($items) return attribute {$key} {$items($key)}
};

declare function bootstrap:divider() as element(li) { <li class="divider" role="presentation"></li> };
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

declare function bootstrap:dropdown($button as element(), $items as element()*) as element(div) {
  let $container := <div /> return
  bootstrap:dropdown(<div />, $button, $items)
};

declare function bootstrap:scrollspy($element as element(*), $nav as element(div)) {
  copy $out := $element modify insert nodes (
    attribute style {$element/@style || ' position:relative;'},
    attribute data-spy {'scroll'},
    attribute data-target {'#' || $nav/@id}
  ) into $out 
  return $out
};

declare function bootstrap:scrollspy($id as xs:string, $element as element(*), $style as xs:string?) {
  let $nav := (
    let $links := for $section in $element/*[@id] return <a href="#{$section/@id}">{$section/text()}</a>
    return bootstrap:nav($id, $links, $style))
  return bootstrap:scrollspy($element, $nav)
};

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

declare function bootstrap:progress-bar($percent as xs:integer) as element(div) {
  bootstrap:progress-bar($percent, ())
};

declare function bootstrap:collapse($control as node(), $contents as node()*) as element(div) {
  let $id := replace($control/(@href|@data-target), '#', '') return
  <div class="collapse" id="{$id}">
    {$contents}
  </div>
};
