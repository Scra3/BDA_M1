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
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (:NEW.DateHeureDebut,:NEW.DateHeureDebut + DureeEpr);
              /*Si on arrive a cette ligne erreur*/
        RAISE too_many_rows;
        EXCEPTION 
        WHEN no_data_found THEN NULL;
        WHEN too_many_rows  THEN RAISE_APPLICATION_ERROR(-100,'Des �tudiants sont d�ja en �preuve');
END;
\

/* On cherche si un �tudiant n'a pas d'autre �preuve avec un cr�neau en commun sur l'�preuve o� il s'inscrit */
DROP TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT;
CREATE TRIGGER VERIFIER_INSCRIPTIONS_ETUDIANT
  BEFORE UPDATE OR INSERT ON INSCRIPTIONS
    FOR EACH ROW
      DECLARE
        N BINARY_INTEGER;
        DureeEpr INTERVAL DAY TO SECOND(0);
        DateHeureDebut TIMESTAMP(0);
        BEGIN
        
        SELECT DureeEpr INTO DureeEpr
        FROM EPREUVES E
        WHERE E.NumEpr = : NEW.NumEpr;
        
        SELECT DateHeureDebut INTO DateHeureDebut
        FROM HORAIRES H
        WHERE H.NumEpr = :New.NumEpr;
        
        SELECT 1 INTO N 
        FROM EPREUVES E , INSCRIPTIONS I , HORAIRES H
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + E.DureeEpr) OVERLAPS (:DateHeureDebut,:DateHeureDebut + DureeEpr);

        RAISE too_many_rows;

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-10,'l etudiant est d�ja dans une �preuve');
END;
\

/*On v�rifie sur la modification d' epreuve ( Uniquement sur la modification car les contraintes de clefs se charge du reste ) */

DROP TRIGGER VERIFIER_UPDATE_EPREUVES;
CREATE TRIGGER VERIFIER_UPDATE_EPREUVES
  BEFORE UPDATE  ON EPREUVES
      DECLARE
         N BINARY_INTEGER;
        DateHeureDebut TIMESTAMP(0);
        BEGIN
        
        
        SELECT DateHeureDebut INTO DateHeureDebut
        FROM HORAIRES H
        WHERE H.NumEpr = New.NumEpr;
        
        SELECT 1 INTO N 
        FROM EPREUVES E , INSCRIPTIONS I , HORAIRES H
        WHERE H.NumEpr = E.NumEpr AND
              E.NumEpr = I.NumEpr AND
              H.NumEpr = I.NumEpr AND
              (H.DateHeureDebut,H.DateHeureDebut + New.DureeEpr) OVERLAPS (:DateHeureDebut,:DateHeureDebut +  New.DureeEpr);

        RAISE too_many_rows;

        EXCEPTION
          WHEN no_data_found THEN NULL;
          WHEN too_many_rows THEN RAISE_APPLICATION_ERROR(-10,'l etudiant est d�ja dans une �preuve');
END;
\

