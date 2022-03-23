
%LISTA DE MIEMBROS
miembro(H,[H|_T]).
miembro(X,[_H|T]) :-  miembro(X,T).

% LOS VUELOS SON REGLAS QUE DESCRIBEN UN VUELO DE UN PAIS DE ORIGEN A UN PAIS DE DESTINO
% Si un vuelo cumple con todos los requisitos que propone el usuario, se imprime ese vuelo.

%%%% VUELOS DE IDA %%%%%
vuelos('Su destino no puede ser el mismo que el origen'):-
    origen(O), destino(D), O = D.

vuelos('Su vuelo es el AF656, ruta SJO, Costa Rica - MEX, Mexico con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $300'):-
      origen(O), O = costarica, destino(D), D = mexico, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=300.

vuelos('Su vuelo es el AM656, ruta SJO, Costa Rica - MEX, Mexico con AEROMEXICO Airlines.
      El tiempo estimado de vuelo es de 3 horas en clase de negocios. El costo del vuelo es de $300'):-
      origen(O), O = costarica, destino(D), D = mexico, aerolineas(A),miembro(A, [aeromexico, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=300.

vuelos('Su vuelo es el CM404, ruta SJO, Costa Rica - PTY, Panama con COPA Airlines.
      El tiempo estimado de vuelo es de 1 hora en clase de negocios. El costo del vuelo es de $300'):-
      origen(O), O = costarica, destino(D), D = panama, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=300.

vuelos('Su vuelo es el DL7606, ruta SJO, Costa Rica - PTY, Panama con AVIANCA Airlines.
      El tiempo estimado de vuelo es de 1 hora en clase economica. El costo del vuelo es de $280'):-
      origen(O), O = costarica, destino(D), D = panama, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=280.

vuelos('Su vuelo es el AA1353, ruta SJO, Costa Rica - MIA, USA con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 2.45 horas en clase de negocios. El costo del vuelo es de $400'):-
      origen(O), O = costarica, destino(D), D = miami, aerolineas(A),miembro(A, [american, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=400.
vuelos('Su vuelo es el AF4214, ruta SJO, Costa Rica - MIA, Miami con United Airlines.
      El tiempo estimado de vuelo es de 2.45 horas en clase economica. El costo del vuelo es de $390'):-
      origen(O), O = costarica, destino(D), D = miami, aerolineas(A), miembro(A, [united, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=390.

vuelos('Su vuelo es el AF656, ruta PTY, Panama - GRU, Sao Pablo con LATAM Airlines.
      El tiempo estimado de vuelo es de 7 horas en clase economica. El costo del vuelo es de $1050'):-
      origen(O), O = panama, destino(D), D = brazil, aerolineas(A), miembro(A, [latam, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=1050.

vuelos('Su vuelo es el CM432, ruta PTY, Panama - MEX, Mexico con COPA Airlines.
      El tiempo estimado de vuelo es de 4.10 horas en clase economica. El costo del vuelo es de $400'):-
      origen(O), O = panama, destino(D), D = mexico, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=400.
vuelos('Su vuelo es el CM432, ruta PTY, Panama - MEX, Mexico con UNITED Airlines.
      El tiempo estimado de vuelo es de 7 horas en clase de negocios. El costo del vuelo es de $500'):-
      origen(O), O = panama, destino(D), D = mexico, aerolineas(A), miembro(A, [united, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=500.

vuelos('Su vuelo es el CM150, ruta PTY, Panama - MDE, Medellin con COPA Airlines.
      El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $200'):-
      origen(O), O = panama, destino(D), D = colombia, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=200.
vuelos('Su vuelo es el AR707, ruta PTY, Panama - MDE, Medellin con Avianca.
      El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $230'):-
      origen(O), O = panama, destino(D), D = colombia, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=230.

vuelos('Su vuelo es el CM446, ruta PTY, Panama - MCO, Orlando con COPA Airlines.
      El tiempo estimado de vuelo es de 3.4 horas en clase economica. El costo del vuelo es de $420'):-
      origen(O), O = panama, destino(D), D = orlando, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=420.
vuelos('Su vuelo es el UX042, ruta PTY, Panama - MCO, Orlando con AMERICAN Airlines.
      El tiempo estimado de vuelo es de 3.4 horas en clase de negocios. El costo del vuelo es de $420') :-
      origen(O), O = panama, destino(D), D = orlando, aerolineas(A), miembro(A, [american, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=420.

vuelos('Su vuelo es el CM277, ruta PTY, Panama - SCL, Santiago con COPA Airlines.
      El tiempo estimado de vuelo es de 6.3 horas en clase de negocios. El costo del vuelo es de $700'):-
      origen(O), O = panama, destino(D), D = chile, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=700.

vuelos('Su vuelo es el DL7606, ruta PTY, Panama - SJO, San Jose con Avianca.
     El tiempo estimado de vuelo es de 1 hora en clase economica. El costo del vuelo es de $280'):-
     origen(O), O = panama, destino(D), D = costarica, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=280.
  
    
%%%%% VUELOS DE REGRESO %%%%%%
vuelos('Su vuelo es el AA865, ruta JFK, Nueva York - SJO, San Jose con AMERICAN Airlines.
     El tiempo estimado de vuelo es de 5.15 horas en clase negocios. El costo del vuelo es de $500'):-
     origen(O), O = nuevaYork, destino(D), D = costarica, aerolineas(A), miembro(A, [american, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=500.
vuelos('Su vuelo es el AU2412, ruta JFK, Nueva York - SJO, San Jose con AVIANCA Airlines.
     El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $505'):-
     origen(O), O = nuevaYork, destino(D), D = costarica, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=505.

vuelos('Su vuelo es el AM656, ruta MEX, Mexico - SJO, Costa Rica con AEROMEXICO Airlines.
     El tiempo estimado de vuelo es de 3 horas en clase de negocios. El costo del vuelo es de $300'):-
     origen(O), O = mexico, destino(D), D = costarica, aerolineas(A), miembro(A, [aeromexico, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=300.
vuelos('Su vuelo es el AF656, ruta MEX, Mexico - SJO, Costa Rica con AVIANCA Airlines.
     El tiempo estimado de vuelo es de 5.15 horas en clase economica. El costo del vuelo es de $300'):-
     origen(O), O = mexico, destino(D), D = costarica, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=300.

vuelos('Su vuelo es el CM760, ruta GRU, Sao Pablo - PTY, Panama con LATAM Airlines.
     El tiempo estimado de vuelo es de 7 horas en clase de negocios. El costo del vuelo es de $1000'):-
     origen(O), O = brazil, destino(D), D = panama, aerolineas(A), miembro(A, [latam, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=1000.

vuelos('Su vuelo es el CM150, ruta MDE, Medellin - PTY, Panama con COPA Airlines.
     El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $200'):-
     origen(O), O = colombia, destino(D), D = panama, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=200.
vuelos('Su vuelo es el AR707, ruta MDE, Medellin - PTY, Panama con Avianca.
     El tiempo estimado de vuelo es de 40 minutos en clase de negocios. El costo del vuelo es de $230'):-
     origen(O), O = colombia, destino(D), D = panama, aerolineas(A), miembro(A, [avianca, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=230.

vuelos('Su vuelo es el CM446, ruta MCO, Orlando - PTY, Panama con COPA Airlines.
    El tiempo estimado de vuelo es de 3.4 horas en clase economica. El costo del vuelo es de $420'):-
     origen(O), O = orlando, destino(D), D = panama, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=420.
     
vuelos('Su vuelo es el UX042, ruta MCO, Orlando - PTY, Panama con AMERICAN Airlines.
     El tiempo estimado de vuelo es de 3.4 horas en clase de negocios. El costo del vuelo es de $420'):-
     origen(O), O = orlando, destino(D), D = panama, aerolineas(A), miembro(A, [american, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=420.

vuelos('Su vuelo es el CM278, ruta SCL, Santiago - PTY, Panama con COPA Airlines.
     El tiempo estimado de vuelo es de 6.3 horas en clase de negocios. El costo del vuelo es de $700'):-
     origen(O), O = chile, destino(D), D = panama, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=700.
    
vuelos('Su vuelo es el JJ8012, ruta SCL, Santiago - PTY, Panama con COPA Airlines.
     El tiempo estimado de vuelo es de 6.3 horas en clase economica. El costo del vuelo es de $700'):-
     origen(O), O = chile, destino(D), D = panama, aerolineas(A), miembro(A, [copa, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=700.

vuelos('Su vuelo seria el CM445 ruta MCO, Orlando - MEX, Mexico con AMERICAN 
    Airlines en clase economica, el tiempo estimado de vuelo es de 3.4 horas, 
    UX042 MEX, Mexico - PTY, Panama con United Airlines, el tiempo estimado de vuelo son 4.10 
    horas en clase económica. El costo total del vuelo es de $600'):-
    origen(O), O = orlando, destino(D), D = panama, aerolineas(A), miembro(A, [united, []]), clase(C), miembro(C, [negocios, ambas]), presupuesto(P), P >=600. % Escala de orlando a panama

vuelos('Su vuelo seria el AA1353 ruta MIA, USA - JFK, Nueva York con AMERICAN 
      Airlines en clase economica, el tiempo estimado de vuelo es de 2.5 horas, 
      AF4214 JFK, Nueva York - SJO, Costa Rica con United Airlines, el tiempo estimado de vuelo son 4.5 
      horas en clase económica. El costo total del vuelo es de $700'):-
      origen(O), O = miami, destino(D), D = costarica, aerolineas(A), miembro(A, [american, []]), clase(C), miembro(C, [economica, ambas]), presupuesto(P), P >=700. % Escala de miami a costa rica


