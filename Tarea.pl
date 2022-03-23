:- [vuelos].
:- ['GLC'].
:- [grafo].

%consult("/Users/sebastianqr.2208/Documents/GitHub/TravelAgencyLog/Tarea.pl").

% Definici�n de reglas para los par�metros
origen(X):- lugar(L), askOrigen(X,L).
destino(X):- lugar(L), askDestino(X,L).
aerolineas(X):- aeroLinea(L), askAero(X,L).
clase(X):- clases(L), askClases(X,L).
presupuesto(X):- askPresupuesto(X).

tipo(X):- posibles_tipos(L), askTipo(X,L).
calorias(X):- askCalorias(X, 1200, 4200).
padecimientos(X):- posibles_padecimientos(L), askPadecimientos(X,L).
actividad(X):- askActividad(X).
comida(X):- posibles_comidas(L),askComida(X,L).

% main
main:- startup1.

startup1:-
   write('Bienvenido a TravelAgencyLog: La mejor logica de llegar a su destino.'),
   nl,
   identify.


identify:-
  retractall(known(_,_)),         % clear stored information
  vuelos(X), %tomar vuelo disponible
  write(X),nl,
  write('Muchas gracias por utilizar TravelAgencyLog').

identify:-
  write('Lamentablemente no tenemos un vuelo que se ajuste a sus necesidades.'),nl.




askOrigen(X,_):-  %Se pregunta por el lugar de origen del vuelo
  known(origen,X), !.

askOrigen(X,Menu):-  % Si no se conoce entonces se pregunta y se guarda como "known"
  write('De las siguientes opciones, por favor indiqueme cual es el origen de su vuelo: '),
  nl, display_menu(Menu),
  my_read(ListResponse),
  askOrigenAux(X,ListResponse, Menu).

askOrigen(X,Menu):- askOrigen(X,Menu).

askOrigenAux(X,ListResponse, Menu):-
  oracion(ListResponse,[]),
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(origen,X)).


askOrigenAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

askDestino(X,_):-  %Se pregunta por el lugar de destino del vuelo
  known(destino,X), !.

askDestino(X,Menu):-  % Si no se conoce entonces se pregunta y se guarda como "known"
  write('Muy bien! Ahora, de las siguientes opciones, por favor indiqueme cual es el destino de su vuelo: '),
  nl, display_menu(Menu),
  my_read(ListResponse),
  askDestinoAux(X,ListResponse, Menu).

askDestino(X,Menu):- askDestino(X,Menu).

askDestinoAux(X,ListResponse, Menu):-
  oracion(ListResponse,[]),
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(destino,X)).


askDestinoAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.


askAero(X,_):-  % Si ya se conoce entonces solo se toma la conocida
  known(aerolinea,X), !.

askAero(X,Menu):-  % Si no se conoce entonces se pregunta y se guarda como "known"
  write('Tiene alguna preferencia de aerolinea?'),
  nl,
  my_read(ListResponse),
  askAeroAux(X,ListResponse,Menu).

askAero(X,Menu):- askAero(X,Menu).

askAeroAux(X,ListResponse,Menu):-
  oracion(ListResponse,[]),
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(aerolinea,X)).

askAeroAux(X,ListResponse,_Menu):-
  oracion(ListResponse,[]),
  miembro(Atom,ListResponse),
  miembro(Atom, ['No', 'no']), 
  X=[],
  !,
  asserta(known(aerolinea,X)).

askAeroAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.


askClases(X,_):-  % Si ya se conoce entonces solo se toma la conocida
  known(clase,X), !.

askClases(X,Menu):-  % Si no se conoce entonces se pregunta y se guarda como "known"
  write('Tiene alguna clase preferencia de las siguientes opciones?'),
  nl, display_menu(Menu),
  my_read(ListResponse),
  askClasesAux(X,ListResponse,Menu).

askClases(X,Menu):- askClases(X,Menu).

askClasesAux(X,ListResponse,Menu):-
  oracion(ListResponse,[]),
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(clase,X)).

askClasesAux(X,ListResponse,_Menu):-
  oracion(ListResponse,[]),
  miembro(Atom,ListResponse),
  miembro(Atom, ['No', 'no']), 
  X=economica,
  !,
  asserta(known(clase,X)).

askClasesAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

%
askPresupuesto(X):-  % Si ya se conoce entonces solo se toma la conocida
  known(presupuesto,X), !.

askPresupuesto(X):-  % Si no se conoce entonces se pregunta y se guarda como "known"
  write('Tiene algun presupuesto?'),
  nl,
  my_read(ListResponse),
  askPresupuestoAux(X,ListResponse).

askPresupuesto(X):- askPresupuesto(X).

askPresupuestoAux(X,ListResponse):-
  oracion(ListResponse,[]),
  miembro(Atom,ListResponse),
  atom_number(Atom,X),
  !,
  asserta(known(presupuesto,X)).

askPresupuestoAux(X,ListResponse):-
  oracion(ListResponse,[]),
  miembro(Atom,ListResponse),
  miembro(Atom, ['No', 'no', 'ninguno']),  
  X=1500,
  !,
  asserta(known(presupuesto,X)).

askPresupuestoAux(_X,_ListResponse):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.


% Funciones auxiliares para mostrar men� de opciones (como para mostrar tipos de padecimientos)
display_menu(Menu):-
  disp_menu(Menu), !. % No backtrackear cuando se termina

disp_menu([]). % Fin de recursi�n
disp_menu([[] | Rest]):- % Saltarse el elemento vac�o []
  disp_menu(Rest).

disp_menu([Item | Rest]):- % Recursivamente escribir la lista
  write('- '),write(Item),nl,
  disp_menu(Rest).
