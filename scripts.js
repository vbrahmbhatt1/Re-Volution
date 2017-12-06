function playsong(element){
    var songlocation = element.getAttribute("data-value");

    var player = document.getElementById("player");
    var songplayer = document.getElementById("playsong");

    songplayer.src = songlocation;

    player.load();
    player.play();
}