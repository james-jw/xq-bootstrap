module namespace bootstrap = 'http://jw.bootstrap';

declare function bootstrap:head($contents as node()?) as node() {
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    {$contents}
  </head>
};

declare function bootstrap:head() as node() {
  bootstrap:head(())
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


