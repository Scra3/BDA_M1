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
  AND T.NUMTY = C.NUMTY
  AND H.NumHo = O.NumHo
  AND T.NomTy = 'Luxe' /* = Chambre double*/
  AND H.NomHo = 'Le sud'
  AND NOT (O.DateA,O.DateD) OVERLAPS (SYSDATE,SYSDATE + INTERVAL '1' DAY)
  ;
  
/*Question 8*/
SELECT COUNT(T.NumTy),T.NomTy,H.NomHo
FROM TYPESCHAMBRE T, HOTELS H,CHAMBRE C
WHERE T.NumTy = C.NumTy
  AND H.NumHo = C.NumHo
GROUP BY T.NomTy,H.NomHo;

/*Question 9*/
SELECT C.NomCL, CASE WHEN MIN(H.NbEtoilesHo) = MAX(H.NbEtoilesHo) AND H.NbEtoilesHo ='4' THEN TRUE 
        ELSE NULL END uniquementQuatresEtoiles,
FROM CLIENTS C,OCCUPATIONS O,HOTELS H
WHERE C.NumCl = O.NumCl
  AND H.NumHo = O.NumHo
GROUP BY C.NomCl;

/*Question 10*/
SELECT C.NomCL, H.NbEtoilesHo ,COUNT(H.NbEtoilesHo) AS maxEtoiles 
FROM CLIENTS C,OCCUPATIONS O,HOTELS H
WHERE C.NumCl = O.NumCl
  AND H.NumHo = O.NumHo
  AND H.NbEtoilesHo = '4'
  AND ROWNUM <= 3
ORDER BY maxEtoiles
GROUP BY C.NomCl;

/*Question 11*/

SELECT CASE WHEN COUNT(T.NomTy) > '0' THEN COUNT(T.NomTy ELSE 'Aucune reservation' END , T.NomTy
FROM TYPESCHAMBRE T , OCCUPATIONS O
WHERE O.NumHo = '2',
  AND(O.DateA,O.DateD) OVERLAPS('2015 -10-15','2015-10-28');
  