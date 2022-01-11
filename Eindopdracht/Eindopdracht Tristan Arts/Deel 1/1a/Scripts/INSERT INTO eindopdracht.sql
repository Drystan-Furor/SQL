use speelautomaatdb;

-- insert Bedrijf
INSERT INTO Bedrijf (idBedrijf, naam_bedrijf, afkorting) 
VALUES 
(1, 'Coffeeshop de Engel', 'CE'),
(2, 'Snackbar Vork', 'SV'),
(3, 'Kantine BV WSE', 'WSE'),
(4, 'Zwembad de Snip', 'ZS');


-- insert Medewerker 
INSERT INTO Medewerker (idMedewerker, naam_medewerker, afkorting_medewerker)
VALUES
(1, 'Jan Hein', 'JHE'),
(2, 'Klaas Jansen', 'KJA'),
(3, 'Johan Bakker', 'JBA');


-- insert Automaat
INSERT INTO Automaat (idAutomaat, typeATM, idBedrijf)
VALUES
(21, 'F1_Racer', 1),
(23, 'Mega Crusher', 1),
(34, 'Photoplay', 1),

(22, 'F1 Racer', 2),
(37, 'Mega Crusher', 2),

(35, 'Photoplay', 3),

(36, 'Mega Crusher', 4),
(18, 'F1 Racer', 4);


-- insert opbrengst
INSERT INTO Opbrengst (idCodeOpbrengst, datum, idMedewerker, opbrengst, idBedrijf)
VALUES
(1, '2011-01-11', 1, 1542, 1),
(2, '2011-02-11', 2, 1653, 1),
(3, '2011-03-11', 1, 1482, 1),
(4, '2011-04-11', 3, 2018, 1),
(5, '2011-05-11', 2, 1503, 1),

(6, '2011-05-12', 2, 2035, 2),
-- datum als jaar maand dag
(7, '2011-03-01', 2, 837, 3),
(8, '2011-06-02', 2, 912, 3),
(9, '2011-09-01', 1, 799, 3),

(10, '2011-04-11', 3, 1387, 4);

