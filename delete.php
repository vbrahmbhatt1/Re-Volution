<?php
error_reporting(E_ALL ^ E_NOTICE); 

//get the playlistID and songID that need to be deleted.
$playlistID=$_POST['deleteplaylist'];
$songID=$_POST['deletesong'];

try
{
    //echo are console debugging statements.
    echo "<script>console.log( 'Debug Objects: " . $playlistID . " " . $songID . "' );</script>";
    echo "<script>console.log( 'Debug Objects: delete reached' );</script>";
    $pdo = new PDO('mysql:host=localhost;dbname=revolution', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');

    $link = mysqli_connect("localhost", "root", "", "revolution");
    
    //only try and delete if we know the playlist id and the song id. (I don't know if this is the right way to send a delete query to SQL via php...may need some googling.)
	if (isset($playlistID) && issset($songID)){
        $test = mysqli_query("DELETE FROM playlistsongs_t WHERE PlayListID=" . $playlistID . " AND " . "SongID=" . $songID .";");
    }
}
catch (PDOException $e)
{
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}

?>
