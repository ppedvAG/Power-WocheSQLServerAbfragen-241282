/*

	Datentypen in SQL: 3 Große Gruppen



	1. Charakter/String Datentypen
	char(10)	= 'Hallo     ' = 10 Byte Speicherplatz
	nchar(10)	= 1 Char = 2 Byte = Verwendet UTF-16 = 20 Byte Speicherplatz

	varchar(10) = 'Hallo' = 5 Byte Speicherplatz
	nvarchar(10) = 1 Char = 2 Byte = Verwendet UTF-16 = 10 Byte Speicherplatz

	legacy: text --> VARCHAR(MAX) = bis zu 2GB groß
	varchar(8000) & nvarchar(4000) sind maximum



	2. Numerischen Datentypen
	tinyint = 8 Bit = 1 Byte = bis 255
	smallint = 16 Bit = 2 Byte = 32k
	int = 32 Bit = 4 Byte = 2,14Mrd
	bigint = 64 Bit = 8 Byte = 9,2 Trillion

	double => Nachkommastellenzahlen
	float

	bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool!

	decimal(x, y) x Ziffern insgesamt, davon sind y Nachkommastellen
	decimal(10, 2) 10 Ziffern insgesamt, davon 2 Nachkommastellen
	money = 9,2 Trillion
	smallmoney = ca. 214K



	3. Datum/Zeit Datentypen:
	time = hh:mm:ss.nnnnnnn
	Bereich: 00:00:00.0000000 bis 23:59:59:9999999

	date = YYYY-MM-DD 
	Bereich: 0001-01-01 bis 9999-12-31

	datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
	Datumsbereich: 1753-01-01 bis 9999-12-31 
	Zeitbereich: 00:00:00.000 bis 23:59:59.997

	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnn
	Datumsbereich: 0001-01-01 bis 9999-12-31
	Zeitbereich: 00:00:00 bis 23:59:590,9999999

	smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss
	Datumsbereich: 1900-01-01 bis 2079-06-06
	Zeitbereich: 00:00:00 bis 23:59:59



	Andere:
	XML
	JSON
	geometry
	geography
*/