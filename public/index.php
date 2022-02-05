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
    <main class="m-5 p-5">
        <div class="text-center">
            <h1 class="fw-bold">Databases Module</h1>
            <p class="lead">Maak een dynamische website met een database.</p>
        </div>
        <div class="row m-5">
            <div class="col">
                <h2>PHP Informatie</h2>
                <?php
                echo "<p>PHP Versie: " . phpversion() . "</p>";
                ?>
            </div>
            <div class="col">
                <h2>MySQL Informatie</h2>

                <?php
                $mysqli = new mysqli("localhost", "root");
                echo "<p>MySQL Versie: " . $mysqli->server_version . "</p>";
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
            </div>
        </div>
    </main>
</body>

</html>