<?php
    
    $option = $_GET['option'];
    $niveau = $_GET['niveau'];
    
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
        }
        
    } else {
        // echo "0 etudiants";
    }

    $sql_get_modules = "SELECT DISTINCT modules.id_mod AS idModule, modules.nom_mod as nomModule
    FROM cours, promotion, enseignant, modules, salles 
    WHERE cours.id_promo = (SELECT id_promo FROM promotion WHERE promotion.niveau = '{$niveau}'
    AND promotion.id_speci = (SELECT id_speci FROM specialite WHERE nom_speci = '{$option}'))
    AND cours.id_promo = promotion.id_promo AND cours.id_ens = enseignant.id_ens AND cours.id_salle = salles.id_salle AND cours.id_mod = modules.id_mod 
    ORDER BY cours.id_cours;";

    $result = $conn->query($sql_get_modules);

    if ($result->num_rows > 0) {
        $modulesElement = appendElement($promoElement, 'modules');
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $moduleElement = appendElement($modulesElement, 'module');
            appendAttribute($moduleElement, 'idModule', $row["idModule"]);
            appendAttribute($moduleElement, 'nomModule', $row["nomModule"]);
        }
        
    } else {
        // echo "0 modules";
    }

    /* get the xml printed */
    echo $domtree->saveXML();

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