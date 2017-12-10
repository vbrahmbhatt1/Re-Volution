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
        //send the playlist ID and song ID to delete.php so it knows what record to delete.
        data: {deleteplaylist: playlistID, deletesong: songID},
        success: function(){
            //repopulate the current playlist in the UI but since the record has been deleted from the database that song shouldn't show up in the playlist anymore.
            changeplaylist(document.getElementById("deletePlaylist"));
        }
    });
}

function addSongtoPlaylist(){
    $.ajax({
        url:"add.php",
        type:"POST",
        data: {addplaylist: playlistID, deletesong: songID},
        success: function(){
            changeplaylist(document.getElementById("deletePlaylist"));
        }
    });
}

/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function genDropDown() {
    document.getElementById("playlistDropDown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.rev-dropdown')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}