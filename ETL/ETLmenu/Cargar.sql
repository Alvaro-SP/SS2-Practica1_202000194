USE [Practica]
GO
INSERT INTO Dates (years, months, days, hours, minutes, seconds)
(				  
	SELECT DISTINCT TEMPORAL.years, TEMPORAL.months, TEMPORAL.days,TEMPORAL.hours, TEMPORAL.minutes, TEMPORAL.seconds
	FROM TEMPORAL
)
GO
INSERT INTO Country (name)
(
	SELECT DISTINCT TEMPORAL.country
	FROM TEMPORAL
)
INSERT INTO Location_Name (name)
(
	SELECT DISTINCT TEMPORAL.location_name
	FROM TEMPORAL
)

INSERT INTO Tsunami (event_validity, cause_code, magnitude_earthquake, deposits,latitud,longtitude,height_water,runups,magnitude_lida,intensity)
(
	SELECT DISTINCT event_validity, cause_code, magnitude_earthquake, deposits,latitude, longitude,height_water,runups,magnitude_lida,intensity
	FROM TEMPORAL
)
GO
INSERT INTO History (idTsunami, idCountry, idLocation, idDates, total_deaths, total_missing, total_missing_desc, total_injuries, total_damage, total_damage_desc, total_house_destroy, total_house_damage)
SELECT Tsunami.idTsunami, Country.idCountry, Location_Name.idLocation_name, Dates.idDates,
       TEMPORAL.total_deaths, TEMPORAL.total_missing, TEMPORAL.total_missing_desc, TEMPORAL.total_injuries, TEMPORAL.total_damage, TEMPORAL.total_damage_desc, TEMPORAL.total_house_destroyed, TEMPORAL.total_house_damaged
FROM TEMPORAL
JOIN Country ON TEMPORAL.country = Country.name
JOIN Dates ON TEMPORAL.years = Dates.years AND TEMPORAL.months = Dates.months AND TEMPORAL.days = Dates.days AND TEMPORAL.hours = Dates.hours AND TEMPORAL.minutes = Dates.minutes AND TEMPORAL.seconds = Dates.seconds
JOIN Location_Name ON TEMPORAL.location_name = Location_Name.name
JOIN Tsunami ON TEMPORAL.event_validity = Tsunami.event_validity AND TEMPORAL.cause_code = Tsunami.cause_code AND TEMPORAL.magnitude_earthquake = Tsunami.magnitude_earthquake AND TEMPORAL.deposits = Tsunami.deposits AND TEMPORAL.latitude = Tsunami.latitud AND TEMPORAL.longitude = Tsunami.longtitude AND TEMPORAL.height_water = Tsunami.height_water AND TEMPORAL.runups = Tsunami.runups AND TEMPORAL.magnitude_lida = Tsunami.magnitude_lida AND TEMPORAL.intensity = Tsunami.intensity;

GO