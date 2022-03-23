
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

% LOS VUELOS SON REGLAS QUE DESCRIBEN UN VUELO DE UN PAIS DE ORIGEN A UN PAIS DE DESTINO
% Vuelos de ida %

%costa rica - panama
vuelo('Su vuelo es el CM404, ruta SJO, Costa Rica - PTY, Panama con COPA Airlines.
      El tiempo estimado de vuelo es de 1 hora en clase de negocios. El costo del vuelo es de $300').
vuelo('Su vuelo es el DL7606, ruta SJO, Costa Rica - PTY, Panama con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 1 hora en clase economica. El costo del vuelo es de $280').
%costa rica - miami
vuelo('Su vuelo es el AA1353, ruta SJO, Costa Rica - MIA, USA con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 2.45 horas en clase de negocios. El costo del vuelo es de $400').
vuelo('Su vuelo es el AF4214, ruta SJO, Costa Rica - MIA, Miami con United Airlines.
      El tiempo estimado de vuelo es de 2.45 horas en clase economica. El costo del vuelo es de $390').
%costa rica - nueva york 
vuelo('Su vuelo es el AA865, ruta SJO, Costa Rica - JFK, Nueva York con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $500').
vuelo('Su vuelo es el AU2412, ruta SJO, Costa Rica - JFK, Nueva York con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $505').

vuelo('Su vuelo es el AM656, ruta SJO, Costa Rica - MEX, Mexico con AEROMEXICO Airlines.
      El tiempo estimado de vuelo es de 3 horas en clase de negocios. El costo del vuelo es de $300').
vuelo('Su vuelo es el AF656, ruta SJO, Costa Rica - MEX, Mexico con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $300').

vuelo('Su vuelo es el AF656, ruta PTY, Panama - GRU, Sao Pablo con LATAM Airlines.
      El t estimado de vuelo es de 7 horas en clase economica. El costo del vuelo es de $1050').

vuelo('Su vuelo es el CM432, ruta PTY, Panama - MEX, Mexico con COPA Airlines.
      El tiempo estimado de vuelo es de 4.10 horas en clase economica. El costo del vuelo es de $400').
vuelo('Su vuelo es el CM432, ruta PTY, Panama - MEX, Mexico con UNITED Airlines.
      El tiempo estimado de vuelo es de 7 horas en clase de negocios. El costo del vuelo es de $500').

vuelo('Su vuelo es el CM150, ruta PTY, Panama - MDE, Medellin con COPA Airlines.
      El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $200').
vuelo('Su vuelo es el AR707, ruta PTY, Panama - MDE, Medellin con Avianca.
      El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $230').

vuelo('Su vuelo es el CM446, ruta PTY, Panama - MCO, Orlando con COPA Airlines.
      El tiempo estimado de vuelo es de 3.4 horas en clase economica. El costo del vuelo es de $420').
vuelo('Su vuelo es el UX042, ruta PTY, Panama - MCO, Orlando con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 3.4 horas en clase de negocios. El costo del vuelo es de $420').

vuelo('Su vuelo es el CM277, ruta PTY, Panama - SCL, Santiago con COPA Airlines.
      El tiempo estimado de vuelo es de 6.3 horas en clase de negocios. El costo del vuelo es de $700').

%regreso
vuelo('Su vuelo es el DL7606, ruta PTY, Panama - SJO, San Jose con Avianca.
      El tiempo estimado de vuelo es de 1 hora en clase economica. El costo del vuelo es de $280').

vuelo('Su vuelo es el AA865, ruta JFK, Nueva York - SJO, San Jose con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $500').
vuelo('Su vuelo es el AU2412, ruta JFK, Nueva York - SJO, San Jose con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $505').

vuelo('Su vuelo es el AM656, ruta MEX, Mexico - SJO, Costa Rica con AEROMEXICO Airlines.
      El tiempo estimado de vuelo es de 3 horas en clase de negocios. El costo del vuelo es de $300').
vuelo('Su vuelo es el AF656, ruta MEX, Mexico - SJO, Costa Rica con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $300').

vuelo('Su vuelo es el CM760, ruta GRU, Sao Pablo - PTY, Panama con LATAM Airlines.
      El tiempo estimado de vuelo es de 7 horas en clase de negocios. El costo del vuelo es de $1000').

vuelo('Su vuelo es el CM150, ruta MDE, Medellin - PTY, Panama con COPA Airlines.
      El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $200').
vuelo('Su vuelo es el AR707, ruta MDE, Medellin - PTY, Panama con Avianca.
      El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $230').

vuelo('Su vuelo es el CM446, ruta MCO, Orlando - PTY, Panama con COPA Airlines.
      El tiempo estimado de vuelo es de 3.4 horas en clase economica. El costo del vuelo es de $420').
vuelo('Su vuelo es el UX042, ruta MCO, Orlando - PTY, Panama con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 3.4 horas en clase de negocios. El costo del vuelo es de $420').

vuelo('Su vuelo es el CM278, ruta SCL, Santiago - PTY, Panama con COPA Airlines.
      El tiempo estimado de vuelo es de 6.3 horas en clase de negocios. El costo del vuelo es de $700').
vuelo('Su vuelo es el JJ8012, ruta SCL, Santiago - PTY, Panama con COPA Airlines.
      El tiempo estimado de vuelo es de 6.3 horas en clase economica. El costo del vuelo es de $700').

vuelo('Su vuelo seria el CM445 ruta MCO, Orlando - MEX, Mexico con AMERICAN 
      Airlines en clase economica, el tiempo estimado de vuelo es de 3.4 horas, 
      UX042 MEX, Mexico - PTY, Panama con United Airlines, el tiempo estimado de vuelo son 4.10 
      horas en clase económica. El costo total del vuelo es de $600'). % Escala de orlando a panama

vuelo('Su vuelo seria el AA1353 ruta MIA, USA - JFK, Nueva York con AMERICAN 
      Airlines en clase economica, el tiempo estimado de vuelo es de 2.5 horas, 
      AF4214 JFK, Nueva York - SJO, Costa Rica con United Airlines, el tiempo estimado de vuelo son 4.5 
      horas en clase económica. El costo total del vuelo es de $700'). % Escala de miami a costa rica