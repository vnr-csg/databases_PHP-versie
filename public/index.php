<?php

// Execute database management scripts

function runScript($fileName)
{
    $cmd = "cd .. && sh ./scripts/" . $fileName;
    shell_exec($cmd);
}

$importDone = false;
$exportDone = false;
$restoreDone = false;

if ($_POST['import'] == 1) {
    runScript("import_dbs.sh");
    $importDone = true;
}

if ($_POST['export'] == 1) {
    runScript("export_dbs.sh");
    $exportDone = true;
}

if ($_POST['restore_default'] == 1) {
    runScript("restore_default_dbs.sh");
    $restoreDone = true;
}

?>
<!doctype html>
<html lang="nl">

<head>
    <meta charset="utf8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <title>Databases Omgeving</title>
</head>

<body class="container" style="background-color: rgba(0, 0, 0, 0.1);">
    <main class="mx-5 p-5">
        <div class="container mx-3 my-2 shadow p-5 bg-body rounded">
            <h1 class="fw-bold text-center mb-4">
                Databases Omgeving
            </h1>
            <div class="row">
                <div class="col m-1 px-5 py-1">
                    <div class="mb-5">
                        <h2>
                            <i class="bi bi-book"></i>
                            Lesmateriaal
                        </h2>
                        <ul>
                            <li>
                                <a href="/js_api_demos" title="JavaScript APIs" target="_blank"><strong>JavaScript APIs</strong></a>: demos die het gebruik van verschillende JavaScript APIs laten zien.
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2>
                            <i class="bi bi-list-ul"></i>
                            Websites
                        </h2>
                        <?php
                        $files = scandir("./");
                        $ignored_files = [".", "..", "js_api_demos", "mysql-querier"];
                        $found = false;
                        echo "<ul>";
                        foreach ($files as $file) {
                            if (is_dir($file) && !in_array($file, $ignored_files)) {
                                echo '<li><a title="' . $file . '" href="/' . $file . '" target="_blank"><strong>' . $file . '</strong></a></li>';
                                $found = true;
                            }
                        }
                        echo "</ul>";
                        if (!$found) {
                            echo '<p>Geen websites gevonden, maak een map met een website in de public map om hier weer te geven.</p>';
                        }
                        ?>
                    </div>
                </div>
                <div class="col m-2 px-5 py-1">
                    <div class="mb-5">
                        <h2>
                            <i class="bi bi-sliders2-vertical"></i>
                            Database beheer
                        </h2>
                        <?php
                        $mysqli = new mysqli("localhost", "root");
                        if ($result = $mysqli->query("SHOW databases")) {
                            $databases = array();
                            while ($row = $result->fetch_row()) {
                                $dbName = $row[0];
                                // Filter out default databases
                                if ($dbName != "information_schema" && $dbName != "performance_schema" && $dbName != "sys" && $dbName != "mysql") {
                                    $databases[] = $dbName;
                                }
                            }
                            $result->free_result();
                        }
                        echo "<b>Er zijn " . count($databases) . " databases beschikbaar: </b>";
                        echo "<ul>";
                        foreach ($databases as $dbName) {
                            echo "<li>" . $dbName . "</li>";
                        }
                        echo "</ul>";
                        ?>
                        <?php
                        function info($msg)
                        {
                            echo '<div id="result-msg" class="alert alert-success" role="alert">' . $msg . '</div>';
                        }

                        if ($importDone) {
                            info("Databases geïmporteerd.");
                        }
                        if ($exportDone) {
                            info("Databases gëexporteerd.");
                        }
                        if ($restoreDone) {
                            info("Standaard databases hersteld.");
                        }
                        ?>
                        <div id="loading" class="alert alert-info" style="display: none;" role="alert">
                            <div class="d-flex align-items-center">
                                <p id="loading-msg">Aan het laden..</p>
                                <div class="spinner-border ms-auto" role="status" aria-hidden="true"></div>
                            </div>
                        </div>
                        <form id="db-man-form" action="index.php" method="post">
                            <div class="btn-group mb-2" role="group">
                                <button class="btn btn-outline-primary" name="export" value="1" data-bs-toggle="tooltip" data-bs-html="true" title="<b>Exporteer</b> de databases om met Git op te slaan.">
                                    <i class="bi bi-arrow-bar-up"></i>
                                    Exporteren</button>
                                <button class="btn btn-outline-primary" name="import" value="1" data-bs-toggle="tooltip" data-bs-html="true" title="<b>Importeer</b> de databases die je met Git hebt opgeslagen.">
                                    <i class="bi bi-arrow-bar-down"></i>
                                    Importeren</button>
                            </div>
                            <button class="btn btn-sm btn-outline-danger" name="restore_default" value="1" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-html="true" title="<b>Herstel</b> de databases die bij het lesmateriaal horen naar de oorspronkelijke versies.">
                                <i class="bi bi-skip-backward"></i>
                                Herstel standaard databases</button>
                        </form>
                        <script>
                            document.getElementById("db-man-form").addEventListener('submit', () => {
                                document.getElementById("loading").style.display = "";
                                if (document.getElementById("result-msg") != null) {
                                    document.getElementById("result-msg").style.display = "none";
                                }
                            });
                        </script>
                    </div>
                    <div>
                        <h2>
                            <i class="bi bi-tools"></i>
                            Database tools
                        </h2>
                        <ul>
                            <li>
                                <a href="/phpmyadmin" title="phpMyAdmin" target="_blank"><strong>phpMyAdmin</strong></a>: database administratie programma.
                            </li>
                            <li>
                                <a href="/mysql-querier" title="MySQL Querier" target="_blank"><strong>MySQL Querier</strong></a>: test en voer je SQL-queries uit.
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <footer class="d-flex flex-wrap align-items-center justify-content-between py-3 my-4 mx-5">
                <span class="text-muted">Made by Rijk van Putten</span>
                <div>
                    <?php
                    echo '<span class="text-muted mx-3">PHP: <strong>' . phpversion() . '</strong></span>';
                    $mysql_v = (float)$mysqli->server_version;
                    $main_version = floor($mysql_v / 10000);
                    $minor_version = floor(($mysql_v - $main_version * 10000) / 100);
                    $sub_version = $mysql_v - $main_version * 10000 - $minor_version * 100;
                    echo '<span class="text-muted mx-3">MySQL: <strong>' . $main_version . "." . $minor_version . "." . $sub_version . '</strong></span>';

                    $git_hash = shell_exec("git rev-parse HEAD");
                    if (isset($git_hash)) {
                        echo '<span class="text-muted mx-3">Commit: <strong>' . substr($git_hash, 0, 7) . '</strong></span>';
                    }
                    ?>
                </div>
            </footer>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script>
        // Add bootstrap tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    </script>
</body>

</html>