<?php

require 'db_config.php';

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT nom_ens FROM enseignant;";

$result = $conn->query($sql);

if(!$result)
      echo 'sql failure:', $conn->error, ': ', $sql;

if ($result->num_rows > 0) {

    $out = array();

    // output data of each row
    while($row = $result->fetch_assoc()) {
        $out[] = $row["nom_ens"];
    }

    echo json_encode($out);

} else {
    echo "0 results";
}

$conn->close();