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

INSERT INTO Song_t VALUES ('0', 'Female', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song_t VALUES ('0', 'Banana Pancakes', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song_t VALUES ('0', 'Feel it Still', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song_t VALUES ('0', 'Remember You', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song_t VALUES ('0', 'Attention', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song_t VALUES ('0', 'A Song to Sing', '180', '1', '1', '1', 'www.spotifyapi.com');


CREATE TABLE PlayList_t (
    PlayListID int NOT NULL AUTO_INCREMENT,
    PlayListName varchar(30),
    UserID int NOT NULL,
    PRIMARY KEY (PlayListID),
    FOREIGN KEY (UserID) REFERENCES User_t(UserID) ON DELETE CASCADE
);

INSERT INTO PlayList_t VALUES ('0', 'Happy', '1');
INSERT INTO PlayList_t VALUES ('0', 'Chill', '2');
INSERT INTO PlayList_t VALUES ('0', 'Workout', '3');
INSERT INTO PlayList_t VALUES ('0', 'Sad', '4');
INSERT INTO PlayList_t VALUES ('0', 'Dance', '5');


CREATE TABLE PlayListSongs_t(
    PlayListID int NOT NULL,
    SongID int NOT NULL,
    FOREIGN KEY (PlayListID) REFERENCES PlayList_t(PlayListID),
    INDEX PlayListIdx (PlayListID)
);

INSERT INTO PlayListSongs_t VALUES ('1','3');
INSERT INTO PlayListSongs_t VALUES ('1', '1');
INSERT INTO PlayListSongs_t VALUES ('1', '2');

INSERT INTO PlayListSongs_t VALUES ('2', '3');
INSERT INTO PlayListSongs_t VALUES ('2', '1');
INSERT INTO PlayListSongs_t VALUES ('2', '2');

INSERT INTO PlayListSongs_t VALUES ('3', '3');
INSERT INTO PlayListSongs_t VALUES ('3', '1');
INSERT INTO PlayListSongs_t VALUES ('3', '2');


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

INSERT INTO Artist_t VALUES ('Taylor Swift');
INSERT INTO Artist_t VALUES ('Justin Timberlake');
INSERT INTO Artist_t VALUES ('Ke$ha');
