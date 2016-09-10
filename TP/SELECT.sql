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
FROM OCCUPATIONS O, TYPESCHAMBRE T,RESERVATION R
WHERE O.NumCl = R.NumCl AND R.NumTy = T.NumTy ;


/*Question 4*/
SELECT C.NomCl H.VilleHo,O.DateA - O.DateD AD DateDiff
FROM OCCUPATIONS O, CLIENTS C, HOTELS H
WHERE O.NumCl = C.NumCl AND H.NumHo = O.NumHo
ORDER BY C.NomCl ASC, DateDiff;

/*Question 5*/
SELECT C.NomCl, H.NomHo, C.VilleCl, GREATEST(O1.DateA,O2.DateA) AS Debut,LAST(O1.DateD,O2.Dated) AS Fin
FROM HOTELS H, CLIENTS C1, OCCUPATIONS O1,CLIENTS C2, OCCUPATIONS O2 
WHERE C1.NumCl = O1.NumCl 
  AND C2.NumCl = O2.NumCl 
  AND O1.NumHo = H.NumHo
  AND O2.NumHo = H.NumHo
  AND C1.VilleCl = C2.VilleCl
  AND C1.NumCl > C2.NumCl
  AND (O1.DateA,O2.DateD) OVERLAPS (O2.DateA,O2.DateD);
  