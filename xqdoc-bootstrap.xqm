(:~ 
 : Generates Bootstrap 3 compliant html documentation
 : @author James Wright
 : @version 1.0
 : @updated 5/20/2015
 :)
module namespace xqdoc-bootstrap = 'http://jw.xqdoc-bootstrap';
import module namespace boot = 'http://jw.xq-bootstrap' at 'https://raw.githubusercontent.com/james-jw/xquery-bootstrap/master/xq-bootstrap.xqm';
declare namespace xqdoc = 'http://www.xqdoc.org/1.0';

(:~
 : Provided an xqdoc:function element. Creates html documentation
 : @param Xqdoc:function element containing function metadata
 : @return Html div element containing Bootstrap CSS3 markup
 :)
declare function xqdoc-bootstrap:xqdoc-function-to-html($function as element(xqdoc:function)) as element(div) {
  <div class="section" id="{$function/xqdoc:name || $function/@arity}">
    <h4>{$function/xqdoc:name/text()}</h4>
    {$function/xqdoc:comment/xqdoc:description/text()}
    <h5>Signature</h5>
    {replace($function/xqdoc:signature/text(), 'declare.*function\s', '')}
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
        'Type': $function/xqdoc:return/xqdoc:type,
        'Description': $function/xqdoc:comment/xqdoc:return      
    }})}
  </div>
};

(:~
 : Provided an xqdoc element. Geneates Bootstrap CSS 3 compliant Html documentation
 : @param Document to convert
 : @return Html div element containing Bootstrap CSS 3 markup
 :)
declare function xqdoc-bootstrap:xqdoc-to-html($doc as element(xqdoc:xqdoc)) as element(div) {
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
      order by $function/xqdoc:name || $function/@arity 
      return local:xqdoc-function-to-html($function)}
  </div>
};
