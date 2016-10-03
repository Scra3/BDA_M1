/* CREATION DE LA BASE SESSION EXAMENS */
DROP  TABLE ETUDIANTS;
DROP  TABLE ENSEIGNANTS;
DROP  TABLE SALLES;
DROP  TABLE EPREUVES;
DROP  TABLE INSCRIPTIONS;
DROP  TABLE SURVEILLANCES;
DROP  TABLE OCCUPATIONS;
DROP TABLE HORAIRES;

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
CREATION DES TRIGGERS
------------------------------------------------------------------------------*/

/*QUESTION 1*/
/*On cherche si deux �preuves ont des �tudiant en commun et que les horaires soit bien distinctes */
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
        WHERE E.NumEpr = : NEW.NumEpr;
        
        SELECT 1 INTO N 
        FROM HORAIRES H,INSCRIPTIONS I ,EPREUVES E
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (: NEW.DateHeureDebut,: NEW.DateHeureDebut + DureeEpr);
              /*Si on arrive a cette ligne erreur*/
        RAISE too_many_rows;
        EXCEPTION 
        WHEN no_data_found THEN NULL;
        WHEN too_many_rows  THEN RAISE_APPLICATION_ERROR(-100,'Des �tudiants sont d�ja en �preuve');
END;
\

/*INSERT DE TEST VERIFIER_EPREUVE_ETUDIANT*/
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (8,'28-04-16 20:30:10');
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (12,'28-04-16 20:30:10');
/*----------------------------------------*/

/* On cherche si un �tudiant n'a pas d'autre �preuve avec un cr�neau en commun sur l'�preuve o� il s'inscrit */
DROP TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT;
CREATE TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT
  BEFORE UPDATE OR INSERT ON INSCRIPTIONS
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
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-10,'l etudiant est d�ja dans une �preuve');
END;
\
/*INSERT DE TEST VERIFIER_INSCRIPTIONS_ETUDIANT*/
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (20,'03-05-17 10:30:10');
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (20,'03-05-18 10:30:10');
INSERT INTO HORAIRES (NumEpr,DateHeureDebut) VALUES (17,'03-05-19 10:30:10');
/*----------------------------------------------*/
/*On v�rifie sur la modification d' epreuve ( Uniquement sur la modification car les contraintes de clefs se charge du reste ) */

DROP TRIGGER VERIFIER_UPDATE_EPREUVES;
CREATE TRIGGER VERIFIER_UPDATE_EPREUVES
  BEFORE UPDATE OF DureeEpr ON EPREUVES
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
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-10,'l etudiant est d�ja dans une �preuve');
END;
\
/*INSERT DE TEST VERIFIER_INSCRIPTIONS_ETUDIANT*/
INSERT INTO EPREUVES (NumEpr,NomEpr,DureeEpr) VALUES (8,'New South Wales',INTERVAL '65' MINUTE);
UPDATE EPREUVES SET NomEpr = 'New South WalesV2' WHERE NomEpr ='New South Wales';
UPDATE EPREUVES SET DureeEpr = INTERVAL '10' MINUTE WHERE NomEpr ='New South WalesV2';

/*-------------------------QUESTION 3-------------------------------------------------------*/
DROP TRIGGER VERIFIER_U_SALLES_CAPACITE;
CREATE TRIGGER  VERIFIER_U_SALLES_CAPACITE                                                                          
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
UPDATE SALLES SET CapaciteSal= '10' WHERE numSal = '1';
UPDATE SALLES SET CapaciteSal= '0' WHERE numSal = '1';


DROP TRIGGER VERIFIER_U_OCC_NBPlACESOCC;
CREATE TRIGGER  VERIFIER_U_OCC_NBPlACESOCC                                                                         
  BEFORE UPDATE OR INSERT ON OCCUPATIONS 
        DECLARE
           N BINARY_INTEGER;
          BEGIN
        
          SELECT dateHeureDebut,S.CapaciteSal,SUM(O.NbPlacesOcc),S.NumSal
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
UPDATE OCCUPATIONS SET NbPlacesOcc= '1' WHERE numEpr = '4' AND NUMSAL = '4';
UPDATE OCCUPATIONS SET NbPlacesOcc= '500' WHERE numSal = '4';


CREATE TRIGGER OR REPLACE VERIFIER_UPDATE_EPREUVES_NBPlACESOCC                                                                         
  BEFORE UPDATE OR INSERT ON EPREUVES 
        DECLARE
           N BINARY_INTEGER;
          BEGIN

          SELECT 1 INTO N 
          FROM OCCUPATIONS O1,OCCUPATIONS O2,SALLES S, EPREUVES E1 , EPREUVES E2, HORAIRES H1, HORAIRES H2
          WHERE 
                -- epreuve 1
                H1.NumEpr = E1.NumEpr AND
                E1.NumEpr = O1.NumEpr AND
                O1.NumSal = S.NumSal AND 
                -- epreuve 2
                H2.NumEpr = E2.NumEpr AND
                E2.NumEpr = O2.NumEpr AND
                O2.NumSal = S.NumSal AND 
                -- Occupation meme salles
                02.NumSal = 01.NumSal AND
                -- parcour de la table
                E1.NumEpr < E2.NumEpr AND
                -- meme horaires
                (H1.DateHeureDebut,H1.DateHeureDebut + E1.DureeEpr) OVERLAPS (H2.DateHeureDebut,H2.DateHeureDebut +  E2.DureeEpr);
                -- vérification de la capacité salle
                AND O1.NbPlacesOcc + O2.NbPlacesOcc > S.CapaciteSal; 

          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-12,'Le nb de place occupé par l epreuve dépasse la capacité de la salle');
END;

CREATE TRIGGER OR REPLACE VERIFIER_UPDATE_INSERT_SURVEILLANCES                                                                         
  BEFORE UPDATE OR INSERT ON SURVEILLANCES
    FOR EACH ROW  
        DECLARE
           N BINARY_INTEGER;
          BEGIN
          SELECT 1 INTO N 
          FROM HORAIRES H, OCCUPATIONS O
          WHERE 
            O.NumSal = : NEW.NumSal AND
            O.NumEpr = H.NumEpr AND 
            H.DateHeureDebut != : NEW.DateHeureDebut ;
          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-13,'Le prof surveille une salle vide ! ^^');
END;

CREATE TRIGGER OR REPLACE VERIFIER_UPDATE_INSERT_HORAIRES                                                                         
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
            O.DateHeureDebut != : NEW.DateHeureDebut;
          RAISE too_many_rows;

          EXCEPTION
            WHEN no_data_found THEN NULL;
            WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-13,'Le prof surveille une salle vide ! ^^');
END;