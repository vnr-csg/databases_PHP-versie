<?php
include "db.inc.php";

$result = $rootDbConn->query("SHOW databases");

$databases = array();

foreach ($result as $row) {
    $dbName = $row["Database"];
    if ($dbName != "information_schema" && $dbName != "performance_schema" && $dbName != "mysql" && $dbName != "sys") {
        $databases[] = $row["Database"];
    }
}

echo json_encode($databases);
