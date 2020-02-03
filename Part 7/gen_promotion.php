<?php
    
    $option = 'MGL';
    $niveau = '2';
    $output_path = '../';
    $output_file_name = "promotion";
    
    /* create a dom document with encoding utf8 */
    $domtree = new DOMDocument('1.0', 'utf-8');

    /* root element */
    $promoElement = appendElement($domtree, 'promotion');

    appendAttribute($promoElement, 'option', $option);
    appendAttribute($promoElement, 'niveau', $niveau);

    require 'db_config.php';

    $sql_get_students = "SELECT num_et AS numInscription, nom_et AS nom, prenom_et AS prenom FROM etudiant;";
    $result = $conn->query($sql_get_students);

    if ($result->num_rows > 0) {
        $etudiantsElement = appendElement($promoElement, 'etudiants');
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $etudiantElement = appendElement($etudiantsElement, 'etudiant');
            appendAttribute($etudiantElement, 'numInscription', $row["numInscription"]);
            appendAttribute($etudiantElement, 'nom', $row["nom"]);
            appendAttribute($etudiantElement, 'prenom', $row["prenom"]);

            echo $row["numInscription"] . $row["nom"] . $row["prenom"];
        }
        
    } else {
        echo "0 etudiants";
    }

    $sql_get_modules = "SELECT id_mod AS idModule, nom_mod AS nomModule FROM modules;";
    $result = $conn->query($sql_get_modules);

    if ($result->num_rows > 0) {
        $modulesElement = appendElement($promoElement, 'modules');
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $moduleElement = appendElement($modulesElement, 'module');
            appendAttribute($moduleElement, 'idModule', $row["idModule"]);
            appendAttribute($moduleElement, 'nomModule', $row["nomModule"]);

            echo $row["idModule"] . ' ' . $row["nomModule"];
        }
        
    } else {
        echo "0 etudiants";
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