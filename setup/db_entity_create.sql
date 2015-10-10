﻿CREATE TABLE Users
(
ID int PRIMARY KEY,
LastName varchar(255),
FirstName varchar(255) UNIQUE NOT NULL
);

CREATE TABLE AddressType
(
ID int PRIMARY KEY,
Lable varchar(255) UNIQUE NOT NULL
);

CREATE TABLE Address
(
UID int REFERENCES Users(ID) ON DELETE RESTRICT,
AID int REFERENCES AddressType(ID) ON DELETE RESTRICT,
HouseNo varchar(255),
Street varchar(255),
City varchar(255),
State varchar(255),
Country varchar(255),
Pin varchar(255) UNIQUE NOT NULL,
AreaCode varchar(255) UNIQUE NOT NULL,
PRIMARY KEY(UID, AID)
);

CREATE TABLE Service
(
ID int PRIMARY KEY,
Name varchar(255) UNIQUE NOT NULL,
Key varchar(255) UNIQUE NOT NULL,
Category varchar(255)
);

CREATE TABLE ServiceProvider
(
UID int,
SID int,
PRIMARY KEY(UID, SID)
);

CREATE TABLE Orders
(
UID int REFERENCES Users(ID),
SID int REFERENCES Service(ID) ON DELETE RESTRICT,
WhenTo TIMESTAMP WITH TIME ZONE,
WhenFrom TIMESTAMP WITH TIME ZONE,
address varchar(255)
);