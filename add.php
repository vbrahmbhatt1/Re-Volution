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
    
	if (isset($playlistID) && issset($songID)){
        $test = mysqli_query("INSERT INTO PlayListSongs_t VALUES (". $playlistID . "," . $songID . ");");
    }
}
catch (PDOException $e)
{
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}

?>