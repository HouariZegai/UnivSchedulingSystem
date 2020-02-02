<?php
	
    $promo = '2MGL'; // selected promotion
    $output_path = '../';
    $output_file_name = "planing";
    
    /* create a dom document with encoding utf8 */
    $domtree = new DOMDocument('1.0', 'UTF-8');

    /* create the root element of the xml tree */
    $xmlRoot = $domtree->createElement("emploi");
    /* append it to the document created */
    $xmlRoot = $domtree->appendChild($xmlRoot);

    $promo_attr = $domtree->createAttribute('promotion');
    $promo_attr->value = $promo;
    $xmlRoot->appendChild($promo_attr);

    $seanceElement = $domtree->createElement("seance");
    $seanceElement = $xmlRoot->appendChild($seanceElement);

    /* you should enclose the following two lines in a cicle */
    $jour_attr = $domtree->createAttribute('jour');
    $jour_attr->value = 'Mercredi';
    $seanceElement->appendChild($jour_attr);

    $debut_attr = $domtree->createAttribute('debut');
    $debut_attr->value = '08:00';
    $seanceElement->appendChild($debut_attr);
    
    $fin_attr = $domtree->createAttribute('fin');
    $fin_attr->value = '09:30';
    $seanceElement->appendChild($fin_attr);
    
    $prof_attr = $domtree->createAttribute('prof');
    $prof_attr->value = 'A';
    $seanceElement->appendChild($prof_attr);
    
    $module_attr = $domtree->createAttribute('module');
    $module_attr->value = 'XML';
    $seanceElement->appendChild($module_attr);

    $salle_attr = $domtree->createAttribute('salle');
    $salle_attr->value = '15';
    $seanceElement->appendChild($salle_attr);

    /* get the xml printed */
    echo $domtree->saveXML();

    $domtree->save("{$output_path}/{$output_file_name}.xml");
