<?php
error_reporting(E_ALL ^ E_NOTICE);

//get the playlistID and songID that need to be deleted.
$playlistID=$_GET['deleteplaylist'];
$songID=$_GET['deletesong'];

try
{
    //echo are console debugging statements.
    echo "<script>console.log( 'Debug Objects: " . $playlistID . " " . $songID . "' );</script>";
    echo "<script>console.log( 'Debug Objects: delete reached' );</script>";
    $pdo = new PDO('mysql:host=localhost;dbname=king_music', 'king', '7Jj8bQbCmVd2nVkw');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');

    $link = mysqli_connect("localhost", "king", "7Jj8bQbCmVd2nVkw", "king_music");

    //only try and delete if we know the playlist id and the song id.
    //(I don't know if this is the right way to send a delete query to SQL via php...may need some googling.)
	if (isset($playlistID) && issset($songID)){
        $query = mysqli_query("DELETE FROM PlayListSongs_t WHERE PlayListID=" . $playlistID . " AND " . "SongID=" . $songID .";");
    }}
    
    $songs = [];
    if (isset($weather)){
      $songs = mysqli_query($link, $query);
    }
    }


catch (PDOException $e)
{
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}

?>
