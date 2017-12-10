<?php
error_reporting(E_ALL ^ E_NOTICE); 

$weather=$_POST['weather'];

try
{
    $pdo = new PDO('mysql:host=localhost;dbname=revolution', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');

    $link = mysqli_connect("localhost", "root", "", "revolution");
    $query = "SELECT song_t.Name, song_t.SongLengthSeconds, song_t.Link, artist_t.ArtistName, song_t.SongID, playlistsongs_t.PlayListID FROM song_t 
    INNER JOIN artist_t on artist_t.ArtistID = song_t.ArtistID 
    INNER JOIN playlistsongs_t on playlistsongs_t.SongID = song_t.SongID
    WHERE song_t.SongID IN (
        SELECT playlistsongs_t.SongID from playlistsongs_t where playlistsongs_t.PlayListID =". $weather .
    ")" . "AND playlistsongs_t.PlayListID=" . $weather;
    
    $playlistquery = "SELECT PlayListID, PlayListName FROM playlist_t;";

    $numofsongsslq = "SELECT COUNT(*) as totalsongs FROM playlistsongs_t where playlistsongs_t.PlaylistID = " . $weather . ";";
    $songs = [];
    $playlists = [];
    $numofsongs = 0;
	if (isset($weather)){
        $songs = mysqli_query($link, $query);
        $playlists = mysqli_query($link, $playlistquery);
        $numofsongs = mysqli_query($link, $numofsongsslq);
    }
    $firstitem = true;
    $numsongsresult = mysqli_fetch_assoc($numofsongs);
    $deleteString = "test";
}
catch (PDOException $e)
{
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}

?>
<article name="playlistsong" class="rev-item-100">
    <span>This playlist has <?php echo $numsongsresult["totalsongs"]?> songs</span>
</article>

</article>
<?php foreach ($songs as $song): ?>
    <article class="rev-item-100" >
        <section class="rev-container-song" name="playlistsong">
        <?php if ($firstitem) : ?>
            <article name="playlistsong" id="firstItem" class="rev-item-5 rev-plus" onclick="playsong(this)" data-value="<?php echo $song['Link'] ?>">
                <span class="glyphicon glyphicon-play"></span>
            </article>
        <?php endif; ?>

        <?php if (!$firstitem) : ?>
            <article name="playlistsong" class="rev-item-5 rev-plus" onclick="playsong(this)" data-value="<?php echo $song['Link'] ?>">
                <span class="glyphicon glyphicon-play"></span>
            </article>
        <?php $firstitem=false; endif; ?>

            <article name="playlistsong" class="rev-item-50">
                <label> <?php echo $song['Name']; ?> </label>
            </article>

            <article name="playlistsong" class="rev-item-50">
                <label> <?php echo $song['ArtistName']; ?> </label>
            </article>

            <article name="playlistsong" class="rev-item-30">
                <label> <?php echo $song['SongLengthSeconds']; ?> </label>
            </article>
            <?php $deleteString = $song['PlayListID'] . "," . $song['SongID'];?>
            <article name="playlistsong" class="rev-item-5 rev-minus">
                <span id="deletePlaylist" class="glyphicon glyphicon-minus" name="<?php echo $song['PlayListID'] ?>" onclick="deleteSongfromPlaylist(<?php echo $deleteString ?>)"></span>
            </article>

            <article name="playlistsong" class="rev-item-5 rev-plus">
                <div class="glyphicon glyphicon-plus rev-dropdown" onclick="genDropDown()">
                    <div id="playlistDropDown" class="rev-dropdown-content">
                        <?php foreach ($playlists as $playlist): ?>
                            <a name="<?php $playlist['PlayListID'] ?>, <?php $song['SongID'] ?>"><?php $playlist['PlayListName'] ?></a>
                        <?php endforeach; ?>
                    </div>
                </div>
            </article>
            <?php $firstitem=false; ?>
        </section>
    </article>
<?php endforeach; ?>

<div class="rev-dropdown">
  
</div> 