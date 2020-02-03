<?php

$niveau = '2'; // Selected niveau
$promo = 'MGL'; // selected promotion
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

function addSeanceToXMLEmploi($jour, $debut, $fin, $prof, $module, $salle) {
    global $domtree, $xmlRoot;

    $seanceElement = appendElement($xmlRoot, 'seance');
    appendAttribute($seanceElement, 'jour', $jour);
    appendAttribute($seanceElement, 'debut', $debut);
    appendAttribute($seanceElement, 'fin', $fin);
    appendAttribute($seanceElement, 'prof', $prof);
    appendAttribute($seanceElement, 'module', $module);
    appendAttribute($seanceElement, 'salle', $salle);
}

require 'db_config.php';

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT cours.jour, 
TIME_FORMAT(cours.heure_debut, '%H:%i') AS debut, 
TIME_FORMAT(cours.heure_fin, '%H:%i') AS fin, 
enseignant.nom_ens as prof, modules.nom_mod as module, salles.nom_salle as salle
FROM cours, promotion, enseignant, modules, salles 
WHERE cours.id_promo in (SELECT id_promo FROM promotion WHERE promotion.niveau = '{$niveau}' 
AND promotion.id_speci = (SELECT id_speci FROM spécialité WHERE nom_speci = '{$promo}')) 
AND cours.id_promo = promotion.id_promo AND cours.id_ens = enseignant.id_ens 
AND cours.id_salle = salles.id_salle AND cours.id_mod = modules.id_mod 
ORDER BY cours.id_cours;";

echo $sql . '<br><br>';

$result = $conn->query($sql);

if ($result->num_rows > 0) {

    // output data of each row
    while($row = $result->fetch_assoc()) {
        addSeanceToXMLEmploi($row["jour"], $row["debut"], $row["fin"], $row["prof"], $row["module"], $row["salle"]);
        echo "Jour: " . $row["jour"]. ", time: " . $row["debut"]. " - " . $row["fin"]. "<br>";
    }

    /* get the xml printed */
    echo $domtree->saveXML();

    $domtree->save("{$output_file_name}.xml");
} else {
    echo "0 results";
}

$conn->close();