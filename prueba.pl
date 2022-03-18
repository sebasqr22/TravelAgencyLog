%arco(aerolinea, vuelo, AtoDestino, TiempoEstimado, Clase, Costo)
%consult("/Users/sebastianqr.2208/Documents/GitHub/TravelAgencyLog/prueba.pl").
arco('COPA ', 'CM404 ', 'SJO ', 'PTY ', 1.0, 'ambas ', 300).%panama
arco('AVIANCA ', 'DL7606 ', 'SJO ', 'PTY ', 1.0, 'económica ', 280).%panama

arco('AMERICAN ', 'AA1353 ', 'SJO ', 'MIA ', 2.45, 'de negocios ', 400). %miami
arco('UNITED ', 'AF4214 ', 'SJO ', 'MIA ', 2.45, 'económica ', 390). %miami

arco('AMERICAN ', 'AA865 ', 'SJO ', 'JFK ', 5.15, 'económica ', 500). %ny
arco('AVIANCA ', 'AU2412 ', 'SJO ', 'JFK ', 5.15, 'económica ', 505). %ny

arco('AEROMEXICO ', 'AM656 ', 'SJO ', 'MEX ', 3.0, 'de negocios ', 300). %mex
arco('AVIANCA ', 'AM656 ', 'SJO ', 'MEX ', 3.0, 'ambas ', 300). %mex

arco('COPA ', 'CM759 ', 'PTY ', 'GRU ', 7, 'ambas ', 1000). %brazil sao pablo
arco('LATAM ', 'AZ681', 'PTY', 'GRU', 7, 'ambas', 1050). %brazil sao pablo

arco('COPA ', 'CM432 ', 'PTY ', 'MEX ', 4.10, 'económica ', 400).
arco('UNITED ', 'CM432 ', 'PTY ', 'MEX ', 4.10, 'de negocios ', 500).

arco('COPA ', 'CM150 ', 'PTY ', 'MDE ', 0.40, 'de negocios ', 200). %medellin colombia
arco('AVIANCA ', 'AR707 ', 'PTY ', 'MDE ', 0.40, 'de negocios ', 230). %medellin colombia

arco('COPA ', 'CM446 ', 'PTY ', 'MCO ', 3.40, 'ambas ', 420). %orlando
arco('AMERICAN ', 'UX042 ', 'PTY ', 'MCO ', 3.40, 'económica ', 420). %orlando

arco('COPA ', 'CM277 ', 'PTY ', 'SCL ', 6.30, 'ambas ', 700). %chile santiago
arco('UNITED ', 'JJ8012 ', 'PTY ', 'SCL ', 6.30, 'ambas ', 700). %chile santiago


%vuelos de vuelta
arco('COPA ', 'CM405 ', 'PTY ', 'SJO ', 1.0, 'Ambas ', 300).
arco('AVIANCA ', 'DL7606 ', 'PTY ', 'SJO ', 1.0, 'económica ', 280).%panama

arco('AMERICAN ', 'AA1354 ', 'MIA ', 'SJO ', 2.45, 'de negocios', 400). %miami
arco('UNITED ', 'AF4214 ', 'MIA ', 'SJO ', 2.45, 'económica ', 390). %miami

arco('AMERICAN', 'AA866', 'JFK', 'SJO', 5.15, 'económica ', 500). %ny
arco('AVIANCA ', 'AU2412 ', 'JFK ', 'SJO ', 5.15, 'económica ', 505). %ny

arco('AEROMEXICO', 'AM657', 'MEX', 'SJO', 3.0, 'de necocios ', 300).
arco('AVIANCA ', 'AM656 ', 'SJO ', 'MEX ', 3.0, 'ambas ', 300). %mex

arco('COPA', 'CM760', 'GRU', 'PTY', 7, '', 1000). %brazil sao pablo
arco('LATAM ', 'AZ681', 'GRU', 'PTY', 7, 'ambas', 1050). %brazil sao pablo

arco('COPA', 'CM433', 'MEX', 'PTY', 4.10, '', 400).
arco('UNITED ', 'CM432 ', 'MEX ', 'PTY ', 4.10, 'de negocios ', 500).

arco('COPA', 'CM151', 'MDE', 'PTY', 0.40, '', 200). %medellin colombia
arco('AVIANCA ', 'AR707 ', 'MDE ', 'PTY ', 0.40, 'de negocios ', 230). %medellin colombia

arco('COPA', 'CM445', 'MCO', 'PTY', 3.40, '', 420). %orlando
arco('AMERICAN ', 'UX042 ', 'MCO ', 'PTY ', 3.40, 'económica ', 420). %orlando

arco('COPA', 'CM278', 'SCL', 'PTY', 6.30, '', 700). %chile santiago
arco('UNITED ', 'JJ8012 ', 'SCL ', 'PTY ', 6.30, 'ambas ', 700). %chile santiago


c(X):-arco(X, _, _, _, _, _, _).
