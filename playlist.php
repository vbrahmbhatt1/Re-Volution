<?php
error_reporting(E_ALL ^ E_NOTICE); 

$weather=$_POST['weather'];

try
{
    $pdo = new PDO('mysql:host=localhost;dbname=revolution', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');

    $link = mysqli_connect("localhost", "root", "", "revolution");
    $query = "SELECT song_t.Name, song_t.SongLengthSeconds, song_t.Link, artist_t.ArtistName FROM song_t 
    INNER JOIN artist_t on artist_t.ArtistID = song_t.ArtistID 
    WHERE song_t.SongID IN (
        SELECT playlistsongs_t.SongID from playlistsongs_t where playlistsongs_t.PlayListID =". $weather .
	")";
	$songs = [];
	if (isset($weather)){
		$songs = mysqli_query($link, $query);
    }
    $firstitem = true;
}
catch (PDOException $e)
{
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}

?>

<?php foreach ($songs as $song): ?>
    <article class="rev-item-100" >
        <section class="rev-container-song" name="playlistsong">
        <?php if ($firstitem) : ?>
            <article name="playlistsong" id="firstItem" class="rev-item-5" onclick="playsong(this)" data-value="<?php echo $song['Link'] ?>">
                <span class="glyphicon glyphicon-play"></span>
            </article>
        <?php endif; ?>

        <?php if (!$firstitem) : ?>
            <article name="playlistsong" class="rev-item-5" onclick="playsong(this)" data-value="<?php echo $song['Link'] ?>">
                <span class="glyphicon glyphicon-play"></span>
            </article>
        <?php $firstitem=false; endif; ?>

            <article name="playlistsong" class="rev-item-30">
                <label> <?php echo $song['Name']; ?> </label>
            </article>

            <article name="playlistsong" class="rev-item-30">
                <label> <?php echo $song['ArtistName']; ?> </label>
            </article>

            <article name="playlistsong" class="rev-item-30">
                <label> <?php echo $song['SongLengthSeconds']; ?> </label>
            </article>

            <article id="songlocation"></article>

            <article name="playlistsong" class="rev-item-5">
                <span class="glyphicon glyphicon-plus"></span>
            </article>
            <?php $firstitem=false; ?>
        </section>
    </article>
<?php endforeach; ?>