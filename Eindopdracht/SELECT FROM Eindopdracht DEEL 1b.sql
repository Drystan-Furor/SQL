use Werknemer;

-- 1. Geef de namen van de werknemers die op locatie Chicago werken. (Zoek niet zelf het afdelingsnummer op)
SELECT wnaam
FROM Werknemer, Afdeling
WHERE Afdeling.locatie = 'Chicago';

-- 2. Geef van alle werknemers de naam, de functie en de salarisschaal.
SELECT wnaam, functie, schaal
FROM Werknemer, S_schaal
WHERE salaris >= S_schaal.ondergrens
AND salaris <= S_schaal.bovengrens;


-- 3. Geef de naam van de verkopers die in salarisschaal 3 zitten.
SELECT Prive.voorletter, Werknemer.wnaam, schaal
FROM Prive, Werknemer, S_schaal
WHERE schaal = 3
AND Werknemer.wnr = Prive.wnr;

-- 4. Geef van alle werknemers de naam, de woonplaats en de locatie waar ze werken.
SELECT Prive.voorletter, Werknemer.wnaam, woonplaats, locatie
FROM Werknemer
INNER JOIN Prive
ON Werknemer.wnr = Prive.wnr
INNER JOIN Afdeling
ON Werknemer.anr = Afdeling.anr;


-- 5. Welke werknemers werken niet in de plaats waar ze wonen? (Tip: gebruik UPPER)
SELECT Prive.voorletter, Werknemer.wnaam, woonplaats, locatie
FROM Werknemer 
INNER JOIN Prive
ON Werknemer.wnr = Prive.wnr
INNER JOIN Afdeling
ON UPPER(woonplaats) = UPPER(locatie);


/*
Voordat je de volgende opgaven gaat maken moet je het volgende statement in de Workbench
plaatsen en uitvoeren: SET sql_mode=’ONLY_FULL_GROUP_BY’;
*/
-- Health en Safety Coördinator bij UPS. Audits

SET sql_mode=’ONLY_FULL_GROUP_BY’;
-- Error Code: 1231. Variable 'sql_mode' can't be set to the value of '’ONLY_FULL_GROUP_BY’'
SET sql_mode = 'ONLY_FULL_GROUP_BY';
-- https://stackoverflow.com/questions/23921117/disable-only-full-group-by
-- kennelijk spatie gevoelig

-- 6. Welke afdelingen hebben een gemiddeld salaris van meer dan 2000?
SELECT anaam
FROM Afdeling
INNER JOIN Werknemer
ON  Werknemer.anr = Afdeling.anr
GROUP BY anaam
HAVING AVG(Werknemer.salaris) > 2000;

-- 7. Geef alle functies die door minstens drie werknemers wordt uitgeoefend.
SELECT functie
FROM Werknemer
GROUP BY functie
HAVING COUNT(functie) >= 3;


-- 8. In welke plaatsen wonen meer dan één werknemer?
SELECT woonplaats
FROM Prive
INNER JOIN Afdeling
ON  UPPER(Prive.woonplaats) = UPPER(Afdeling.locatie)
GROUP BY woonplaats
HAVING  COUNT(UPPER(Prive.woonplaats) = UPPER(Afdeling.locatie)) > 1;


-- 9. In welke afdelingen wordt met commissies gewerkt?
SELECT anaam
FROM Afdeling
INNER JOIN Werknemer
ON Werknemer.anr = Afdeling.anr
WHERE Werknemer.commissie IS NOT NULL
GROUP BY anaam;

-- 10. Geef van alle werknemers die chef [functie MANAGER?] zijn het aantal werknemers waar ze chef van zijn.
SELECT *
FROM Werknemer
WHERE anr = 30;



-- SUM(aantal werknemers) per uq anr
-- where
-- != president + != manager == ANALIST, BOEKHOUDER, VERKOPER
-- afdeling heeft een chef? afdeling 10, 20, 30,
-- WHERE manager anr = anr is binnen werknemer
-- 1 locatie = 1 manager, dus werknemers tellen per locatie -1?


-- 10. Geef van alle werknemers die chef [functie MANAGER?] zijn 
-- WHERE functie = MANAGER

-- het aantal werknemers waar ze chef van zijn.
-- WHERE anr = 10

SELECT wnaam AS 'Naam',
	functie AS 'Rol',
	(
		SELECT COUNT(anr) AS 'Werknemers'
		FROM Werknemer
		WHERE functie <> 'MANAGER'
		AND functie <> 'PRESIDENT'
        AND anr = 10
        ORDER BY anr ASC
	) AS 'van hoeveel medewerkers'
FROM Werknemer
WHERE functie = "MANAGER"
AND anr = 10
GROUP BY anr
UNION
SELECT wnaam AS 'Naam',
	functie AS 'Rol',
	(
		SELECT COUNT(anr) AS 'Werknemers'
		FROM Werknemer
		WHERE functie <> 'MANAGER'
		AND functie <> 'PRESIDENT'
        AND anr = 20
        ORDER BY anr ASC
	) AS 'van hoeveel medewerkers'
FROM Werknemer
WHERE functie = "MANAGER"
AND anr = 20
GROUP BY anr
UNION
SELECT wnaam AS 'Naam',
	functie AS 'Rol',
	(
		SELECT COUNT(anr) AS 'Werknemers'
		FROM Werknemer
		WHERE functie <> 'MANAGER'
		AND functie <> 'PRESIDENT'
        AND anr = 30
        ORDER BY anr ASC
	) AS 'van hoeveel medewerkers'
FROM Werknemer
WHERE functie = "MANAGER"
AND anr = 30
GROUP BY anr;

-- SET sql_mode = '';
