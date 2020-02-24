<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Validé XML par le XSD</title>
    <link rel="stylesheet" href="../Resources/css/bootstrap.min.css">
</head>
<body>
<div class='container'>
    <h1>Solution de Question 2</h1>

    <?php

    function libxml_display_error($error) {
        $return = "<br/>\n";
        switch ($error->level) {
            case LIBXML_ERR_WARNING:
                $return .= "<b>Warning $error->code</b>: ";
                break;
            case LIBXML_ERR_ERROR:
                $return .= "<b>Error $error->code</b>: ";
                break;
            case LIBXML_ERR_FATAL:
                $return .= "<b>Fatal Error $error->code</b>: ";
                break;
        }

        $return .= trim($error->message);
        if ($error->file)
            $return .= " in <b>$error->file</b>";
        
        $return .= " on line <b>$error->line</b>\n";

        return $return;
    }

    function libxml_display_errors() {
        $errors = libxml_get_errors();
        foreach ($errors as $error) {
            print libxml_display_error($error);
        }

        libxml_clear_errors();
    }

    // Enable user error handling
    libxml_use_internal_errors(true);

    $xml = new DOMDocument(); 
    $xml->load('emploi_de_temps.xml'); 

    echo "<h3 style='color: green'>Status:</h3>";

    if ($xml->schemaValidate('emploi_de_temps.xsd')) {
        echo "<script>alert('Le fichier XML emploi_de_temps.xml est validé par emploi_de_temps.xsd' )</script>"; 
        echo "<h4>Le fichier xml emploi_de_temps.xml  est <span style='color: #2196f3'>validé</span> par emploi_de_temps.xsd</h4>"; 
    } else {
        print "<b>DOMDocument::schemaValidate() <span style='color: #D00'>Générer des erreurs!</span></b>";
        libxml_display_errors();
    }
    ?>

    <a href="emploi_de_temps.xsd" class="btn btn-success">Voir le ficher XSD</a>
    <a href="../App" class="btn btn-info">Retour vers Home</a>

</div>
</body>
</html>