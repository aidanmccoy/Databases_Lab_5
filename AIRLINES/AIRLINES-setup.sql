-- aimccoy

CREATE TABLE Airlines (
	Id INTEGER NOT NULL PRIMARY KEY,
	Airline VARCHAR(22),
	Abbreviation VARCHAR(13),
	Country VARCHAR(5)
);

CREATE TABLE Airports (
	City VARCHAR(22),
	AirportCode VARCHAR(6) NOT NULL PRIMARY KEY,
	AirportName VARCHAR(50),
	Country VARCHAR(16),
	CountryAbbrev VARCHAR(5),
	UNIQUE (AirportCode)
);

CREATE TABLE Flights (
	Airline INTEGER NOT NULL,
	FlightNo INTEGER,
	SourceAirport VARCHAR(6) NOT NULL,
	DestAirport VARCHAR(6),
	FOREIGN KEY (Airline) REFERENCES Airlines (Id),
	FOREIGN KEY (SourceAirport) REFERENCES Airports (AirportCode), 
	FOREIGN KEY (DestAirport) REFERENCES Airports (AirportCode),
	PRIMARY KEY (FlightNo, SourceAirport, DestAirport)
);
