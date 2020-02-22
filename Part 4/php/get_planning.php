<?php

$niveau = $_GET['niveau']; // selected niveau
$option = $_GET['option']; // selected option

/* create a dom document with encoding utf8 */
$doc = new DOMDocument('1.0', 'UTF-8');

/* create the root element of the xml tree */
$xmlRoot = $doc->createElement("emploi");
/* append it to the document created */
$xmlRoot = $doc->appendChild($xmlRoot);

$promo_attr = $doc->createAttribute('promotion');
$promo_attr->value = $option;
$xmlRoot->appendChild($promo_attr);

function addSeanceToXMLEmploi($jour, $debut, $fin, $prof, $module, $salle) {
    global $doc, $xmlRoot;

    $seanceElement = $doc->createElement("seance");
    $seanceElement = $xmlRoot->appendChild($seanceElement);

    /* you should enclose the following two lines in a cicle */
    $jour_attr = $doc->createAttribute('jour');
    $jour_attr->value = $jour;
    $seanceElement->appendChild($jour_attr);

    $debut_attr = $doc->createAttribute('debut');
    $debut_attr->value = $debut;
    $seanceElement->appendChild($debut_attr);
    
    $fin_attr = $doc->createAttribute('fin');
    $fin_attr->value = $fin;
    $seanceElement->appendChild($fin_attr);
    
    $prof_attr = $doc->createAttribute('prof');
    $prof_attr->value = $prof;
    $seanceElement->appendChild($prof_attr);
    
    $module_attr = $doc->createAttribute('module');
    $module_attr->value = $module;
    $seanceElement->appendChild($module_attr);

    $salle_attr = $doc->createAttribute('salle');
    $salle_attr->value = $salle;
    $seanceElement->appendChild($salle_attr);
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
WHERE cours.id_promo = (SELECT id_promo FROM promotion WHERE promotion.niveau = '{$niveau}' 
AND promotion.id_speci = (SELECT id_speci FROM specialite WHERE nom_speci = '{$option}'))
AND cours.id_promo = promotion.id_promo AND cours.id_ens = enseignant.id_ens AND cours.id_salle = salles.id_salle AND cours.id_mod = modules.id_mod 
ORDER BY cours.id_cours;";

$result = $conn->query($sql);

if(!$result)
      echo 'sql failure:', $conn->error, ': ', $sql;

if ($result->num_rows > 0) {
    global $doc;

    // output data of each row
    while($row = $result->fetch_assoc()) {
        addSeanceToXMLEmploi($row["jour"], $row["debut"], $row["fin"], $row["prof"], $row["module"], $row["salle"]);
        // echo $row["jour"] . $row["debut"] . $row["fin"] . $row["prof"] . $row["module"] . $row["salle"] . "<br>";
    }

    /* get the xml printed */

    echo $doc->saveXML();

} else {
    echo "0 results";
}

$conn->close();