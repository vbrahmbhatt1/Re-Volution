DROP TABLE IF EXISTS PlayListSongs_t;
DROP TABLE IF EXISTS Song_t;
DROP TABLE IF EXISTS PlayList_t;
DROP TABLE IF EXISTS Album_t;
DROP TABLE IF EXISTS Genre_t;
DROP TABLE IF EXISTS User_t;
DROP TABLE IF EXISTS Artist_t;

CREATE TABLE User_t (
    UserID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(30),
    LastName varchar(30),
    DateOfBirth varchar(15),
    Email varchar(50),
    Password varchar(20),
    PRIMARY KEY (UserID)
);

INSERT INTO User_t VALUES ('0', 'Andrew', 'Rohrer', '09/09/1992', 'arohrer@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Valay', 'Brahmnhatt', 'dd/mm/yyyy', 'vbrahmbhatt@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'John', 'Doe', '08/09/1917', 'jDoe@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Jane', 'Doe', '10/09/1992', 'jDoe2@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Jimmy', 'Spruce', '05/09/1952', 'jspruce@luc.edu', 'test1234');
INSERT INTO User_t VALUES ('0', 'Hilda', 'Jenkins', '07/07/2000', 'hjenkins@luc.edu', 'test1234');


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
INSERT INTO Song_t VALUES ('0', 'Stayin Alive', '180', '1', '6', '3', './music/Bee_Gees-Stayin_Alive.mp3');                             --1
INSERT INTO Song_t VALUES ('0', 'More Than A Feeling', '180', '1', '6', '1', './music/Boston-More_Than_A_Feeling.mp3');                 --2
INSERT INTO Song_t VALUES ('0', 'Just the Way You Are', '180', '1', '3', '2', './music/Bruno_Mars-Just_The_Way_You_Are.mp3');           --3
INSERT INTO Song_t VALUES ('0', 'Call Me Maybe', '180', '1', '3', '22', './music/Carly_Rae_Jepsen-Call_Me_Maybe.mp3');                  --4
INSERT INTO Song_t VALUES ('0', 'Let it Snow', '180', '1', '1', '23', './music/Dean_Martin-Let_it_Snow.mp3');                           --5
INSERT INTO Song_t VALUES ('0', 'Perfect', '180', '1', '1', '24', './music/Ed_Sheeran-Perfect.mp3');                                    --6
INSERT INTO Song_t VALUES ('0', 'Carry On Wayward Son', '180', '1', '1', '25', './music/Kansas-Carry_On_Wayward_Son.mp3');              --7
INSERT INTO Song_t VALUES ('0', 'The One that Got Away', '180', '1', '1', '26', './music/Katy_Perry-The_One_That_Got_Away.mp3');        --8
INSERT INTO Song_t VALUES ('0', 'Blow', '180', '1', '1', '4', './music/Keha-Blow.mp3');                                                 --9
INSERT INTO Song_t VALUES ('0', 'A World Alone', '180', '1', '1', '5', './music/Lorde-A_World_Alone.mp3');                              --10
INSERT INTO Song_t VALUES ('0', 'Frozen', '180', '1', '1', '6', './music/Madonna-Frozen.mp3');                                          --11
INSERT INTO Song_t VALUES ('0', 'All I Want For Christmas', '180', '1', '1', '7', './music/Mariah_Carey-All_I_Want_For_Christmas.mp3'); --12
INSERT INTO Song_t VALUES ('0', 'Numb', '180', '1', '1', '8', './music/Numb-Linkin_Park.mp3');                                          --13
INSERT INTO Song_t VALUES ('0', 'Wonderwall', '180', '1', '1', '9', './music/Oasis-Wonderwall.mp3');                                    --14
INSERT INTO Song_t VALUES ('0', 'Let Her Go', '180', '1', '1', '10', './music/Passenger-Let_Her_Go.mp3');                               --15
INSERT INTO Song_t VALUES ('0', 'Fire and Ice', '180', '1', '1', '11', './music/Pat_Benatar-Fire_And_Ice.mp3');                         --16
INSERT INTO Song_t VALUES ('0', 'Happy', '180', '1', '1', '12', './music/Pharrell_Williams-Happy.mp3');                                 --17
INSERT INTO Song_t VALUES ('0', 'Bohemian Rhapsody', '180', '1', '1', '27', './music/Queen-Bohemian_Rhapsody.mp3');                     --18
INSERT INTO Song_t VALUES ('0', 'Snow', '180', '1', '1', '13', './music/Red_Hot_Chili_Peppers-Snow.mp3');                               --19
INSERT INTO Song_t VALUES ('0', 'Never Gonna Give You Up', '180', '1', '1', '14', './music/Rick_Astley-Never_Gonna_Give_You_Up.mp3');   --20
INSERT INTO Song_t VALUES ('0', 'Eye of the Tiger', '180', '1', '6', '15', './music/Survivor-Eye_Of_The_Tiger.mp3');                    --21
INSERT INTO Song_t VALUES ('0', 'Lions Den', '180', '1', '1', '16', './music/Teminite_PsoGnar-Lions_Den.mp3');                          --22
INSERT INTO Song_t VALUES ('0', 'Hazy Shade of Winter', '180', '1', '6', '17', './music/The_Bangles-Hazy_Shade_of_Winter.mp3');         --23
INSERT INTO Song_t VALUES ('0', 'Here Comes the Sun', '180', '1', '1', '18', './music/The_Beatles-Here_Comes_The_Sun.mp3');             --24
INSERT INTO Song_t VALUES ('0', 'Hey Jude', '180', '1', '1', '18', './music/The_Beatles-Hey_Jude.mp3');                                 --25
INSERT INTO Song_t VALUES ('0', 'Africa', '180', '1', '1', '19', './music/Toto-Africa.mp3');                                            --26
INSERT INTO Song_t VALUES ('0', 'Hey Soul Sister', '180', '1', '1', '20', './music/Train-Hey_Soul_Sister.mp3');                         --27
INSERT INTO Song_t VALUES ('0', 'Ice Ice Baby', '180', '1', '1', '21', './music/Vanilla_Ice-Ice_Ice_Baby.mp3');                         --28


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

--Sunny
INSERT INTO PlayListSongs_t VALUES ('1','4');
INSERT INTO PlayListSongs_t VALUES ('1', '17');
INSERT INTO PlayListSongs_t VALUES ('1', '3');
INSERT INTO PlayListSongs_t VALUES ('1', '27');
INSERT INTO PlayListSongs_t VALUES ('1', '22');

--Gloomy
INSERT INTO PlayListSongs_t VALUES ('2', '14');
INSERT INTO PlayListSongs_t VALUES ('2', '15');
INSERT INTO PlayListSongs_t VALUES ('2', '8');

--Snowy
INSERT INTO PlayListSongs_t VALUES ('3', '28');
INSERT INTO PlayListSongs_t VALUES ('3', '19');
INSERT INTO PlayListSongs_t VALUES ('3', '12');
INSERT INTO PlayListSongs_t VALUES ('3', '5');
INSERT INTO PlayListSongs_t VALUES ('3', '6');

--Icy
INSERT INTO PlayListSongs_t VALUES ('4', '10');
INSERT INTO PlayListSongs_t VALUES ('4', '13');
INSERT INTO PlayListSongs_t VALUES ('4', '11');
INSERT INTO PlayListSongs_t VALUES ('4', '16');
INSERT INTO PlayListSongs_t VALUES ('4', '23');

--Windy
INSERT INTO PlayListSongs_t VALUES ('5', '9');
INSERT INTO PlayListSongs_t VALUES ('5', '21');
INSERT INTO PlayListSongs_t VALUES ('5', '20');
INSERT INTO PlayListSongs_t VALUES ('5', '7');
INSERT INTO PlayListSongs_t VALUES ('5', '1');

--Rainy
INSERT INTO PlayListSongs_t VALUES ('6', '26');
INSERT INTO PlayListSongs_t VALUES ('6', '2');
INSERT INTO PlayListSongs_t VALUES ('6', '18');
INSERT INTO PlayListSongs_t VALUES ('6', '25');
INSERT INTO PlayListSongs_t VALUES ('6', '24');

CREATE TABLE Genre_t (
    GenreID int NOT NULL AUTO_INCREMENT,
    Name varchar(15),
    PRIMARY KEY (GenreID)
);

INSERT INTO Genre_t VALUES ('0', 'Rock');       --1
INSERT INTO Genre_t VALUES ('0', 'Country');    --2
INSERT INTO Genre_t VALUES ('0', 'Pop');        --3
INSERT INTO Genre_t VALUES ('0', 'Hip-Hop');    --4
INSERT INTO Genre_t VALUES ('0', 'Folk');       --5
INSERT INTO Genre_t VALUES ('0', 'Oldies');     --6



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

INSERT INTO Artist_t VALUES ('0', 'Boston');                --1
INSERT INTO Artist_t VALUES ('0', 'Bruno Mars');            --2
INSERT INTO Artist_t VALUES ('0', 'Bee Gees');              --3
INSERT INTO Artist_t VALUES ('0', 'Ke$ha');                 --4
INSERT INTO Artist_t VALUES ('0', 'Lorde');                 --5
INSERT INTO Artist_t VALUES ('0', 'Madonna');               --6
INSERT INTO Artist_t VALUES ('0', 'Mariah Carey');          --7
INSERT INTO Artist_t VALUES ('0', 'Linkin Park');           --8
INSERT INTO Artist_t VALUES ('0', 'Oasis');                 --9
INSERT INTO Artist_t VALUES ('0', 'Passenger');             --10
INSERT INTO Artist_t VALUES ('0', 'Pat Benatar');           --11
INSERT INTO Artist_t VALUES ('0', 'Pharrell');              --12
INSERT INTO Artist_t VALUES ('0', 'Red Hot Chili Peppers'); --13
INSERT INTO Artist_t VALUES ('0', 'Rick Astley');           --14
INSERT INTO Artist_t VALUES ('0', 'Survivor');              --15
INSERT INTO Artist_t VALUES ('0', 'Teminite');              --16
INSERT INTO Artist_t VALUES ('0', 'The Bangles');           --17
INSERT INTO Artist_t VALUES ('0', 'The Beatles');           --18
INSERT INTO Artist_t VALUES ('0', 'Africa');                --19
INSERT INTO Artist_t VALUES ('0', 'Train');                 --20
INSERT INTO Artist_t VALUES ('0', 'Vanilla Ice');           --21
INSERT INTO Artist_t VALUES ('0', 'Carly Rae Jepsen');      --22
INSERT INTO Artist_t VALUES ('0', 'Dean Martin');           --23
INSERT INTO Artist_t VALUES ('0', 'Ed Sheeran');            --24
INSERT INTO Artist_t VALUES ('0', 'Kansas');                --25
INSERT INTO Artist_t VALUES ('0', 'Katy Perry');            --26
INSERT INTO Artist_t VALUES ('0', 'Queen');                 --27