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

DROP TABLE IF EXISTS Song;
CREATE TABLE Song (
    SongID int NOT NULL,
    SongLengthSeconds int,
    AlbumID int,
    GenreID int,
    ArtistID int NOT NULL,
    Link varchar(75)
    PRIMARY KEY (SongID);
);

DROP TABLE IF EXISTS PlayList;
CREATE TABLE PlayList(
    PlayListID int NOT NULL,
    PlayListName varchar(30),
    UserID int NOT NULL,
    PRIMARY KEY (PlayListID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

DROP TABLE IF EXISTS PlayListSongs;
CREATE TABLE PlayListSongs(
    PlayListID int NOT NULL,
    UserID int NOT NULL,
    SongID int NOT NULL,
    PRIMARY KEY (PlayListID, UserID)
);

DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre(
    GenreID int NOT NULL,
    Name varchar(15)
    PRIMARY KEY (GenreID)
);

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