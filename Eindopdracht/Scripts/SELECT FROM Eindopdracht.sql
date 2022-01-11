USE speelautomaatdb ;
-- QUERY met alle gewenste waardes per Eindopdracht.pdf
/* veel dubbele velden 22 regels */
SELECT 
	afkorting AS 'code zaak', 
	naam_bedrijf AS 'naam zaak', 
    idAutomaat AS 'nr automaat',
    typeATM AS 'soort automaat',
	datum AS 'datum opbrengst', 
	opbrengst AS 'bedrag opbrengst', 
	afkorting_medewerker AS 'code medewerker', 
	naam_medewerker AS 'naam medewerker'    
FROM 
	Opbrengst
INNER JOIN Bedrijf
ON (Opbrengst.idBedrijf = Bedrijf.idBedrijf )
INNER JOIN Automaat
ON (Automaat.idBedrijf = Bedrijf.idBedrijf)
INNER JOIN Medewerker
ON (Medewerker.idMedewerker = Opbrengst.idMedewerker)
group by 
	Bedrijf.idBedrijf, datum, typeATM
order by 
	idCodeOpbrengst;
-- ------------------------------------------------------------

/* QUERY eindresultaat*/
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
	CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
    CASE WHEN ROW_ATM = 1 THEN idAutomaat ELSE '' END 'nr automaat',
    CASE WHEN ROW_ATM = 1 THEN typeATM ELSE '' END 'soort automaat',
    CASE WHEN ROW_datum_opbrengst = 1 THEN datum ELSE '' END 'datum',
    CASE WHEN ROW_datum_opbrengst = 1 THEN opbrengst ELSE '' END 'opbrengst',
    CASE WHEN ROW_datum_opbrengst = 1 THEN afkorting_medewerker ELSE '' END 'afkorting_medewerker',
    CASE WHEN ROW_datum_opbrengst = 1 THEN naam_medewerker ELSE '' END 'naam_medewerker'
 FROM 
	(
	SELECT afkorting, naam_bedrijf, idAutomaat, typeATM, datum, opbrengst, afkorting_medewerker, naam_medewerker,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY Bedrijf.idBedrijf ASC) AS ROW_NUM,
    ROW_NUMBER() OVER(PARTITION BY idAutomaat, typeATM) AS ROW_ATM,
    ROW_NUMBER() OVER(PARTITION BY datum, opbrengst, afkorting_medewerker, naam_medewerker) AS ROW_datum_opbrengst
		FROM Automaat
		INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Opbrengst ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Medewerker ON Medewerker.idMedewerker = Opbrengst.idMedewerker
    )X
ORDER BY afkorting, naam_bedrijf, row_num;
-- ------------------------------------------------------------
/* DOC vervolgt met stapsgewijze werk methode */


-- QUERY met Bedrijf, datum, opbrengst, 10 regels
SELECT 
	afkorting AS 'code zaak', 
	naam_bedrijf AS 'naam zaak', 
	datum AS 'datum opbrengst', 
	opbrengst AS 'bedrag opbrengst'
FROM Opbrengst
INNER JOIN Bedrijf
ON (Opbrengst.idBedrijf = Bedrijf.idBedrijf )
order by 
	idCodeOpbrengst;
-- ------------------------------------------------------------


-- QUERY met TOEGEVOEGD medewerkers 10 regels
SELECT 
	afkorting AS 'code zaak', 
	naam_bedrijf AS 'naam zaak', 
	datum AS 'datum opbrengst', 
	opbrengst AS 'bedrag opbrengst',
	afkorting_medewerker AS 'code medewerker', 
	naam_medewerker AS 'naam medewerker'    
FROM Opbrengst
INNER JOIN Bedrijf
ON (Opbrengst.idBedrijf = Bedrijf.idBedrijf )
INNER JOIN Medewerker
ON (Medewerker.idMedewerker = Opbrengst.idMedewerker)
order by 
	idCodeOpbrengst;
-- ------------------------------------------------------------



-- QUERY herhalende waarden vereenvoudigen, 10 regels
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
 CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
 datum,
 opbrengst ,
afkorting_medewerker,
naam_medewerker,
 row_num 
 FROM
	(
	SELECT afkorting, naam_bedrijf, datum, opbrengst, naam_medewerker,afkorting_medewerker,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY idCodeOpbrengst DESC) AS ROW_NUM  
    FROM Opbrengst
    INNER JOIN Medewerker ON Medewerker.idMedewerker = Opbrengst.idMedewerker
	INNER JOIN Bedrijf ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
    )X
ORDER BY afkorting, naam_bedrijf, row_num;

-- ------------------------------------------------------------



-- QUERY welke bedrijf heeft automaat? 8 regels
SELECT afkorting AS 'code zaak', naam_bedrijf AS 'naam zaak',
	idAutomaat AS 'nr automaat', typeATM AS 'soort automaat'
FROM Automaat
INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf;
-- ------------------------------------------------------------
-- QUERY welke bedrijf heeft automaat?
-- Verminder herhalende waardes 8 regels
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
 CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
idAutomaat AS 'nr automaat', typeATM AS 'soort automaat',
 row_num 
 FROM
	(
	SELECT afkorting, naam_bedrijf, idAutomaat, typeATM,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY Bedrijf.idBedrijf ASC) AS ROW_NUM  
		FROM Automaat
		INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf
    )X
ORDER BY afkorting, naam_bedrijf, row_num;
-- ------------------------------------------------------------



-- ------------voeg datum/opbrengst toe
/* automaat wordt herhalende waarde 22 regels*/
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
	CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
idAutomaat AS 'nr automaat', typeATM AS 'soort automaat',
	datum AS 'datum',
	opbrengst AS 'opbrengst'
 FROM 
	(
	SELECT afkorting, naam_bedrijf, idAutomaat, typeATM, datum, opbrengst,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY Bedrijf.idBedrijf ASC) AS ROW_NUM  
		FROM Automaat
		INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Opbrengst ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
    )X
ORDER BY afkorting, naam_bedrijf, row_num;

-- -----------------------------------------------------------

/* automaat wordt herhalende waarde 22 regels
herhaling omdat datum en opbrengst toegevoegd worden
verminder herhalende waardes nogmaals*/
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
	CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
    CASE WHEN ROW_ATM = 1 THEN idAutomaat ELSE '' END 'nr automaat',
    CASE WHEN ROW_ATM = 1 THEN typeATM ELSE '' END 'soort automaat',
    CASE WHEN ROW_datum_opbrengst = 1 THEN datum ELSE '' END 'datum',
    CASE WHEN ROW_datum_opbrengst = 1 THEN opbrengst ELSE '' END 'opbrengst'
 FROM 
	(
	SELECT afkorting, naam_bedrijf, idAutomaat, typeATM, datum, opbrengst,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY Bedrijf.idBedrijf ASC) AS ROW_NUM,
    ROW_NUMBER() OVER(PARTITION BY idAutomaat, typeATM) AS ROW_ATM,
    ROW_NUMBER() OVER(PARTITION BY datum, opbrengst) AS ROW_datum_opbrengst
		FROM Automaat
		INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Opbrengst ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
    )X
ORDER BY afkorting, naam_bedrijf, row_num;


-- ---------------------------------------------------
-- MEDEWERKERS toevoegen
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
	CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
    CASE WHEN ROW_ATM = 1 THEN idAutomaat ELSE '' END 'nr automaat',
    CASE WHEN ROW_ATM = 1 THEN typeATM ELSE '' END 'soort automaat',
    CASE WHEN ROW_datum_opbrengst = 1 THEN datum ELSE '' END 'datum',
    CASE WHEN ROW_datum_opbrengst = 1 THEN opbrengst ELSE '' END 'opbrengst',
	afkorting_medewerker AS 'code medewerker', 
	naam_medewerker AS 'naam medewerker'    
 FROM 
	(
	SELECT afkorting, naam_bedrijf, idAutomaat, typeATM, datum, opbrengst, afkorting_medewerker, naam_medewerker,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY Bedrijf.idBedrijf ASC) AS ROW_NUM,
    ROW_NUMBER() OVER(PARTITION BY idAutomaat, typeATM) AS ROW_ATM,
    ROW_NUMBER() OVER(PARTITION BY datum, opbrengst) AS ROW_datum_opbrengst
		FROM Automaat
		INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Opbrengst ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Medewerker ON Medewerker.idMedewerker = Opbrengst.idMedewerker
    )X
ORDER BY afkorting, naam_bedrijf, row_num;


-- ---------------------------------------------------
-- MEDEWERKERS toevoegen
SELECT CASE WHEN ROW_NUM = 1 THEN afkorting ELSE '' END 'code zaak',
	CASE WHEN ROW_NUM = 1 THEN naam_bedrijf ELSE '' END 'naam zaak',
    CASE WHEN ROW_ATM = 1 THEN idAutomaat ELSE '' END 'nr automaat',
    CASE WHEN ROW_ATM = 1 THEN typeATM ELSE '' END 'soort automaat',
    CASE WHEN ROW_datum_opbrengst = 1 THEN datum ELSE '' END 'datum',
    CASE WHEN ROW_datum_opbrengst = 1 THEN opbrengst ELSE '' END 'opbrengst',
    CASE WHEN ROW_datum_opbrengst = 1 THEN afkorting_medewerker ELSE '' END 'afkorting_medewerker',
    CASE WHEN ROW_datum_opbrengst = 1 THEN naam_medewerker ELSE '' END 'naam_medewerker'
 FROM 
	(
	SELECT afkorting, naam_bedrijf, idAutomaat, typeATM, datum, opbrengst, afkorting_medewerker, naam_medewerker,
    ROW_NUMBER() OVER(PARTITION BY afkorting, naam_bedrijf ORDER BY Bedrijf.idBedrijf ASC) AS ROW_NUM,
    ROW_NUMBER() OVER(PARTITION BY idAutomaat, typeATM) AS ROW_ATM,
    ROW_NUMBER() OVER(PARTITION BY datum, opbrengst, afkorting_medewerker, naam_medewerker) AS ROW_datum_opbrengst
		FROM Automaat
		INNER JOIN Bedrijf ON Automaat.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Opbrengst ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
        INNER JOIN Medewerker ON Medewerker.idMedewerker = Opbrengst.idMedewerker
    )X
ORDER BY afkorting, naam_bedrijf, row_num;