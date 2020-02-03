<?php
	
    $promo = '2MGL'; // selected promotion
    $output_path = '../';
    $output_file_name = "planning";
    
    /* create a dom document with encoding utf8 */
    $domtree = new DOMDocument('1.0', 'UTF-8');

    function appendAttribute($element, $attributeName, $attributeValue) {
        global $domtree;
    
        $attr = $domtree->createAttribute($attributeName);
        $attr->value = $attributeValue;
        $element->appendChild($attr);
    }
    
    function appendElement($parent, $elementName) {
        global $domtree;
    
        /* create the element */
        $element = $domtree->createElement($elementName);
        /* append it to the document created & returned */
        return $parent->appendChild($element);
    }
    
    $xmlRoot = appendElement($domtree, 'emploi');
    appendAttribute($xmlRoot, 'promotion', $promo);

    $seanceElement = appendElement($xmlRoot, 'seance');
    appendAttribute($seanceElement, 'jour', 'Mercredi');
    appendAttribute($seanceElement, 'debut', '08:00');
    appendAttribute($seanceElement, 'fin', '09:30');
    appendAttribute($seanceElement, 'prof', 'A');
    appendAttribute($seanceElement, 'module', 'XML');
    appendAttribute($seanceElement, 'salle', '15');

    /* get the xml printed */
    echo $domtree->saveXML();

    $domtree->save("{$output_path}/{$output_file_name}.xml");
