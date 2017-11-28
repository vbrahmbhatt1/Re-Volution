<?php
$server = 'localhost';
$username = 'king';
$password = '7Jj8bQbCmVd2nVkw';
$database = 'king_music';

try{
	$conn = new PDO("mysql:host=$server;dbname=$database;", $username, $password);
} catch(PDOException $e){
	die( "Connection failed: " . $e->getMessage());
}
?>
