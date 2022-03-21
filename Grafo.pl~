%arco(aerolinea, vuelo, AtoDestino, TiempoEstimado, Clase, Costo)
%consult("/Users/sebastianqr.2208/Documents/GitHub/TravelAgencyLog/prueba.pl").
arco(COPA, CM404, SJO, PTY, 1.0, Ambas, 300).
arco(AMERICAN, AA1353, SJO, MIA, 2.45, 400). %miami
arco(AMERICAN, AA865, SJO, JFK, 5.15, 500). %ny
arco(AEROMEXICO, AM656, SJO, MEX, 3.0, 300).
arco(COPA, CM759, PTY, GRU, 7, 1000). %brazil sao pablo
arco(COPA, CM432, PTY, MEX, 4.10, 400).
arco(COPA, CM150, PTY, MDE, 0.40, 200). %medellin colombia
arco(COPA, CM446, PTY, MCO, 3.40, 420). %orlando
arco(COPA, CM277, PTY, SCL, 6.30, 700). %chile santiago

%vuelos de vuelta
arco(COPA, CM405, PTY, SJO, 1.0, Ambas, 300).
arco(AMERICAN, AA1354, MIA, SJO, 2.45, 400). %miami
arco(AMERICAN, AA866, JFK, SJO, 5.15, 500). %ny
arco(AEROMEXICO, AM657, MEX, SJO, 3.0, 300).
arco(COPA, CM760, GRU, PTY, 7, 1000). %brazil sao pablo
arco(COPA, CM433, MEX, PTY, 4.10, 400).
arco(COPA, CM151, MDE, PTY, 0.40, 200). %medellin colombia
arco(COPA, CM445, MCO, PTY, 3.40, 420). %orlando
arco(COPA, CM278, SCL, PTY, 6.30, 700). %chile santiago

c(X):-arco(X, _, _, _, _, _, _).