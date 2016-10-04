<<<<<<< HEAD
-- Authors : DAVID GUERROUDJ =) , ALBAN BERTOLINI =)

=======
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
/*----------------------------------------------------------------------------
CREATION DES TABLES
------------------------------------------------------------------------------*/
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
  DureeEpr INTERVAL DAY TO SECOND(0) NOT NULL
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

/*TABLE OCCUPATIONS*/
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
/*----------------------------------------------------------------------------
INSERT DANS LES TABLES
------------------------------------------------------------------------------*/
/*ETUDIANTS*/
INSERT INTO ETUDIANTS (NumEtu,NomEtu,PrenomEtu) VALUES (1,'Courtney','Delacruz');
INSERT INTO ETUDIANTS (NumEtu,NomEtu,PrenomEtu) VALUES (2,'Nicole','Chaney');
INSERT INTO ETUDIANTS (NumEtu,NomEtu,PrenomEtu) VALUES (3,'Denise','Forbes');
/*ENSEIGNANTS*/
INSERT INTO ENSEIGNANTS (NumEns,NomEns,PrenomEns) VALUES (1,'Macaulay','Knox');
INSERT INTO ENSEIGNANTS (NumEns,NomEns,PrenomEns) VALUES (2,'Jade','Palmer');
INSERT INTO ENSEIGNANTS (NumEns,NomEns,PrenomEns) VALUES (3,'Gannon','Stephenson');
/*SALES*/
INSERT INTO SALLES (NumSal,NomSal,CapaciteSal) VALUES (1,'Egestas LLC',1);
INSERT INTO SALLES (NumSal,NomSal,CapaciteSal) VALUES (2,'Nunc Nulla PC',2);
INSERT INTO SALLES (NumSal,NomSal,CapaciteSal) VALUES (3,'Nunc Sed',3);
/*EPREUVES*/
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (1,'Ankara',INTERVAL '65' MINUTE);
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (2,'Hatay',INTERVAL '65' MINUTE);
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (3,'North Island',INTERVAL '65' MINUTE);
<<<<<<< HEAD
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (4,'Sud Island',INTERVAL '65' MINUTE);
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (5,'North',INTERVAL '65' MINUTE);
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (6,'North jean',INTERVAL '65' MINUTE);
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (7,'North jean le retour',INTERVAL '65' MINUTE);


=======
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
/*INSCRIPTIONS*/
INSERT INTO INSCRIPTIONS (NumEtu,NumEpr) VALUES (1,1);
INSERT INTO INSCRIPTIONS (NumEtu,NumEpr) VALUES (2,1);
INSERT INTO INSCRIPTIONS (NumEtu,NumEpr) VALUES (3,2);
<<<<<<< HEAD
INSERT INTO INSCRIPTIONS (NumEtu,NumEpr) VALUES (1,2);
INSERT INTO INSCRIPTIONS (NumEtu,NumEpr) VALUES (1,7);

=======
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
/*HORAIRES*/
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (1,'03-05-17 10:30:10');
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (2,'03-05-17 10:30:10');
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (3,'27-02-17 10:20:10');
/*OCCUPATIONS*/
INSERT INTO OCCUPATIONS (NumSal,NumEpr,NbPlacesOcc) VALUES (1,2,1);
INSERT INTO OCCUPATIONS (NumSal,NumEpr,NbPlacesOcc) VALUES (2,1,2);
INSERT INTO OCCUPATIONS (NumSal,NumEpr,NbPlacesOcc) VALUES (3,2,0);
<<<<<<< HEAD
INSERT INTO OCCUPATIONS (NumSal,NumEpr,NbPlacesOcc) VALUES (2,6,1);

=======
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
/*SURVEILLANCES*/
INSERT INTO SURVEILLANCES (NumEns,DateHeureDebut,NumSal) VALUES (11,'03-05-17 10:30:10',3);
INSERT INTO SURVEILLANCES (NumEns,DateHeureDebut,NumSal) VALUES (4,'03-05-17 10:30:10',2);
INSERT INTO SURVEILLANCES (NumEns,DateHeureDebut,NumSal) VALUES (3,'03-05-17 10:30:10',12);
/*----------------------------------------------------------------------------
DROP DES TABLES
------------------------------------------------------------------------------*/
DROP  TABLE ETUDIANTS;
DROP  TABLE ENSEIGNANTS;
DROP  TABLE SALLES;
DROP  TABLE EPREUVES;
DROP  TABLE INSCRIPTIONS;
DROP  TABLE SURVEILLANCES;
DROP  TABLE OCCUPATIONS;
DROP TABLE HORAIRES;
<<<<<<< HEAD

/*----------------------------------------------------------------------------
DROP DES TRIGGERS
------------------------------------------------------------------------------*/

=======
/*----------------------------------------------------------------------------
DROP DES TRIGGERS
------------------------------------------------------------------------------*/
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
DROP TRIGGER VERIFIER_EPREUVE_ETUDIANT;
DROP TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT;
DROP TRIGGER VERIFIER_INSCRIP_DIF_ETUDIANT;
DROP TRIGGER VERIFIER_UPDATE_EPREUVES;
DROP TRIGGER VERIFIER_INSER_HORAIRE_C2;
DROP TRIGGER VERIFIER_INSER_OCCUPATIONS_C2;
DROP TRIGGER VERIFIER_U_SALLES_CAPACITE;
DROP TRIGGER VERIFIER_U_OCC_NBPlACESOCC;
DROP TRIGGER VERIFIER_UI_INSERT_SURVEIL;
DROP TRIGGER VERIFIER_U_INSERT_HOR;
<<<<<<< HEAD

=======
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
/*----------------------------------------------------------------------------
CREATION DES TRIGGERS
------------------------------------------------------------------------------*/

/*QUESTION 1*/

/*On cherche si deux epreuves ont des etudiant en commun et que les horaires soit bien distinctes */

/* On vérifie avant l'insertion d'une entrée dans la table HORAIRES */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER VERIFIER_EPREUVE_ETUDIANT
    AFTER INSERT ON HORAIRES 
=======
  CREATE TRIGGER VERIFIER_EPREUVE_ETUDIANT
    BEFORE INSERT ON HORAIRES 
      FOR EACH ROW
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
        DECLARE
          N BINARY_INTEGER;
          BEGIN
           SELECT 1 INTO N 
              FROM EPREUVES E1, EPREUVES E2, INSCRIPTIONS I1 , INSCRIPTIONS I2 ,HORAIRES H1,HORAIRES H2
              WHERE H1.NumEpr = E1.NumEpr AND
              E1.NumEpr = I1.NumEpr AND
              H1.NumEpr = I1.NumEpr AND
              H2.NumEpr = E2.NumEpr AND
              E2.NumEpr = I2.NumEpr AND
              H2.NumEpr = I2.NumEpr AND
              I1.NumEtu = I2.NumEtu AND
              E1.NumEpr < E2.NumEpr AND
              (H1.DateHeureDebut,H1.DateHeureDebut + E1.DureeEpr) OVERLAPS (H2.DateHeureDebut,H2.DateHeureDebut + E2.DureeEpr);


          RAISE too_many_rows;
          
          EXCEPTION 
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows  THEN RAISE_APPLICATION_ERROR(-20245,'Des étudiants sont déja en épreuve');
  END;
  
/*Jeux de test*/
--Marche 
INSERT INTO HORAIRES(NumEpr,DateHeureDebut) VALUES(7,'03/05/17 10:30:10,000000000');
--Marche pas
INSERT INTO HORAIRES(NumEpr,DateHeureDebut) VALUES(7,'03/05/19 10:32:10,000000000');



/* On cherche si un etudiant n'a pas d'autre epreuve avec un creneau en commun sur l'epreuve oe il s'inscrit */

<<<<<<< HEAD
/* On vérifie avant l'insertion d'une entrée dans la table INSCRIPTIONS */

CREATE OR REPLACE TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT
=======
/* On cherche si un etudiant n'a pas d'autre epreuve avec un creneau en commun sur l'epreuve oe il s'inscrit */

/* On vérifie avant l'insertion d'une entrée dans la table INSCRIPTIONS */

CREATE TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  BEFORE INSERT ON INSCRIPTIONS
    FOR EACH ROW
      DECLARE
        N BINARY_INTEGER;
        DureeEpr INTERVAL DAY TO SECOND(0);
        DateHeureDebutGet TIMESTAMP(0);
        BEGIN
        
        SELECT DureeEpr INTO DureeEpr
        FROM EPREUVES E
        WHERE E.NumEpr = : NEW.NumEpr;
        
        SELECT DateHeureDebut INTO DateHeureDebutGet
        FROM HORAIRES H
        WHERE H.NumEpr = : New.NumEpr;
        
        SELECT 1 INTO N 
        FROM EPREUVES E , INSCRIPTIONS I , HORAIRES H
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (DateHeureDebutGet,DateHeureDebutGet + DureeEpr);

        RAISE too_many_rows;

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20231,'l etudiant est deja dans une epreuve');
END;


/*Jeux de test*/
--Marche
DELETE FROM INSCRIPTIONS WHERE NumEpr = '4' AND NumEtu = '1';
INSERT INTO INSCRIPTIONS (NumEpr,NumEtu) VALUES (4,1);
--Marche pas
INSERT INTO INSCRIPTIONS (NumEpr,NumEtu) VALUES (1,1);


/* On vérifie avant la modification dans la table INSCRITPIONS */ 

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER VERIFIER_INSCRIP_DIF_ETUDIANT
=======
CREATE TRIGGER VERIFIER_INSCRIP_DIF_ETUDIANT
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  AFTER UPDATE ON INSCRIPTIONS
      DECLARE
        N BINARY_INTEGER;
        BEGIN
      
        SELECT 1 INTO N 
        FROM EPREUVES E1, EPREUVES E2, INSCRIPTIONS I1 , INSCRIPTIONS I2 ,HORAIRES H1,HORAIRES H2
        WHERE H1.NumEpr = E1.NumEpr AND
              E1.NumEpr = I1.NumEpr AND
              H1.NumEpr = I1.NumEpr AND
              H2.NumEpr = E2.NumEpr AND
              E2.NumEpr = I2.NumEpr AND
              H2.NumEpr = I2.NumEpr AND
              I1.NumEtu = I2.NumEtu AND
              E1.NumEpr < E2.NumEpr AND
              (H1.DateHeureDebut,H1.DateHeureDebut + E1.DureeEpr) OVERLAPS (H2.DateHeureDebut,H2.DateHeureDebut + E2.DureeEpr);

        RAISE too_many_rows;

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20231,'l etudiant est deja dans une epreuve');
END;

/*Jeux de test*/
--Marche
UPDATE INSCRIPTIONS SET NumEpr = '2'  WHERE NumEtu = '1' AND NumEpr IN(4,2,3);
--Ne marche pas
UPDATE INSCRIPTIONS SET NumEpr = '1'  WHERE NumEtu = '1' AND NumEpr ='3';

/*----------------------------------------------*/

/*On verifie sur la modification d' epreuve ( Uniquement sur la modification car les contraintes de clefs se chargent du reste ) */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER VERIFIER_UPDATE_EPREUVES
=======
CREATE TRIGGER VERIFIER_UPDATE_EPREUVES
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  AFTER UPDATE OF DureeEpr ON EPREUVES
      DECLARE
         N BINARY_INTEGER;
        BEGIN
        
        SELECT 1 INTO N 
        FROM EPREUVES E , EPREUVES A ,INSCRIPTIONS I , HORAIRES H, HORAIRES C
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              
              C.NumEpr = E.NumEpr AND
              A.NumEpr = E.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (C.DateHeureDebut,C.DateHeureDebut +  A.DureeEpr);

        RAISE too_many_rows;

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20233,'l etudiant est deja dans une epreuve');
END;


/*Jeux de test*/

/*INSERT DE TEST VERIFIER_INSCRIPTIONS_ETUDIANT*/
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (8,'New South Wales',INTERVAL '65' MINUTE);
UPDATE EPREUVES SET NomEpr = 'New South WalesV2' WHERE NomEpr ='New South Wales';
UPDATE EPREUVES SET DureeEpr = INTERVAL '10' MINUTE WHERE NomEpr ='New South WalesV2';

/******************************************************************************************************************************************************/

/* QUESTION 2 */

/* On cherche a vérifier qu'il n'y a pas deux épreuves en même temps dans une même salle, mais qui ne commencent pas à la même heure */

/* On commence par vérifier avant un update dans HORAIRES */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER VERIFIER_INSER_HORAIRE_C2
=======
CREATE  TRIGGER VERIFIER_INSER_HORAIRE_C2
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  AFTER UPDATE ON HORAIRES
  	DECLARE
    	N BINARY_INTEGER;
    	BEGIN
      
   	SELECT 1 INTO N 
        FROM EPREUVES E1, EPREUVES E2, HORAIRES H1,HORAIRES H2, OCCUPATIONS O1 , OCCUPATIONS O2
        WHERE H1.NumEpr = E1.NumEpr AND
              E1.NumEpr = O1.NumEpr AND
              H1.NumEpr = O1.NumEpr AND
              H2.NumEpr = E2.NumEpr AND
              E2.NumEpr = O2.NumEpr AND
              H2.NumEpr = O2.NumEpr AND
              E1.NumEpr < E2.NumEpr AND
              (H1.DateHeureDebut,H1.DateHeureDebut + E1.DureeEpr) OVERLAPS (H2.DateHeureDebut,H2.DateHeureDebut + E2.DureeEpr) AND
              H1.DateHeureDebut <> H2.DateHeureDebut;
          
   		 RAISE too_many_rows;

   	 EXCEPTION
   		 WHEN no_data_found THEN NULL;
   		 WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20899,'L epreuve doit commencer en meme temps que les autres epreuves de la salle !!');
END;

/*Jeux de test*/
--Marche
UPDATE HORAIRES SET DateHeureDebut ='03/05/17 10:30:10,000000000' WHERE NumEpr ='3';
--Marche pas
UPDATE HORAIRES SET DateHeureDebut ='03/05/17 11:30:10,000000000' WHERE NumEpr ='3';


/* On vérifie ensuite avant un update ou une insertion dans OCCUPATIONS */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER VERIFIER_INSER_OCCUPATIONS_C2
=======
CREATE  TRIGGER VERIFIER_INSER_OCCUPATIONS_C2
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  AFTER UPDATE OR INSERT ON OCCUPATIONS
  	DECLARE
    	N BINARY_INTEGER;
    	BEGIN
      
   		    SELECT 1 INTO N 
        FROM EPREUVES E1, EPREUVES E2, HORAIRES H1,HORAIRES H2, OCCUPATIONS O1 , OCCUPATIONS O2
        WHERE H1.NumEpr = E1.NumEpr AND
              E1.NumEpr = O1.NumEpr AND
              H1.NumEpr = O1.NumEpr AND
              H2.NumEpr = E2.NumEpr AND
              E2.NumEpr = O2.NumEpr AND
              H2.NumEpr = O2.NumEpr AND
              E1.NumEpr < E2.NumEpr AND
              (H1.DateHeureDebut,H1.DateHeureDebut + E1.DureeEpr) OVERLAPS (H2.DateHeureDebut,H2.DateHeureDebut + E2.DureeEpr) AND
              H1.DateHeureDebut <> H2.DateHeureDebut;
          
          
   		 RAISE too_many_rows;

   	 EXCEPTION
   		 WHEN no_data_found THEN NULL;
   		 WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20899,'L epreuve doit commencer en meme temps que les autres epreuves de la salle !!');
END;

/*Jeux de test*/
--Ne marche pas
INSERT INTO OCCUPATIONS (NumSal,NumEpr,NbPlacesOcc) VALUES (2,5,10);
--Marche
INSERT INTO OCCUPATIONS (NumSal,NumEpr,NbPlacesOcc) VALUES (2,4,10);

/******************************************************************************************************************************************************/

/*QUESTION 3*/

/*On cherche a vérifier que le nombre total de places occupé par les épreuves dans une même salle ne dépasse pas la capacité de la salle */ 

/* On vérifie d'abord avant les updates dans la table SALLE */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER  VERIFIER_U_SALLES_CAPACITE                                                                          
=======
CREATE TRIGGER  VERIFIER_U_SALLES_CAPACITE                                                                          
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  BEFORE UPDATE OF capaciteSal,NumSal ON SALLES  
      FOR EACH ROW
        DECLARE
           N BINARY_INTEGER;
          BEGIN
          
          SELECT 1  INTO N 
          FROM EPREUVES E, HORAIRES H, OCCUPATIONS P
          WHERE 
                  E.NumEpr = H.NumEpr AND
                  P.NumEpr = E.NumEpr  AND
                  P.NumSal = : NEW.NumSal
                -- vérification de la capacité salle
                  GROUP BY (H.dateHeureDebut) 
                  HAVING SUM(P.NbPlacesOcc) > : NEW.CapaciteSal; 
            
          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20236,'Capacité salle dépassé');
END;

/* Jeu de test*/
-- marche
<<<<<<< HEAD
UPDATE SALLES SET CapaciteSal= '100' WHERE numSal = '1';
=======
UPDATE SALLES SET CapaciteSal= '10' WHERE numSal = '1';
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
-- Marche pas
UPDATE SALLES SET CapaciteSal= '0' WHERE numSal = '1';


/* On vérifie ensuite après un update ou une insertion dans occupations */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER  VERIFIER_U_OCC_NBPlACESOCC                                                                         
=======
CREATE TRIGGER  VERIFIER_U_OCC_NBPlACESOCC                                                                         
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  AFTER  UPDATE OR INSERT  ON OCCUPATIONS 
        DECLARE
           N BINARY_INTEGER;
          BEGIN
        
          SELECT  1 INTO N
          FROM  HORAIRES H, SALLES S,OCCUPATIONS O
          WHERE 
                  H.NumEpr = O.NumEpr AND
                  O.NumSal = S.NumSal
                  
                -- vérification de la capacité salle
                  GROUP BY H.dateHeureDebut,S.CapaciteSal,S.NumSal
                  HAVING SUM(O.NbPlacesOcc) > S.CapaciteSal; 
            
          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20237,'Le nb de place occupé par l epreuve dépasse la capacité de la salle');
END;

/* Jeu de test*/
--Ne marche pas 
UPDATE OCCUPATIONS SET NbPlacesOcc= '11' WHERE numEpr = '2' AND NUMSAL = '1';
--Marche
UPDATE OCCUPATIONS SET NbPlacesOcc= '3' WHERE numEpr = '2' AND NUMSAL = '1';


/******************************************************************************************************************************************************/

/*QUESTION 4*/
<<<<<<< HEAD

/*  On cherche a vérifier qu'un enseignant n'assure une surveillance uniquement dans une salle dans laquelle il y a une épreuve */ 

/* On vérifie d'abord avant la modification ou l'insertion d'une entrée dans SURVEILLANCES */

CREATE OR REPLACE TRIGGER VERIFIER_UI_INSERT_SURVEIL                                                                         
=======

/*  On cherche a vérifier qu'un enseignant n'assure une surveillance uniquement dans une salle dans laquelle il y a une épreuve */ 

/* On vérifie d'abord avant la modification ou l'insertion d'une entrée dans SURVEILLANCES */

CREATE TRIGGER VERIFIER_UI_INSERT_SURVEIL                                                                         
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  BEFORE UPDATE OR INSERT  ON SURVEILLANCES
    FOR EACH ROW  
        DECLARE
           N BINARY_INTEGER;
          BEGIN
          SELECT 1 INTO N 
          FROM HORAIRES H, OCCUPATIONS O, SALLES S
          WHERE 
            O.NumSal  = : NEW.NumSal AND
            S.NumSal = : NEW.NumSal AND
            O.NumEpr = H.NumEpr AND 
            O.NumSal = S.NumSal AND
            H.DateHeureDebut <> : NEW.DateHeureDebut  ;
        
          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20238,'Le prof surveille une salle vide ! ^^');
END;

/*Jeux de test */
-- Marche
DELETE FROM SURVEILLANCES WHERE NumEns = 1 AND DateHeureDebut = '03/05/17 10:30:10,000000000';
INSERT INTO SURVEILLANCES (NumEns,DateHeureDebut,NumSal) VALUES (1,'03/05/17 10:30:10,000000000',1);
-- Ne marche pas
INSERT INTO SURVEILLANCES (NumEns,DateHeureDebut,NumSal) VALUES (1,'03/05/19 10:30:10,000000000',1);
-- A terminer
DELETE FROM SURVEILLANCES WHERE NumEns = 1 AND DateHeureDebut = '03/05/19 10:30:10,000000000';
INSERT INTO SURVEILLANCES (NumEns,DateHeureDebut,NumSal) VALUES (1,'03/05/19 10:30:10,000000000',4);

/* On vérifie ensuite avant l'update ou l'insert dans HORAIRES */

<<<<<<< HEAD
CREATE OR REPLACE TRIGGER VERIFIER_U_INSERT_HOR                                                                        
=======
CREATE TRIGGER VERIFIER_U_INSERT_HOR                                                                        
>>>>>>> 1003bc86e6486f2f15b549ab6d41df1d987f82a6
  BEFORE UPDATE OR INSERT ON HORAIRES
    FOR EACH ROW  
        DECLARE
           N BINARY_INTEGER;
          BEGIN
          SELECT 1 INTO N 
          FROM  SURVEILLANCES S, OCCUPATIONS O
          WHERE 
            O.NumEpr = : NEW.NumEpr AND
            O.NumSal = S.NumSal AND
            S.DateHeureDebut <> : NEW.DateHeureDebut;
            
          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-20239,'Le prof surveille une salle vide ! ^^');
END;
/*Jeux de test */
-- Marche
UPDATE HORAIRES SET DateHeureDebut = '03/05/17 10:30:10,000000000' WHERE NumEpr = '2';
-- Marche pas 
UPDATE HORAIRES SET DateHeureDebut = '03/05/18 10:30:10,000000000' WHERE NumEpr = '2';

