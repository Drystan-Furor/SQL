-- MySQL INSERT Script by Tristan Arts
-- Sat Nov  6 11:56:55 2021
-- Model: New Model    Version: 1.0

-- -----------------------------------------------------
-- Schema bakkerij
-- -----------------------------------------------------
USE `bakkerij` ;

-- -----------------------------------------------------
-- Table `bakkerij`.`Klant`
-- -----------------------------------------------------
-- insert Klant
INSERT INTO Klant (idKlant, Voornaam, Achternaam, Adres, Postcode, Woonplaats, Telefoonnummer, email) 
VALUES 
(0, 'Peter', 'Parker', 'Spinstraat 1939', '1122AB', 'New York', '06-22103579', 'spiderman@mail.hero'),
(0, 'Tessele', 'Evenwood', 'Chondathan 33', '1234AA', 'Faerûn', '06-23899570', 'InnerSea@mail.rng'),
(0, 'Nhildin', 'Vedalkan', 'Spinstraat 62', '3241BC', 'Sieganhilda', '06-37558911', ''),
(0, '', 'Holg', 'Halforclane', '4872GH', 'Himdall Hord', '', 'barbarian@mail.rng'),
(0, 'Iryn', 'Guhmanzath', 'Tritonstraat 50', '2142JK', 'Sieganhilda', '06-42341929', 'aquatic@mail.hero'),
(0, 'Einkill', 'Ungart', 'Spinstraat 1939', '1122AC', 'Dwarvencave', '06-11544498', ''),

(0, 'Doduh ', 'Parker', 'Zorgar 24', '1289AB', 'Exandria', '06-17136855', 'VulgarBaron@mail.rng'),
(0, 'Jocasta', 'Satyr', 'Amethyst 42', '1822LB', 'Sieganhilda', '06-80142987', 'atsacoj@mail.rng'),
(0, 'Varra', 'Turnskull', 'Jacinth 48', '3241RN', 'Exandria', '06-12060277', 'ExandriaUnlimited@mail.hero'),
(0, 'Gurdis', 'Frostbeard', 'Coral 1939', '9122JK', 'Faerûn', '06-28016321', 'cleric4life@mail.hero'),
(0, 'Castor', 'Satyr', 'Warlock 420', '1122AB', 'Faerûn', '', 'WarlockBestClass@mail.hero'),
(0, 'Amnon', 'Weary', 'Quartz 32', '1626PR', 'Sieganhilda', '06-75687316', 'Tiefling@mail.hero'),
(0, 'Oesvin', 'Vigilpelt', 'Quartz 34', '3655FD', 'Himdall Hord', '06-62240304', '');

-- -----------------------------------------------------
-- Table `bakkerij`.`Artikel`
-- -----------------------------------------------------
INSERT INTO Artikel (idArtikel, Artikel_Naam, Artikel_Prijs)
VALUES 
(0, 'Luxe Fruitvlaai', 9.50),
(0, 'Slagroomtaart', 12.50),
(0, 'Hartige vlaai', 6.50),
(0, 'Koffie', 2.20),
(0, 'Thee', 1.80),
(0, 'Leonidas Bon Bon', 0.90);

-- -----------------------------------------------------
-- Table `bakkerij`.`Factuur`
-- -----------------------------------------------------
INSERT INTO Factuur (idFactuur, Factuur_Adres, Factuur_Postcode, Factuur_Plaatsnaam, idKlant)
VALUES 
(0, 'Spinstraat 1939', '1122AB', 'New York', 1), -- thuis
(0, 'Spinstraat 1939', '1122AB', 'New York', 1), -- thuis
(0, 'Spinstraat 1939', '1122AB', 'New York', 1), -- thuis
(0, 'Spinstraat 1939', '1122AB', 'New York', 1), -- sportclub
(0, 'Spinstraat 1939', '1122AB', 'New York', 1), -- sportclub
(0, 'Sardonyx 33', '5922AC', 'New York', 1), -- werk
(0, 'Sardonyx 33', '5922AC', 'New York', 1), -- werk

(0, 'Chondathan 33', '1234AA', 'Faerûn', 2), -- thuis
(0, 'Chondathan 33', '1234AA', 'Faerûn', 2), -- thuis
(0, 'Chondathan 33', '1234AA', 'Faerûn', 2), -- thuis

(0, 'Coral 19', '3841HF', 'Faerûn', 3), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 3), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 3), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 3), -- werk

(0, 'Halforclane', '4872GH', 'Himdall Hord', 4), -- thuis

(0, 'Tritonstraat 50', '2142JK', 'Sieganhilda', 5), -- vriend 5 stuurt naar 6, factuur thuis
(0, 'Spinstraat 1939', '1122AC', 'Dwarvencave', 6), -- vriend 6 stuurt naar 5, factuur thuis
(0, 'Spinstraat 1939', '1122AC', 'Dwarvencave', 6), -- vriend
(0, 'Zorgar 24', '1289AB', 'Exandria', 5), -- werk

(0, 'Zorgar 24', '1289AB', 'Exandria', 7), -- werk
(0, 'Zorgar 24', '1289AB', 'Exandria', 7), -- werk

(0, 'Zorgar 24', '1289AB', 'Exandria', 7), -- gift
(0, 'Zorgar 24', '1289AB', 'Exandria', 7), -- gift
(0, 'Zorgar 24', '1289AB', 'Exandria', 7), -- gift
(0, 'Zorgar 24', '1289AB', 'Exandria', 7), -- gift

(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 8),  -- thuis
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 8),  -- thuis
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 8),  -- thuis

(0, 'Turqoise 18', '6598TA', 'Exandria', 9), -- werk
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 9), -- club - kantine
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 9), -- club - kantine
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 9), -- club - kantine

(0, 'Coral 1939', '9122JK', 'Faerûn', 10), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 10), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 10), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 10), -- thuis
(0, 'Turqoise 18', '6598TA', 'Exandria', 10), -- werk
(0, 'Turqoise 18', '6598TA', 'Exandria', 10), -- werk
(0, 'Turqoise 18', '6598TA', 'Exandria', 10), -- werk
(0, 'Emerald 9', '3122AC', 'New York', 10), -- sportclub - opendagen
(0, 'Emerald 9', '3122AC', 'New York', 10), -- sportclub - opendagen
(0, 'Coral 1939', '9122JK', 'Faerûn', 10),  -- vriend

(0, 'Warlock 420', '1122AB', 'Faerûn', 11), -- thuis

(0, 'Zircon 396', '4348PO', 'Sieganhilda', 12), -- werk

(0, 'Daecheraess  24', '6765FD', 'Himdall Hord', 13); -- werk

-- -----------------------------------------------------
-- Table `bakkerij`.`Bestelling`
-- -----------------------------------------------------
INSERT INTO Bestelling (idBestelling, Bezorg_Adres, Bezorg_Postcode, Bezorg_Plaatsnaam, idFactuur, idKlant, idArtikel, Artikel_aantal)
VALUES
 -- idFactuur, idKlant, idArtikel, Artikel_aantal,
(0, 'Spinstraat 1939', '1122AB', 'New York', 1, 1, 3, 1 ), -- hartige taart 1
(0, 'Spinstraat 1939', '1122AB', 'New York', 2, 1, 1, 1 ), -- luxe fruitvlaai 1

-- er komt visite thuis, 1 factuur 3 bestellingen
(0, 'Spinstraat 1939', '1122AB', 'New York', 3, 1, 2, 1 ),  -- slagroomtaart 1
(0, 'Spinstraat 1939', '1122AB', 'New York', 3, 1, 4, 5 ),  -- Koffie 4x
(0, 'Spinstraat 1939', '1122AB', 'New York', 3, 1, 5, 3 ),  -- Thee 3x

-- vlaai voor de club, factuur thuis, 2x
(0, 'Emerald 9', '3122AC', 'New York', 4, 1, 1, 2), -- sportclub
(0, 'Emerald 9', '3122AC', 'New York', 5, 1, 2, 1), -- sportclub

-- koffie / thee /bonbons op werk, factuur op werk 2x, 3 artikelen, 1 factuur -> ander adres
(0, 'Sardonyx 33', '5922AC', 'New York', 6, 1, 4, 8), -- werk
(0, 'Sardonyx 33', '5922AC', 'New York', 6, 1, 5, 8), -- werk
(0, 'Sardonyx 33', '5922AC', 'New York', 6, 1, 6, 32), -- werk
-- koffie / thee /bonbons op werk, factuur op werk
(0, 'Sardonyx 33', '5922AC', 'New York', 7, 1, 4, 8), -- werk
(0, 'Sardonyx 33', '5922AC', 'New York', 7, 1, 5, 8), -- werk
(0, 'Sardonyx 33', '5922AC', 'New York', 7, 1, 6, 32), -- werk
-- -------------------------------------------------------------------------- end spiderman
(0, 'Chondathan 33', '1234AA', 'Faerûn', 8, 2, 4, 2), -- thuis
(0, 'Chondathan 33', '1234AA', 'Faerûn', 8, 2, 3, 1), -- thuis

(0, 'Chondathan 33', '1234AA', 'Faerûn', 9, 2, 4, 2), -- thuis
(0, 'Chondathan 33', '1234AA', 'Faerûn', 9, 2, 3, 1), -- thuis

(0, 'Chondathan 33', '1234AA', 'Faerûn', 10, 2, 4, 2), -- thuis
(0, 'Chondathan 33', '1234AA', 'Faerûn', 10, 2, 3, 1), -- thuis
-- ---------------------------------------------------------------------------
(0, 'Coral 19', '3841HF', 'Faerûn', 11, 3, 1, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 11, 3, 2, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 11, 3, 4, 20), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 11, 3, 5, 20), -- werk

(0, 'Coral 19', '3841HF', 'Faerûn', 12, 3, 1, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 12, 3, 2, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 12, 3, 4, 20), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 12, 3, 5, 20), -- werk

(0, 'Coral 19', '3841HF', 'Faerûn', 13, 3, 1, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 13, 3, 2, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 13, 3, 4, 20), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 13, 3, 5, 20), -- werk

(0, 'Coral 19', '3841HF', 'Faerûn', 14, 3, 1, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 14, 3, 2, 2), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 14, 3, 4, 20), -- werk
(0, 'Coral 19', '3841HF', 'Faerûn', 14, 3, 5, 20), -- werk
-- ---------------------------------------------------------------------------
(0, 'Halforclane', '4872GH', 'Himdall Hord', 15, 4, 2, 1), -- thuis
-- ---------------------------------------------------------------------------
(0, 'Spinstraat 1939', '1122AC', 'Dwarvencave', 16, 5, 6, 20), -- vriend 5 stuurt BON BONS naar 6, factuur thuis

(0, 'Tritonstraat 50', '2142JK', 'Sieganhilda', 17, 6, 1, 1), -- vriend 6 stuurt TAART naar 5, factuur thuis
(0, 'Tritonstraat 50', '2142JK', 'Sieganhilda', 18, 6, 2, 1), -- vriend 6 stuurt TAART naar 5, factuur thuis

(0, 'Zorgar 24', '1289AB', 'Exandria', 19, 5, 2, 1), -- 5 besteld voor werk
-- ---------------------------------------------------------------------------
(0, 'Zorgar 24', '1289AB', 'Exandria', 20, 7, 2, 1), -- 7 besteld voor werk, zelfde werkplek als 5, zelfde taart wegens succes
(0, 'Zorgar 24', '1289AB', 'Exandria', 21, 7, 1, 1), -- 7 krijgt promotie, iedereen ANDERE taart
(0, 'Zorgar 24', '1289AB', 'Exandria', 21, 7, 4, 8), -- en een bakkie koffie (7 woont op werk, kantoor aan huis)
-- ---------------------------------------------------------------------------
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 22, 7, 6, 10),  -- gift
(0, 'Jacinth 48', '3241RN', 'Exandria', 23, 7, 6, 10), -- gift
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 24, 7, 6, 10),  -- gift
(0, 'Warlock 420', '1122AB', 'Faerûn', 25, 7, 6, 10), -- gift
-- ---------------------------------------------------------------------------
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 26, 8, 3, 1),  -- thuis
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 27, 8, 3, 1),  -- thuis
(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 28, 8, 3, 1),  -- thuis
-- ---------------------------------------------------------------------------
(0, 'Turqoise 18', '6598TA', 'Exandria', 29, 9, 2, 2), -- werk

(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 30, 9, 4, 10), -- club
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 30, 9, 5, 10), -- club
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 30, 9, 6, 50), -- club

(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 31, 9, 4, 10), -- club
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 31, 9, 5, 10), -- club
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 31, 9, 6, 50), -- club

(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 32, 9, 4, 10), -- club
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 32, 9, 5, 10), -- club
(0, 'Sapphire 51', '6796QA', 'Sieganhilda', 32, 9, 6, 50), -- club
-- ---------------------------------------------------------------------------
(0, 'Coral 1939', '9122JK', 'Faerûn', 33, 10, 5, 1), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 33, 10, 3, 1), -- thuis

(0, 'Coral 1939', '9122JK', 'Faerûn', 34, 10, 5, 1), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 34, 10, 3, 1), -- thuis

(0, 'Coral 1939', '9122JK', 'Faerûn', 35, 10, 5, 1), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 35, 10, 3, 1), -- thuis

(0, 'Coral 1939', '9122JK', 'Faerûn', 36, 10, 5, 1), -- thuis
(0, 'Coral 1939', '9122JK', 'Faerûn', 36, 10, 3, 1), -- thuis

(0, 'Turqoise 18', '6598TA', 'Exandria', 37, 10, 1, 1), -- werk
(0, 'Turqoise 18', '6598TA', 'Exandria', 37, 10, 4, 10), -- werk

(0, 'Turqoise 18', '6598TA', 'Exandria', 38, 10, 2, 1), -- werk
(0, 'Turqoise 18', '6598TA', 'Exandria', 38, 10, 4, 9), -- werk
(0, 'Turqoise 18', '6598TA', 'Exandria', 38, 10, 5, 1), -- werk

(0, 'Coral 1939', '9122JK', 'Faerûn', 39, 10, 3, 1), -- werk besteld voor thuis (wegens overuren betaald eten)
(0, 'Coral 1939', '9122JK', 'Faerûn', 39, 10, 5, 1), -- werk besteld voor thuis (wegens overuren betaald eten)

(0, 'Emerald 9', '3122AC', 'New York', 40, 10, 4, 40), -- sportclub -opendagen
(0, 'Emerald 9', '3122AC', 'New York', 40, 10, 5, 40), -- sportclub -opendagen
(0, 'Emerald 9', '3122AC', 'New York', 40, 10, 1, 5), -- sportclub -opendagen
(0, 'Emerald 9', '3122AC', 'New York', 40, 10, 6, 100), -- sportclub -opendagen

(0, 'Emerald 9', '3122AC', 'New York', 41, 10, 4, 40), -- sportclub -opendagen
(0, 'Emerald 9', '3122AC', 'New York', 41, 10, 5, 40), -- sportclub -opendagen
(0, 'Emerald 9', '3122AC', 'New York', 41, 10, 1, 5), -- sportclub -opendagen
(0, 'Emerald 9', '3122AC', 'New York', 41, 10, 6, 100), -- sportclub -opendagen

(0, 'Amethyst 42', '1822LB', 'Sieganhilda', 42, 10, 2, 1),  -- vriend
-- ---------------------------------------------------------------------------
(0, 'Warlock 420', '1122AB', 'Faerûn', 43, 11, 1, 1), -- thuis
(0, 'Warlock 420', '1122AB', 'Faerûn', 43, 11, 2, 1), -- thuis

-- ---------------------------------------------------------------------------
(0, 'Zircon 396', '4348PO', 'Sieganhilda', 44, 12, 1, 2), -- werk
(0, 'Zircon 396', '4348PO', 'Sieganhilda', 44, 12, 2, 2), -- werk
-- ---------------------------------------------------------------------------
(0, 'Daecheraess  24', '6765FD', 'Himdall Hord', 45, 13, 4, 4), -- werk
(0, 'Daecheraess  24', '6765FD', 'Himdall Hord', 45, 13, 6, 8); -- werk
-- ---------------------------------------------------------------------------


-- Totaal_prijs == SUM van Bestelling