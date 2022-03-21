%arco(aerolinea, vuelo, AtoDestino, TiempoEstimado, Clase, Costo)
%consult("/Users/sebastianqr.2208/Documents/GitHub/TravelAgencyLog/prueba.pl").

%lugar(país, aeropuerto)
lugar(costarica, sjo).
lugar(mexico, mex).
lugar(panama, pty).
lugar(chile, scl).
lugar(colombia, mde).
lugar(brazil, gru).
lugar(orlando, mco).
lugar(miami, mia).
lugar(nuevaYork, jfk).

%clases
clase(economica).
clase(negocios).
clase(ambas).

%Aerolineas
aerolinea(copa).
aerolinea(avianca).
aerolinea(american).
aerolinea(united).
aerolinea(aeromexico).
aerolinea(latam).

arco(copa, cm404, sjo, pty, 1.0, ambas , 300).%panama
arco(avianca, dl7606 , sjo, pty, 1.0, economica , 280).%panama

arco(american, aa1353 , sjo, mia, 2.45, de_negocios , 400). %miami
arco(united, af4214 , sjo, mia, 2.45, economica , 390). %miami

arco(american, aa865 , sjo, jfk, 5.15, economica , 500). %ny
arco(avianca, au2412 , sjo, jfk, 5.15, economica , 505). %ny

arco(aeromexico, am656 , sjo, mex, 3.0, de_negocios , 300). %mex
arco(avianca, am656 , sjo, mex, 3.0, ambas , 300). %mex

arco(copa, cm759 , pty, gru, 7, ambas , 1000). %brazil sao pablo
arco(latam, az681, pty, gru, 7, ambas, 1050). %brazil sao pablo

arco(copa, cm432 , pty, mex, 4.10, economica , 400).
arco(united, cm432 , pty, mex, 4.10, de_negocios , 500).

arco(copa, cm150 , pty, mde, 0.40, de_negocios , 200). %medellin colombia
arco(avianca, ar707 , pty, mde, 0.40, de_negocios , 230). %medellin colombia

arco(copa, cm446 , pty, mco, 3.40, ambas , 420). %orlando
arco(american, ux042 , pty, mco, 3.40, economica , 420). %orlando

arco(copa, cm277 , pty, scl, 6.30, ambas , 700). %chile santiago
arco(united, jj8012 , pty, scl, 6.30, ambas , 700). %chile santiago


%vuelos de vuelta
arco(copa, cm405 , pty, sjo, 1.0, ambas , 300).
arco(avianca, dl7606 , pty, sjo, 1.0, economica , 280).%panama

arco(american, aa1354 , mia, sjo, 2.45, de_negocios, 400). %miami
arco(united, af4214 , mia, sjo, 2.45, economica , 390). %miami

arco(american, aa866, jfk, sjo, 5.15, economica , 500). %ny
arco(avianca, au2412 , jfk, sjo, 5.15, economica , 505). %ny

arco(aeromexico, am657, mex, sjo, 3.0, de_negocios , 300).
arco(avianca, am656 , sjo, mex, 3.0, ambas , 300). %mex

arco(copa, cm760, gru, pty, 7, de_negocios, 1000). %brazil sao pablo
arco(latam, az681, gru, pty, 7, ambas, 1050). %brazil sao pablo

arco(copa, cm433, mex, pty, 4.10, economica, 400).
arco(united, cm432 , mex, pty, 4.10, de_negocios , 500).

arco(copa, cm151, mde, pty, 0.40, economica, 200). %medellin colombia
arco(avianca, ar707 , mde, pty, 0.40, de_negocios , 230). %medellin colombia

arco(copa, cm445, mco, pty, 3.40, de_negocios, 420). %orlando
arco(american, ux042 , mco, pty, 3.40, economica , 420). %orlando

arco(copa, cm278, scl, pty, 6.30, de_negocios, 700). %chile santiago
arco(united, jj8012 , scl, pty, 6.30, ambas , 700). %chile santiago


c(X):-arco(X, _, _, _, _, _, _).