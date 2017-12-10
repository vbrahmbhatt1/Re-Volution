function playsong(element){
    var songlocation = element.getAttribute("data-value");

    var player = document.getElementById("player");
    var songplayer = document.getElementById("playsong");

    songplayer.src = songlocation;

    player.load();
    player.play();
}

function changePlaylist(element) {

    $.ajax({
        url:"playlist.php",
        type:"POST",
        data: {weather: element.getAttribute("name")},
        success: function(data){
            $("article[name=playlistsong]").remove();
            $("#playlistcontainer").prepend(data);

            var player = document.getElementById("player");
            var songplayer = document.getElementById("playsong");

            var songobj = document.getElementById("firstItem");
            var firstsong = songobj.getAttribute("data-value");
            songplayer.src = firstsong;
            player.load();
            player.play();
        }
    });
}

function deleteSongfromPlaylist(playlistID, songID){
    $.ajax({
        url:"delete.php",
        type:"POST",
        data: {deleteplaylist: playlistID, deletesong: songID},
        success: function(){
            changeplaylist(document.getElementById("deletePlaylist"));
        }
    });
}

// function addSongtoPlaylist(){

// }