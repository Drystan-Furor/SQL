USE `bakkerij` ;

-- 1 welke klanten uit wleke steden bestellen wat, waar bezorgd, en waar factuur??
SELECT Voornaam, 
	Achternaam, 
    Woonplaats, 
    Artikel_Naam AS 'Besteld Product',
    Factuur_Adres AS 'Factuur adres',
    Factuur_Plaatsnaam AS 'Factuur stad',
    Bezorg_Adres AS 'Bezorg Adres',
    Bezorg_Plaatsnaam 'Bezorg Stad'
FROM Klant
INNER JOIN Factuur
ON Klant.idKlant = Factuur.idKlant
INNER JOIN Bestelling
ON Klant.idKlant = Bestelling.idKlant
INNER JOIN Artikel
ON Bestelling.idArtikel = Artikel.idArtikel
;


-- 2 hoeveel klanten bestellen slagroom taart en hoe vaak?
SELECT COUNT(DISTINCT idKlant) AS 'Aantal klanten die Slagroomtaart bestellen',
    (
    SELECT SUM(Artikel_aantal)
    FROM Bestelling
    WHERE Bestelling.idArtikel = 2
    ) AS 'Bestelde aantal'
FROM Bestelling
WHERE idArtikel = 2
;

-- 3 hoeveel bonbons zijn er in totaal besteld, en hoeveel omzet geeft dat?
SELECT SUM(Artikel_aantal) AS 'Besteld aantal Bonbons',
  (
  SELECT (SUM(Artikel_aantal)) * (Artikel_Prijs)
  FROM Bestelling, Artikel
  WHERE Artikel.idArtikel = Bestelling.idArtikel
  AND Artikel.idArtikel = 6
  )  AS 'omzet'
FROM Bestelling
INNER JOIN Artikel
ON Artikel.idArtikel = Bestelling.idArtikel
WHERE Bestelling.idArtikel = 6 
;
