
% LISTA DE PAISE A LOS QUE SE PUEDE VIAJAR
lugar([costarica, mexico, panama, chile, colombia, brazil, orlando, miami, nuevaYork, []]).

% LISTA DE CLASES DE VUELO DISPONIBLES
clases([economica, negocios, ambas, []]).

% LISTA DE AEROLINEAS DISPONIBLES
aeroLinea([copa, avianca, american, united, aeromexico, latam, []]).

% UN ARCO ES UN HECHO QUE DESCRIBE UN VUELO DIPONIBLE DE UN APIS A OTRO
%arco(aerolinea, vuelo, AtoDestino, TiempoEstimado, Clase, Costo)

arco(copa, cm404, sjo, pty, 1.0, ambas , 300).%costa rica - panama
arco(avianca, dl7606 , sjo, pty, 1.0, economica , 280).%costa rica - panama

arco(american, aa1353 , sjo, mia, 2.45, de_negocios , 400). %costa rica - miami
arco(united, af4214 , sjo, mia, 2.45, economica , 390). %costa rica - miami

arco(american, aa865 , sjo, jfk, 5.15, economica , 500). %costa rica - nueva york 
arco(avianca, au2412 , sjo, jfk, 5.15, economica , 505). %costa rica - nueva york

arco(aeromexico, am656 , sjo, mex, 3.0, de_negocios , 300). %costa rica - mexico
arco(avianca, af656 , sjo, mex, 3.0, ambas , 300). %costa rica - mexico

arco(latam, az681, pty, gru, 7, ambas, 1050). %panama - brazil sao pablo

arco(copa, cm432 , pty, mex, 4.10, economica , 400). %panama - mexico
arco(united, cm432 , pty, mex, 4.10, de_negocios , 500). %panama - mexico

arco(copa, cm150 , pty, mde, 0.40, de_negocios , 200). %panama - medellin colombia
arco(avianca, ar707 , pty, mde, 0.40, de_negocios , 230). %panama - medellin colombia

arco(copa, cm446 , pty, mco, 3.40, ambas , 420). %panama - orlando
arco(american, ux042 , pty, mco, 3.40, economica , 420). %panama - orlando

arco(copa, cm277 , pty, scl, 6.30, ambas , 700). %panama - chile

arco(copa, cm445, mco, mex, 3.40, economica, 420). %orlando - mexico

arco(american, aa1354 , mia, jfk, 2.45, economica, 400). %mexico - nueva york


%vuelos de vuelta
arco(avianca, dl7606 , pty, sjo, 1.0, economica , 280).%panama - costa rica

arco(american, aa866, jfk, sjo, 5.15, economica , 500). %nueva york - costa rica
arco(avianca, au2412 , jfk, sjo, 5.15, economica , 505). %nueva york - costa rica

arco(aeromexico, am657, mex, sjo, 3.0, de_negocios , 300). %mexico - costa rica
arco(avianca, am656 , sjo, mex, 3.0, ambas , 300). %mexico - costa rica

arco(copa, cm760, gru, pty, 7, de_negocios, 1000). %brazil sao pablo - panama

arco(copa, cm433, mex, pty, 4.10, economica, 400). %mexico - panama
arco(united, cm432 , mex, pty, 4.10, de_negocios , 500).%mexico - panama

arco(copa, cm151, mde, pty, 0.40, economica, 200). %medellin colombia - panama
arco(avianca, ar707 , mde, pty, 0.40, de_negocios , 230). %medellin colombia - panama

arco(copa, cm278, scl, pty, 6.30, de_negocios, 700). %chile - panama
arco(united, jj8012 , scl, pty, 6.30, ambas , 700). %chile -panama


preguntaVuelo(Aerolinea, Origen, Destino, Tipo, Costo) :- arco(Aerolinea, _, Origen, Destino, _, Tipo, Costo).