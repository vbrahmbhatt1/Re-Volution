DROP TABLE IF EXISTS PlayListSongs_t;
DROP TABLE IF EXISTS Song_t;
DROP TABLE IF EXISTS PlayList_t;
DROP TABLE IF EXISTS Album_t;
DROP TABLE IF EXISTS Genre_t;
DROP TABLE IF EXISTS User_t;
DROP TABLE IF EXISTS Artist_t;

CREATE TABLE User_t(
    UserID int NOT NULL AUTO_INCREMENT,
    Username varchar(100),
    Email varchar(100),
    Password varchar(160),
    PRIMARY KEY (UserID)
);

INSERT INTO User_t VALUES ('0', 'Andrew', 'arohrer@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Valay', 'vbrahmbhatt@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'John', 'jDoe@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Jane', 'jDoe2@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Jimmy', 'jspruce@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Hilda', 'hjenkins@luc.edu', 'test1234');

CREATE TABLE Song_t (
    SongID int NOT NULL AUTO_INCREMENT,
    Name varchar(30),
    SongLengthSeconds int,
    AlbumID int,
    GenreID int,
    ArtistID int NOT NULL,
    Link varchar(75),
    PRIMARY KEY (SongID)
);
-- PK, Song Title, Song length seconds, AlbumID, GenreID, ArtistID, Link
INSERT INTO Song_t VALUES ('0', 'Stayin Alive', '180', '1', '6', '3', './music/Bee_Gees-Stayin_Alive.mp3');
INSERT INTO Song_t VALUES ('0', 'More Than A Feeling', '180', '1', '6', '1', './music/Boston-More_Than_A_Feeling.mp3');
INSERT INTO Song_t VALUES ('0', 'Just the Way You Are', '180', '1', '3', '2', './music/Bruno_Mars-Just_The_Way_You_Are.mp3');
INSERT INTO Song_t VALUES ('0', 'Call Me Maybe', '180', '1', '3', '22', './music/Carly_Rae_Jepsen-Call_Me_Maybe.mp3');
INSERT INTO Song_t VALUES ('0', 'Let it Snow', '180', '1', '1', '23', './music/Dean_Martin-Let_it_Snow.mp3');
INSERT INTO Song_t VALUES ('0', 'Perfect', '180', '1', '1', '24', './music/Ed_Sheeran-Perfect.mp3');
INSERT INTO Song_t VALUES ('0', 'Carry On Wayward Son', '180', '1', '1', '25', './music/Kansas-Carry_On_Wayward_Son.mp3');
INSERT INTO Song_t VALUES ('0', 'The One that Got Away', '180', '1', '1', '26', './music/Katy_Perry-The_One_That_Got_Away.mp3');
INSERT INTO Song_t VALUES ('0', 'Blow', '180', '1', '1', '4', './music/Keha-Blow.mp3');
INSERT INTO Song_t VALUES ('0', 'A World Alone', '180', '1', '1', '5', './music/Lorde-A_World_Alone.mp3');
INSERT INTO Song_t VALUES ('0', 'Frozen', '180', '1', '1', '6', './music/Madonna-Frozen.mp3');
INSERT INTO Song_t VALUES ('0', 'All I Want For Christmas', '180', '1', '1', '7', './music/Mariah_Carey-All_I_Want_For_Christmas.mp3');
INSERT INTO Song_t VALUES ('0', 'Numb', '180', '1', '1', '8', './music/Numb-Linkin_Park.mp3');
INSERT INTO Song_t VALUES ('0', 'Wonderwall', '180', '1', '1', '9', './music/Oasis-Wonderwall.mp3');
INSERT INTO Song_t VALUES ('0', 'Let Her Go', '180', '1', '1', '10', './music/Passenger-Let_Her_Go.mp3');
INSERT INTO Song_t VALUES ('0', 'Fire and Ice', '180', '1', '1', '11', './music/Pat_Benatar-Fire_And_Ice.mp3');
INSERT INTO Song_t VALUES ('0', 'Happy', '180', '1', '1', '12', './music/Pharrell_Williams-Happy.mp3');
INSERT INTO Song_t VALUES ('0', 'Bohemian Rhapsody', '180', '1', '1', '27', './music/Queen-Bohemian_Rhapsody.mp3');
INSERT INTO Song_t VALUES ('0', 'Snow', '180', '1', '1', '13', './music/Red_Hot_Chili_Peppers-Snow.mp3');
INSERT INTO Song_t VALUES ('0', 'Never Gonna Give You Up', '180', '1', '1', '14', './music/Rick_Astley-Never_Gonna_Give_You_Up.mp3');
INSERT INTO Song_t VALUES ('0', 'Eye of the Tiger', '180', '1', '6', '15', './music/Survivor-Eye_Of_The_Tiger.mp3');
INSERT INTO Song_t VALUES ('0', 'Lions Den', '180', '1', '1', '16', './music/Teminite_PsoGnar-Lions_Den.mp3');
INSERT INTO Song_t VALUES ('0', 'Hazy Shade of Winter', '180', '1', '6', '17', './music/The_Bangles-Hazy_Shade_of_Winter.mp3');
INSERT INTO Song_t VALUES ('0', 'Here Comes the Sun', '180', '1', '1', '18', './music/The_Beatles-Here_Comes_The_Sun.mp3');
INSERT INTO Song_t VALUES ('0', 'Hey Jude', '180', '1', '1', '18', './music/The_Beatles-Hey_Jude.mp3');
INSERT INTO Song_t VALUES ('0', 'Africa', '180', '1', '1', '19', './music/Toto-Africa.mp3');
INSERT INTO Song_t VALUES ('0', 'Hey Soul Sister', '180', '1', '1', '20', './music/Train-Hey_Soul_Sister.mp3');
INSERT INTO Song_t VALUES ('0', 'Ice Ice Baby', '180', '1', '1', '21', './music/Vanilla_Ice-Ice_Ice_Baby.mp3');


CREATE TABLE PlayList_t (
    PlayListID int NOT NULL AUTO_INCREMENT,
    PlayListName varchar(30),
    UserID int NOT NULL,
    PRIMARY KEY (PlayListID),
    FOREIGN KEY (UserID) REFERENCES User_t(UserID) ON DELETE CASCADE
);

INSERT INTO PlayList_t VALUES ('0', 'Sunny', '1');
INSERT INTO PlayList_t VALUES ('0', 'Gloomy', '2');
INSERT INTO PlayList_t VALUES ('0', 'Snowy', '3');
INSERT INTO PlayList_t VALUES ('0', 'Icy', '4');
INSERT INTO PlayList_t VALUES ('0', 'Windy', '5');
INSERT INTO PlayList_t VALUES ('0', 'Rainy', '1');
INSERT INTO PlayList_t VALUES ('0', 'Custom1','1');
INSERT INTO PlayList_t VALUES ('0', 'Custom1','2');
INSERT INTO PlayList_t VALUES ('0', 'Custom1','3');

CREATE TABLE PlayListSongs_t(
    PlayListID int NOT NULL,
    SongID int NOT NULL,
    FOREIGN KEY (PlayListID) REFERENCES PlayList_t(PlayListID),
    INDEX PlayListIdx (PlayListID)
);


INSERT INTO PlayListSongs_t VALUES ('1','4');
INSERT INTO PlayListSongs_t VALUES ('1', '17');
INSERT INTO PlayListSongs_t VALUES ('1', '3');
INSERT INTO PlayListSongs_t VALUES ('1', '27');
INSERT INTO PlayListSongs_t VALUES ('1', '22');


INSERT INTO PlayListSongs_t VALUES ('2', '14');
INSERT INTO PlayListSongs_t VALUES ('2', '15');
INSERT INTO PlayListSongs_t VALUES ('2', '8');


INSERT INTO PlayListSongs_t VALUES ('3', '28');
INSERT INTO PlayListSongs_t VALUES ('3', '19');
INSERT INTO PlayListSongs_t VALUES ('3', '12');
INSERT INTO PlayListSongs_t VALUES ('3', '5');
INSERT INTO PlayListSongs_t VALUES ('3', '6');


INSERT INTO PlayListSongs_t VALUES ('4', '10');
INSERT INTO PlayListSongs_t VALUES ('4', '13');
INSERT INTO PlayListSongs_t VALUES ('4', '11');
INSERT INTO PlayListSongs_t VALUES ('4', '16');
INSERT INTO PlayListSongs_t VALUES ('4', '23');


INSERT INTO PlayListSongs_t VALUES ('5', '9');
INSERT INTO PlayListSongs_t VALUES ('5', '21');
INSERT INTO PlayListSongs_t VALUES ('5', '20');
INSERT INTO PlayListSongs_t VALUES ('5', '7');
INSERT INTO PlayListSongs_t VALUES ('5', '1');


INSERT INTO PlayListSongs_t VALUES ('6', '26');
INSERT INTO PlayListSongs_t VALUES ('6', '2');
INSERT INTO PlayListSongs_t VALUES ('6', '18');
INSERT INTO PlayListSongs_t VALUES ('6', '25');
INSERT INTO PlayListSongs_t VALUES ('6', '24');

INSERT INTO PlayListSongs_t VALUES ('7', '1');
INSERT INTO PlayListSongs_t VALUES ('7', '2');
INSERT INTO PlayListSongs_t VALUES ('7', '3');
INSERT INTO PlayListSongs_t VALUES ('7', '4');
INSERT INTO PlayListSongs_t VALUES ('7', '5');
INSERT INTO PlayListSongs_t VALUES ('7', '6');
INSERT INTO PlayListSongs_t VALUES ('7', '7');
INSERT INTO PlayListSongs_t VALUES ('7', '8');
INSERT INTO PlayListSongs_t VALUES ('7', '9');
INSERT INTO PlayListSongs_t VALUES ('7', '10');
INSERT INTO PlayListSongs_t VALUES ('7', '11');
INSERT INTO PlayListSongs_t VALUES ('7', '12');
INSERT INTO PlayListSongs_t VALUES ('7', '13');
INSERT INTO PlayListSongs_t VALUES ('7', '14');
INSERT INTO PlayListSongs_t VALUES ('7', '15');
INSERT INTO PlayListSongs_t VALUES ('7', '16');
INSERT INTO PlayListSongs_t VALUES ('7', '17');
INSERT INTO PlayListSongs_t VALUES ('7', '18');
INSERT INTO PlayListSongs_t VALUES ('7', '19');
INSERT INTO PlayListSongs_t VALUES ('7', '20');
INSERT INTO PlayListSongs_t VALUES ('7', '21');
INSERT INTO PlayListSongs_t VALUES ('7', '22');
INSERT INTO PlayListSongs_t VALUES ('7', '23');
INSERT INTO PlayListSongs_t VALUES ('7', '24');
INSERT INTO PlayListSongs_t VALUES ('7', '25');
INSERT INTO PlayListSongs_t VALUES ('7', '26');
INSERT INTO PlayListSongs_t VALUES ('7', '27');
INSERT INTO PlayListSongs_t VALUES ('7', '28');

CREATE TABLE Genre_t (
    GenreID int NOT NULL AUTO_INCREMENT,
    Name varchar(15),
    PRIMARY KEY (GenreID)
);

INSERT INTO Genre_t VALUES ('0', 'Rock');
INSERT INTO Genre_t VALUES ('0', 'Country');
INSERT INTO Genre_t VALUES ('0', 'Pop');
INSERT INTO Genre_t VALUES ('0', 'Hip-Hop');
INSERT INTO Genre_t VALUES ('0', 'Folk');
INSERT INTO Genre_t VALUES ('0', 'Oldies');



CREATE TABLE Album_t(
    AlbumID int NOT NULL AUTO_INCREMENT,
    AlbumName varchar(30),
    ReleaseDate varchar(15),
    TotalTracks int,
    GenreID int NOT NULL,
    PRIMARY KEY (AlbumID),
    FOREIGN KEY (GenreID) REFERENCES Genre_t(GenreID)
);

INSERT INTO Album_t VALUES ('0', 'These Things Happen', '10/10/2010', 12, 4);
INSERT INTO Album_t VALUES ('0', 'Attention', '09/12/2017', 12, 5);
INSERT INTO Album_t VALUES ('0', 'In Between Dreams', '05/27/2015', 12, 2);
INSERT INTO Album_t VALUES ('0', 'Feel It Still', '11/16/2016', 12, 3);
INSERT INTO Album_t VALUES ('0', 'A Song To Sing', '03/30/2017', 12, 5);

CREATE TABLE Artist_t (
    ArtistID int NOT NULL AUTO_INCREMENT,
    ArtistName varchar(30),
    PRIMARY KEY (ArtistID)
);

INSERT INTO Artist_t VALUES ('0', 'Boston');
INSERT INTO Artist_t VALUES ('0', 'Bruno Mars');
INSERT INTO Artist_t VALUES ('0', 'Bee Gees');
INSERT INTO Artist_t VALUES ('0', 'Ke$ha');
INSERT INTO Artist_t VALUES ('0', 'Lorde');
INSERT INTO Artist_t VALUES ('0', 'Madonna');
INSERT INTO Artist_t VALUES ('0', 'Mariah Carey');
INSERT INTO Artist_t VALUES ('0', 'Linkin Park');
INSERT INTO Artist_t VALUES ('0', 'Oasis');
INSERT INTO Artist_t VALUES ('0', 'Passenger');
INSERT INTO Artist_t VALUES ('0', 'Pat Benatar');
INSERT INTO Artist_t VALUES ('0', 'Pharrell');
INSERT INTO Artist_t VALUES ('0', 'Red Hot Chili Peppers');
INSERT INTO Artist_t VALUES ('0', 'Rick Astley');
INSERT INTO Artist_t VALUES ('0', 'Survivor');
INSERT INTO Artist_t VALUES ('0', 'Teminite');
INSERT INTO Artist_t VALUES ('0', 'The Bangles');
INSERT INTO Artist_t VALUES ('0', 'The Beatles');
INSERT INTO Artist_t VALUES ('0', 'Africa');
INSERT INTO Artist_t VALUES ('0', 'Train');
INSERT INTO Artist_t VALUES ('0', 'Vanilla Ice');
INSERT INTO Artist_t VALUES ('0', 'Carly Rae Jepsen');
INSERT INTO Artist_t VALUES ('0', 'Dean Martin');
INSERT INTO Artist_t VALUES ('0', 'Ed Sheeran');
INSERT INTO Artist_t VALUES ('0', 'Kansas');
INSERT INTO Artist_t VALUES ('0', 'Katy Perry');
INSERT INTO Artist_t VALUES ('0', 'Queen');
