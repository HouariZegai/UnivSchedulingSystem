<?php
    
    $option = 'MGL';
    $niveau = '2';
    $output_path = '../';
    $output_file_name = "promotion_static";
    
    /* create a dom document with encoding utf8 */
    $domtree = new DOMDocument('1.0', 'UTF-8');

    /* root element */
    $promoElement = appendElement($domtree, 'promotion');

    appendAttribute($promoElement, 'option', $option);
    appendAttribute($promoElement, 'niveau', $niveau);

    $etudiantsElement = appendElement($promoElement, 'etudiants');
    for($i = 0; $i < 3; $i++) {
        $etudiantElement = appendElement($etudiantsElement, 'etudiant');
        appendAttribute($etudiantElement, 'numInscription', "E20{$i}");
        appendAttribute($etudiantElement, 'nom', 'X');
        appendAttribute($etudiantElement, 'prenom', 'Y');
    }

    $modulesElement = appendElement($promoElement, 'modules');
    for($i = 0; $i < 3; $i++) {
        $moduleElement = appendElement($modulesElement, 'module');
        appendAttribute($moduleElement, 'numInscription', "E20{$i}");
        appendAttribute($moduleElement, 'nomModule', 'Web 2.0');
    }

    /* get the xml printed */
    echo $domtree->saveXML();

    echo "Done!";

    $domtree->save("{$output_path}/{$output_file_name}.xml");

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