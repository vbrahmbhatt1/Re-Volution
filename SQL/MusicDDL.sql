DROP TABLE IF EXISTS User;
CREATE TABLE User (
    UserID int NOT NULL,
    FirstName varchar(30),
    LastName varchar(30),
    DateOfBirth varchar(15),
    Email varchar(50),
    Password varchar(20),
    PRIMARY KEY (UserID)
);

INSERT INTO User VALUES ('Andrew', 'Rohrer', '09/09/1992', 'arohrer@luc.edu', 'test1234');
INSERT INTO User VALUES ('Valay', 'Brahmnhatt', 'dd/mm/yyyy', 'vbrahmbhatt@luc.edu', 'test1234');
INSERT INTO User VALUES ('John', 'Doe', '08/09/1917', 'jDoe@luc.edu', 'test1234');
INSERT INTO User VALUES ('Jane', 'Doe', '10/09/1992', 'jDoe2@luc.edu', 'test1234');
INSERT INTO User VALUES ('Jimmy', 'Spruce', '05/09/1952', 'jspruce@luc.edu', 'test1234');
INSERT INTO User VALUES ('Hilda', 'Jenkins', '07/07/2000', 'hjenkins@luc.edu', 'test1234');

DROP TABLE IF EXISTS Song;
CREATE TABLE Song (
    SongID int NOT NULL,
    Name varchar(30),
    SongLengthSeconds int,
    AlbumID int,
    GenreID int,
    ArtistID int NOT NULL,
    Link varchar(75)
    PRIMARY KEY (SongID);
);

INSERT INTO Song VALUES ('Female', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song VALUES ('Banana Pancakes', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song VALUES ('Feel it Still', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song VALUES ('Remember You', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song VALUES ('Attention', '180', '1', '1', '1', 'www.spotifyapi.com');
INSERT INTO Song VALUES ('A Song to Sing', '180', '1', '1', '1', 'www.spotifyapi.com');

DROP TABLE IF EXISTS PlayList;
CREATE TABLE PlayList(
    PlayListID int NOT NULL,
    PlayListName varchar(30),
    UserID int NOT NULL,
    PRIMARY KEY (PlayListID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

INSERT INTO PlayList VALUES ('Happy', '1';)
INSERT INTO PlayList VALUES ('Chill', '2';
INSERT INTO PlayList VALUES ('Workout', '3';
INSERT INTO PlayList VALUES ('Sad', '4';
INSERT INTO PlayList VALUES ('Dance', '5';

DROP TABLE IF EXISTS PlayListSongs;
CREATE TABLE PlayListSongs(
    PlayListID int NOT NULL,
    UserID int NOT NULL,
    SongID int NOT NULL
);

INSERT INTO PlayListSongs VALUES ('1', '1', '3');
INSERT INTO PlayListSongs VALUES ('1', '1', '1');
INSERT INTO PlayListSongs VALUES ('1', '1', '2');

INSERT INTO PlayListSongs VALUES ('2', '2', '3');
INSERT INTO PlayListSongs VALUES ('2', '1', '1');
INSERT INTO PlayListSongs VALUES ('2', '1', '2');

INSERT INTO PlayListSongs VALUES ('3', '3', '3');
INSERT INTO PlayListSongs VALUES ('3', '1', '1');
INSERT INTO PlayListSongs VALUES ('3', '3', '2');

DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre(
    GenreID int NOT NULL,
    Name varchar(15)
    PRIMARY KEY (GenreID)
);

INSERT INTO Genre VALUES ('Rock');
INSERT INTO Genre VALUES ('Country');
INSERT INTO Genre VALUES ('Pop');
INSERT INTO Genre VALUES ('Hip-Hop');
INSERT INTO Genre VALUES ('Folk');


DROP TABLE IF EXISTS Album;
CREATE TABLE Album(
    AlbumID int NOT NULL,
    AlbumName varchar(30),
    ReleaseDate varchar(15),
    TotalTracks int,
    GenreID int NOT NULL,
    PRIMARY KEY (AlbumID),
    FOREIGN KEY (GenreID) REFERENCES Genre(GenreID)
);

INSERT INTO Album VALUES ('These Things Happen', '10/10/2010', 12, 4);
INSERT INTO Album VALUES ('Attention', '09/12/2017', 12, 5);
INSERT INTO Album VALUES ('In Between Dreams', '05/27/2015', 12, 2);
INSERT INTO Album VALUES ('Feel It Still', '11/16/2016', 12, 3);
INSERT INTO Album VALUES ('A Song To Sing', '03/30/2017', 12, 5);

