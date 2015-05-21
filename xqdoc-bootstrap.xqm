(:~ 
 : Generates Bootstrap 3 compliant html documentation
 : @author James Wright
 : @version 1.0
 : @updated 5/20/2015
 :)
module namespace xqdoc-boot = 'http://jw.xqdoc-bootstrap';
import module namespace boot = 'http://jw.xq-bootstrap' at 'https://raw.githubusercontent.com/james-jw/xquery-bootstrap/master/xq-bootstrap.xqm';
declare namespace xqdoc = 'http://www.xqdoc.org/1.0';

(:~
 : Provided a function group generates html markup for the group
 : @param Group of xqdoc:function elements
 : @return A div containing the documentation for the function group
 :)
declare function xqdoc-boot:function-group-to-html($function as element(xqdoc:function)*) as element(div) {
  <div class="section" id="{$function/xqdoc:name[1]}">
    <h3>{($function/xqdoc:name)[1]/text()}</h3>
    
    {if(count($function/xqdoc:signature) > 1) 
     then (<h4>Signatures</h4>, $function/xqdoc:signature ! 
           <div>{replace(., '^declare ', '')}</div>) 
     else ()}
    {$function ! xqdoc-boot:function-to-html(.)}
  </div>
};

(:~
 : Provided an xqdoc:function element. Creates html documentation
 : @param Xqdoc:function element containing function metadata
 : @return Html div element containing Bootstrap CSS3 markup
 :)
declare function xqdoc-boot:function-to-html($function as element(xqdoc:function)) as element(div) {
  <div class="section" id="{$function/xqdoc:name || $function/@arity}">
    <h5>Signature</h5>
    <p>{replace($function/xqdoc:signature,'^declare ', '')}</p>
    <p>{$function/xqdoc:comment/xqdoc:description/text()}</p>
    <h5>Parameters</h5>
    {boot:table(array {
      for $param at $i in $function/xqdoc:comment/xqdoc:param
      let $details := $function/xqdoc:parameters/xqdoc:parameter[$i]
      return
        map {
          'Name' : data($details/xqdoc:name),
          'Type' : data($details/xqdoc:type),
          'Occurrence' : data(($details/xqdoc:type/@occurrence, '1')[1]),
          'Description' : data($param)
        }
    })}
    <h5>Returns</h5>
    {boot:table(array { map {
        'Type': data($function/xqdoc:return/xqdoc:type),
        'Description': data($function/xqdoc:comment/xqdoc:return)      
    }})}
  </div>
};

(:~
 : Provided an xqdoc element. Geneates Bootstrap CSS 3 compliant Html documentation
 : @param Document to convert
 : @return Html div element containing Bootstrap CSS 3 markup
 :)
declare function xqdoc-boot:xqdoc-to-html($doc as element(xqdoc:xqdoc)) as element(div) {
  let $module := $doc/xqdoc:module return
  <div class="section">
     <h1>{$module/xqdoc:name/text()}</h1>
     <p>{$module//xqdoc:description/text()}</p>
     
     <p>Namespace: {$doc/xqdoc:namespaces/xqdoc:namespace/@uri ! <span class="badge">{data(.)}</span>}</p>
     
     <p>Author: {$module//xqdoc:author/text()}</p>
     <p>Version: {$module//xqdoc:version/text()}</p>
     <p>Last Updated: {$module//xqdoc:custom[@tag='updated']/text()}</p>
     
     <h2>Functions</h2>
     {for $function in $doc/xqdoc:functions/xqdoc:function 
      let $name := $function/xqdoc:name
      order by $name || $function/@arity ascending
      group by $name 
      return xqdoc-boot:function-group-to-html($function)}
  </div>
};
