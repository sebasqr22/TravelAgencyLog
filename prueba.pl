%arco(aerolinea, vuelo, AtoDestino, TiempoEstimado, Clase, Costo)

arco(COPA, CM404, SJO, PTY, 1, Ambas, 300).
arco(COPA, CM401, PTY, NED, 8, Ambas, 1300).

c(X):-arco(X, _, _, _, _, _, _).