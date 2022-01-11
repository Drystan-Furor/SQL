USE speelautomaatdb ;

-- het meest unieke noem je als eerste [hier is dat dus opbrengst / id.Opbrengst]

SELECT afkorting, naam_bedrijf, idAutomaat, typeATM, datum, opbrengst, afkorting_medewerker, naam_medewerker
FROM Bedrijf, Automaat, Opbrengst, Medewerker 
WHERE (Bedrijf.idBedrijf = Opbrengst.idBedrijf) 
AND (Medewerker.idMedewerker = Opbrengst.idMedewerker)
AND (Automaat.idBedrijf = Bedrijf.idBedrijf);



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
	Bedrijf.idBedrijf, idAutomaat, datum
order by 
	Bedrijf.idBedrijf;


SELECT
	afkorting AS 'code zaak', 
	naam_bedrijf AS 'naam zaak',
	idAutomaat AS 'nr automaat', 
	typeATM AS 'soort automaat'
    FROM Bedrijf, Automaat
WHERE
	(Automaat.idBedrijf = Bedrijf.idBedrijf)
ORDER BY Bedrijf.idBedrijf;





SELECT DISTINCT 
naam_bedrijf, afkorting,
datum, opbrengst, naam_medewerker
FROM Opbrengst
INNER JOIN Medewerker
ON Medewerker.idMedewerker = Opbrengst.idMedewerker
INNER JOIN Bedrijf
ON Opbrengst.idBedrijf = Bedrijf.idBedrijf
ORDER BY idCodeOpbrengst;