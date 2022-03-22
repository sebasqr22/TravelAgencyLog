%arco(aerolinea, vuelo, AtoDestino, TiempoEstimado, Clase, Costo)
%consult("/Users/sebastianqr.2208/Documents/GitHub/TravelAgencyLog/prueba.pl").

%lugar(país, aeropuerto)

lugar([costarica, mexico, panama, chile, colombia, brazil, orlando, miami, nuevaYork], []).

%clases
clases([economica, negocios, ambas],[]).

%Aerolineas
aerolinea([copa, avianca, american, united, aeromexico, latam], []).


arco(copa, cm404, sjo, pty, 1.0, ambas , 300).%panama
arco(avianca, dl7606 , sjo, pty, 1.0, economica , 280).%panama

arco(american, aa1353 , sjo, mia, 2.45, de_negocios , 400). %miami
arco(united, af4214 , sjo, mia, 2.45, economica , 390). %miami

arco(american, aa865 , sjo, jfk, 5.15, economica , 500). %ny
arco(avianca, au2412 , sjo, jfk, 5.15, economica , 505). %ny

arco(aeromexico, am656 , sjo, mex, 3.0, de_negocios , 300). %mex
arco(avianca, am656 , sjo, mex, 3.0, ambas , 300). %mex

arco(latam, az681, pty, gru, 7, ambas, 1050). %brazil sao pablo

arco(copa, cm432 , pty, mex, 4.10, economica , 400).
arco(united, cm432 , pty, mex, 4.10, de_negocios , 500).

arco(copa, cm150 , pty, mde, 0.40, de_negocios , 200). %medellin colombia
arco(avianca, ar707 , pty, mde, 0.40, de_negocios , 230). %medellin colombia

arco(copa, cm446 , pty, mco, 3.40, ambas , 420). %orlando
arco(american, ux042 , pty, mco, 3.40, economica , 420). %orlando

arco(copa, cm277 , pty, scl, 6.30, ambas , 700). %chile santiago


%vuelos de vuelta
arco(avianca, dl7606 , pty, sjo, 1.0, economica , 280).%panama

arco(american, aa1354 , mia, sjo, 2.45, de_negocios, 400). %miami
arco(united, af4214 , mia, sjo, 2.45, economica , 390). %miami

arco(american, aa866, jfk, sjo, 5.15, economica , 500). %ny
arco(avianca, au2412 , jfk, sjo, 5.15, economica , 505). %ny

arco(aeromexico, am657, mex, sjo, 3.0, de_negocios , 300).
arco(avianca, am656 , sjo, mex, 3.0, ambas , 300). %mex

arco(copa, cm760, gru, pty, 7, de_negocios, 1000). %brazil sao pablo

arco(copa, cm433, mex, pty, 4.10, economica, 400).
arco(united, cm432 , mex, pty, 4.10, de_negocios , 500).

arco(copa, cm151, mde, pty, 0.40, economica, 200). %medellin colombia
arco(avianca, ar707 , mde, pty, 0.40, de_negocios , 230). %medellin colombia

arco(copa, cm445, mco, pty, 3.40, de_negocios, 420). %orlando
arco(american, ux042 , mco, pty, 3.40, economica , 420). %orlando

arco(copa, cm278, scl, pty, 6.30, de_negocios, 700). %chile santiago
arco(united, jj8012 , scl, pty, 6.30, ambas , 700). %chile santiago


c(X):-arco(X, _, _, _, _, _, _).

vuelo('Su vuelo es el CM404, ruta SJO, Costa Rica - PTY, Panama con COPA Airlines. 
      El tiempo estimado de vuelo es de 1 hora. El costo del vuelo es de $300').
vuelo('Su vuelo es el DL7606, ruta SJO, Costa Rica - PTY, Panama con AVIANCA Airlines. 
      El tiempo estimado de vuelo es de 1 hora. El costo del vuelo es de $280').

vuelo('Su vuelo es el AA1353, ruta SJO, Costa Rica - MIA, USA con AMERICAN Airlines. 
      El tiempo estimado de vuelo es de 2.45 horas en clase de negocios. El costo del vuelo es de $400').
vuelo('Su vuelo es el AF4214, ruta SJO, Costa Rica - MIA, Miami con United Airlines. 
      El tiempo estimado de vuelo es de 2.45 horas en clase economica. El costo del vuelo es de $390').

vuelo('Su vuelo es el AA865, ruta SJO, Costa Rica - JFK, Nueva York con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $500').
vuelo('Su vuelo es el AU2412, ruta SJO, Costa Rica - JFK, Nueva York con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $505').

vuelo('Su vuelo es el AM656, ruta SJO, Costa Rica - MEX, Mexico con AEROMEXICO Airlines.
      El tiempo estimado de vuelo es de 3 horas en clase de negocios. El costo del vuelo es de $300').
vuelo('Su vuelo es el AU2412, ruta SJO, Costa Rica - MEX, Mexico con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $300').

arco(aeromexico, am656 , sjo, mex, 3.0, de_negocios , 300). %mex
arco(avianca, am656 , sjo, mex, 3.0, ambas , 300). %mex

arco(latam, az681, pty, gru, 7, ambas, 1050). %brazil sao pablo

arco(copa, cm432 , pty, mex, 4.10, economica , 400).
arco(united, cm432 , pty, mex, 4.10, de_negocios , 500).

arco(copa, cm150 , pty, mde, 0.40, de_negocios , 200). %medellin colombia
arco(avianca, ar707 , pty, mde, 0.40, de_negocios , 230). %medellin colombia

arco(copa, cm446 , pty, mco, 3.40, ambas , 420). %orlando
arco(american, ux042 , pty, mco, 3.40, economica , 420). %orlando

arco(copa, cm277 , pty, scl, 6.30, ambas , 700). %chile santiago
