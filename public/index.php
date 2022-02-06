<?php

// Execute database management scripts

function runScript($fileName)
{
    $cmd = "cd .. && sh ./scripts/" . $fileName;
    shell_exec($cmd);
}

$importStarted = false;
$exportStarted = false;
$restoreStarted = false;

if ($_POST['import'] == 1) {
    runScript("import_dbs.sh");
    $importStarted = true;
}

if ($_POST['export'] == 1) {
    runScript("export_dbs.sh");
    $exportStarted = true;
}

if ($_POST['restore_default'] == 1) {
    runScript("restore_default_dbs.sh");
    $restoreStarted = true;
}

?>
<!doctype html>
<html lang="nl">

<head>
    <meta charset="utf8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <title>Databases Module</title>
</head>

<body class="container">
    <main class="mx-5 p-5">
        <div class="text-center">
            <h1 class="fw-bold">Databases Module</h1>
            <p class="lead">Maak een dynamische website met een database.</p>
        </div>
        <div class="row mx-5 p-5">
            <div class="col">
                <h3>phpMyAdmin</h3>
                <p>Login met <strong>root</strong> als gebruikersnaam zonder wachtwoord.</p>
                <a class="btn btn-outline-primary" href="/phpmyadmin" title="phpMyAdmin" target="_blank">Open phpMyAdmin</a>
            </div>
            <div class="col">
                <h2>Database Beheer</h2>
                <?php
                $mysqli = new mysqli("localhost", "root");
                if ($result = $mysqli->query("SHOW databases")) {
                    echo "<b>" . $result->num_rows . " databases: </b>";
                    echo "<ul>";
                    while ($row = $result->fetch_row()) {
                        printf("<li>%s</li>", $row[0], $row[1]);
                    }
                    echo "</ul>";
                    $result->free_result();
                }

                ?>
                <?php
                function info($msg)
                {
                    echo '<div class="alert alert-info" role="alert">' . $msg . '</div>';
                }

                if ($importStarted) {
                    info("Databases geimporteerd");
                }
                if ($exportStarted) {
                    info("Databases geexporteerd");
                }
                if ($restoreStarted) {
                    info("Standaard databases hersteld");
                }
                ?>
                <form action="index.php" method="post">
                    <div class="vstack gap-2 col-md-5">
                        <button class="btn btn-primary" name="export" value="1">Exporteer databases</button>
                        <button class="btn btn-outline-primary" name="import" value="1">Importeer databases</button>
                        <button class="btn btn-outline-danger" name="restore_default" value="1">Herstel standaard</button>
                    </div>
                </form>

            </div>

        </div>
    </main>
    <footer>
        <?php
        echo "<p>PHP versie: " . phpversion() . "</p>";
        echo "<p>MySQL versie: " . $mysqli->server_version . "</p>";
        ?>
    </footer>
</body>

</html>