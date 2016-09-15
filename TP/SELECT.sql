
/* Question 1*/
SELECT NomHo 
FROM HOTELS 
WHERE NbEtoilesHo > 2  
ORDER BY NomHo ASC;

/*Question 2*/
SELECT count(*) 
FROM HOTELS;

/*Question 3 */
SELECT NomTy
FROM OCCUPATIONS O, TYPESCHAMBRE T,RESERVATIONS R
WHERE O.NumCl = R.NumCl AND R.NumTy = T.NumTy ;


/*Question 4*/
SELECT C.NomCl VilleHo,O.DateA ,O.DateD 
FROM OCCUPATIONS O, CLIENTS C, HOTELS H
WHERE O.NumCl = C.NumCl AND H.NumHo = O.NumHo
ORDER BY C.NomCl ASC;

/*Question 5*/

SELECT C2.NomCl, C2.VilleCl ,C1.NomCl, H.NomHo, C1.VilleCl, GREATEST(O1.DateA,O2.DateA) AS Debut,LEAST(O1.DateD,O2.DateD) AS Fin
FROM HOTELS H, CLIENTS C1, OCCUPATIONS O1,CLIENTS C2, OCCUPATIONS O2 
WHERE C1.NumCl = O1.NumCl 
  AND C2.NumCl = O2.NumCl 
  AND O1.NumHo = H.NumHo
  AND O2.NumHo = H.NumHo
  AND C1.VilleCl = C2.VilleCl
  AND C1.NumCl > C2.NumCl
  AND (O1.DateA,O2.DateD) OVERLAPS (O2.DateA,O2.DateD);
  
/*Question 6*/
SELECT COUNT(C.NumHo),C.NumHo
FROM CHAMBRES C
GROUP BY C.NumHo;

/*Question 7 Chambre luxe Le sud  A FINIR */ 

SELECT T.NomTy,COUNT(T.NomTy)
FROM TYPESCHAMBRE T, HOTELS H, OCCUPATIONS O, CHAMBRES C
WHERE O.NumCh = C.NumCh
  AND T.NumTY = C.NumTY
  AND H.NumHo = O.NumHo
  AND T.NomTy = 'Luxe' 
  AND H.NumHo = '2'
  AND  NOT (O.DateA,O.DateD) OVERLAPS (localtimestamp,localtimestamp + interval '1' day)
  GROUP BY T.NomTy;
  
/*Question 8*/
SELECT COUNT(T.NumTy),T.NomTy,H.NomHo
FROM TYPESCHAMBRE T, HOTELS H,CHAMBRES C
WHERE T.NumTy = C.NumTy
  AND H.NumHo = C.NumHo
GROUP BY T.NomTy,H.NomHo
ORDER BY H.NOMHO;

/*Question 9*/

SELECT C.NomCL
FROM CLIENTS C ,OCCUPATIONS O,HOTELS H
WHERE C.NumCl = O.NumCl
  AND H.NumHo = O.NumHo
  AND H.NbEtoilesHo = '4'
  AND C.NumCL  NOT IN (SELECT C.NumCL 
                      FROM  CLIENTS C, OCCUPATIONS O,HOTELS H
                      WHERE C.NumCl = O.NumCl
                      AND H.NumHo = O.NumHo
                      AND H.NbEtoilesHo <> '4')
 GROUP BY C.NomCl;

/*Question 10*/
SELECT C.NomCl,H.NbEtoilesHO,COUNT(*)
FROM CLIENTS C,OCCUPATIONS O,HOTELS H
WHERE C.NumCl = O.NumCl
  AND H.NumHo = O.NumHo
  AND H.NbEtoilesHO ='4'
  ORDER BY C.NomCl
  group by C.NomCl;

/*Question 11*/
SELECT CASE WHEN COUNT(T.NomTy) > 0 THEN COUNT(T.NomTy) ELSE 1 END , T.NomTy
FROM TYPESCHAMBRE T , OCCUPATIONS O
WHERE O.NumHo = '2'
  AND(O.DateA,O.DateD) OVERLAPS( TIMESTAMP '2015-10-15 00:00:00', TIMESTAMP '2015-10-28 00:00:00')
GROUP BY T.NomTy;
