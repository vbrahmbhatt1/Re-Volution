<?php
error_reporting(E_ALL ^ E_NOTICE);
$playlistID=$_POST['addplaylist'];
$songID=$_POST['addsong'];
try
{
    echo "<script>console.log( 'Debug Objects: " . $playlistID . " " . $songID . "' );</script>";
    echo "<script>console.log( 'Debug Objects: delete reached' );</script>";
    $pdo = new PDO('mysql:host=localhost;dbname=revolution', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');
    $link = mysqli_connect("localhost", "root", "", "revolution");

    $pdo->beginTransaction();
    if (isset($playlistID) && issset($songID)){
        $test = mysqli_query("INSERT INTO PlayListSongs_t VALUES (". $playlistID . "," . $songID . ");");
      }
    }

    $pdo->commit();
    echo "New playlist created"

catch (PDOException $e)
{
  $pdo->rollBack();
  echo "Could not create a playlist: ".$e->getMessage();
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}
?>
