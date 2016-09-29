/* CREATION DE LA BASE SESSION EXAMENS */
DROP  TABLE ETUDIANTS;
DROP  TABLE ENSEIGNANTS;
DROP  TABLE SALLES;
DROP  TABLE EPREUVES;
DROP  TABLE INSCRIPTIONS;
DROP  TABLE SURVEILLANCES;
DROP  TABLE OCCUPATIONS;

/*TABLE ETUDIANTS*/
CREATE TABLE ETUDIANTS (
  NumEtu NUMBER(30) PRIMARY KEY ,
  NomEtu VARCHAR(20) NOT NULL,
  PrenomEtu VARCHAR(20) NOT NULL
)

/*TABLE ENSEIGNANTS*/
CREATE TABLE ENSEIGNANTS (
  NumEns NUMBER(30) PRIMARY KEY,
  NomEns VARCHAR(20) NOT NULL,
  PrenomEns VARCHAR(20) NOT NULL
)

/*TABLE SALLES */
CREATE TABLE SALLES(
  NumSal NUMBER(20) PRIMARY KEY,
  NomSal VARCHAR(20) NOT NULL,
  CapaciteSal NUMBER(20)  NOT NULL
)

/*TABLE EPREUVES */
CREATE TABLE EPREUVES(
  NumEpr NUMBER(20) PRIMARY KEY,
  NomEpr VARCHAR(20) NOT NULL,
  DureeEpre INTERVAL DAY TO SECOND(0) NOT NULL
)

/*TABLE INSCRIPTION */

CREATE TABLE INSCRIPTIONS(
  NumEtu NUMBER(20) ,
  NumEpr NUMBER(20),
  PRIMARY KEY(NumEtu,NumEpr),
  FOREIGN KEY (NumEtu) REFERENCES ETUDIANTS(NumEtu),
  FOREIGN KEY (NumEpr) REFERENCES EPREUVES(NumEpr)
)

/*TABLE HORAIRES */

CREATE TABLE HORAIRES(
  NumEpr NUMBER(20) PRIMARY KEY,
  DateHeureDebut TIMESTAMP(0) NOT NULL,
  FOREIGN KEY (NumEpr) REFERENCES EPREUVES (NumEpr)
)

/*TABLE OCCUPAITONS*/
CREATE TABLE OCCUPATIONS (
  NumSal NUMBER(20),
  NumEpr NUMBER(20),
  NbPlacesOcc NUMBER(30) NOT NULL,
  PRIMARY KEY(NumSal,NumEpr)
)

/*TABLE SURVEILLANCES*/

CREATE TABLE SURVEILLANCES(
  NumEns NUMBER(20),
  DateHeureDebut TIMESTAMP(0) NOT NULL,
  NumSal NUMBER(20) NOT NULL,
  PRIMARY KEY(NumEns,DateHeureDebut),
  FOREIGN KEY (NumEns) REFERENCES ENSEIGNANTS(NumEns)
)

/*-----------------------------------------------------------------------------
INSERTS
------------------------------------------------------------------------------*/
/*ETUDIANTS*/
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (1,'Courtney','Delacruz');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (2,'Nicole','Chaney');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (3,'Denise','Forbes');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (4,'Kamal','Alston');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (5,'James','Roberson');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (6,'Suki','Knowles');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (7,'Lacey','Christian');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (8,'Whoopi','Sanchez');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (9,'Amanda','Hebert');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (10,'Xanthus','Serrano');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (11,'Priscilla','Odom');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (12,'Sydney','Hinton');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (13,'Willow','Wyatt');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (14,'Allen','Barron');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (15,'Rebecca','Hatfield');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (16,'Elizabeth','Manning');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (17,'Jerome','Lester');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (18,'Thane','Carr');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (19,'Alice','Landry');
INSERT INTO `ETUDIANTS` (`NumEtu`,`NomEtu`,`PrenomEtu`) VALUES (20,'Wynne','Kirby');

/*ENSEIGNANTS*/

INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (1,'Macaulay','Knox');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (2,'Jade','Palmer');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (3,'Gannon','Stephenson');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (4,'Anika','Garrison');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (5,'Francesca','Dejesus');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (6,'Ruth','Scott');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (7,'Ashely','Aguilar');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (8,'Maia','Steele');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (9,'Ariana','Cline');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (10,'Flynn','Evans');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (11,'Veda','Clemons');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (12,'Kelly','Forbes');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (13,'Alfonso','Bentley');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (14,'Joelle','Martinez');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (15,'Isaiah','Glass');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (16,'Alyssa','Wade');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (17,'Whilemina','Rhodes');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (18,'Theodore','Knapp');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (19,'Dawn','Peck');
INSERT INTO `ENSEIGNANTS` (`NumEns`,`NomEns`,`PrenomEns`) VALUES (20,'Zachary','Rich');

/*SALES*/

INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (1,'Egestas LLC',129);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (2,'Nunc Nulla PC',45);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (3,'Nunc Sed Orci Consulting',94);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (4,'Curabitur Foundation',71);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (5,'Facilisis Foundation',171);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (6,'Vitae LLP',51);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (7,'Ac Fermentum Vel Ltd',7);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (8,'Curae; LLP',83);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (9,'Vitae Corporation',134);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (10,'Et Eros Proin PC',134);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (11,'Nulla Donec Foundation',144);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (12,'A Ultricies Adipiscing Associates',119);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (13,'Arcu Vivamus Ltd',101);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (14,'Feugiat Placerat Industries',57);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (15,'Montes Nascetur Corporation',129);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (16,'Ultrices Sit Institute',116);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (17,'Suspendisse Foundation',92);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (18,'Neque Limited',155);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (19,'Luctus Vulputate Consulting',110);
INSERT INTO `SALLES` (`NumSal`,`NomSal`,`CapaciteSal`) VALUES (20,'Amet Ante Vivamus Associates',187);

/*EPREUVES*/
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (1,'Ankara','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (2,'Hatay','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (3,'North Island','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (4,'BC','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (5,'Ogun','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (6,'IL','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (7,'C','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (8,'New South Wales','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (9,'Ulster','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (10,'NI','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (11,'TN','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (12,'Vienna','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (13,'Ist','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (14,'OV','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (15,'LAZ','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (16,'Ontario','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (17,'Metropolitana de Santiago','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (18,'Madrid','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (19,'KA','INTERVAL 65 MINUTE');
INSERT INTO `EPREUVES` (`NumEpr`,`NomEpr`,`DureeEpr`) VALUES (20,'C','INTERVAL 65 MINUTE');
/*----------------------------------------------------------------------------
CREATION DES TRIGGERS
------------------------------------------------------------------------------*/

/*QUESTION 1*/
/*On cherche si deux épreuves ont des étudiant en commun et que les horaires soit bien distinctes */
DROP TRIGGER VERIFIER_EPREUVE_ETUDIANT;
CREATE TRIGGER VERIFIER_EPREUVE_ETUDIANT
  BEFORE INSERT OR UPDATE ON HORAIRES 
    FOR EACH ROW
      DECLARE
        N BINARY_INTEGER;
        DureeEpr INTERVAL DAY TO SECOND(0);
      BEGIN
        SELECT DureeEpr INTO DureeEpr
        FROM EPREUVES E
        WHERE E = : NEW.NumEpr;
        
        SELECT 1 INTO N 
        FROM HORAIRES H,INSCRIPTIONS I ,EPREUVES E
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (NEW.DateHeureDebut,NEW.DateHeureDebut + DureeEpr);
              /*Si on arrive a cette ligne erreur*/
             RAISE too_many_rows;
      EXCEPTION 
        WHEN no_data_found THEN NULL;
        WHEN too_many_rows  THEN RAISE_APPLICATION_ERROR(-100,'Des étudiants sont déja en épreuve');
END;
\

/* On cherche si un étudiant n'a pas d'autre épreuve avec un créneau en commun sur l'épreuve où il s'inscrit */
DROP TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT;
CREATE TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT
  BEFORE UPDATE OR INSERT ON INSCRIPTIONS
    FOR EACH ROW
      DECLARE
         N BINARY_INTEGER;
        DureeEpr INTERVAL DAY TO SECOND(0);
        DateHeureDebut TIMESTAMP(0);
        BEGIN
        RAISE too_many_rows;
        
        SELECT DureeEpr INTO DureeEpr
        FROM EPREUVES E
        WHERE E = : NEW.NumEpr;
        
        SELECT DateHeureDebut INTO DateHeureDebut
        FROM HORAIRES H
        WHERE H.NumEpr = New.NumEpr;
        
        SELECT 1 INTO N 
        FROM EPREUVES E , INSCRIPTIONS I , HORAIRES H
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (DateHeureDebut,DateHeureDebut + DureeEpr);

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-10,'l etudiant est déja dans une épreuve');
END;
\

/*On vérifie sur la modification d' epreuve ( Uniquement sur la modification car les contraintes de clefs se charge du reste ) */

DROP TRIGGER VERIFIER_UPDATE_EPREUVES;
CREATE TRIGGER VERIFIER_UPDATE_EPREUVES
  BEFORE UPDATE  ON EPREUVES
      DECLARE
         N BINARY_INTEGER;
        DateHeureDebut TIMESTAMP(0);
        BEGIN
        RAISE too_many_rows;
        
        
        SELECT DateHeureDebut INTO DateHeureDebut
        FROM HORAIRES H
        WHERE H.NumEpr = New.NumEpr;
        
        SELECT 1 INTO N 
        FROM EPREUVES E , INSCRIPTIONS I , HORAIRES H
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + New.DureeEpr) OVERLAPS (DateHeureDebut,DateHeureDebut +  New.DureeEpr);

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-10,'l etudiant est déja dans une épreuve');
END;
\

