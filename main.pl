% IMPORTACION DE LOS DEMAS ARCHIVOS DE LA TAREA
:- [vuelos].
:- ['GLC'].
:- [grafo].

% DEFINICION DE REGLAS PARA OBTENER LOS PARAMETROS DEL PROGRAMA
origen(X):- lugar(L), askOrigen(X,L). % Obtiene el origen del vuelo de la oracion introducida por el usuario
destino(X):- lugar(L), askDestino(X,L). % Obtiene el destino del vuelo de la oracion introducida por el usuario
aerolineas(X):- aeroLinea(L), askAero(X,L). % Obtiene la aerolinea de la oracion introducida por el usuario
clase(X):- clases(L), askClases(X,L). % Obtiene la clase del vuelo de la oracion introducida por el usuario
presupuesto(X):- askPresupuesto(X). % Obtiene el presupuesto de la oracion introducida por el usuario

% REGLA PRINCIPAL PARA LA EJECUCION DEL PROGRAMA TravelAgencyLog
main:- startup1.

% SE IMPRIME EL SALUDO DE VIENVENIDA A TravelAgencyLog
startup1:-
   write('Bienvenido a TravelAgencyLog: La mejor logica de llegar a su destino.'),
   nl,
   identify.

% SE BUSCA UN VUELO QUE SE AJUSTE A LOS REQUERIMIENTOS DEL USUARIO
identify:-
  retractall(known(_,_)), % Se borra la informacion respectiva al programa almacenada en memoria
  vuelos(X), % Tomar un vuelo disponible
  write(X),nl, % Una vez finalizado el programa, se imprime la informacion del vuelo
  write('Muchas gracias por utilizar TravelAgencyLog'). % Agradecimiento y finalizacion del programa

% SI NO SE ENCUENTRA UN VUELO QUE SE AJUSTE A LOS REQUERIMIENTOS DEL USUARIO
identify:-
  write('Lamentablemente no tenemos un vuelo que se ajuste a sus necesidades.'),nl.



% SE PREGUNTA POR EL LUGAR DE ORIGEN DEL VUELO
askOrigen(X,_):- 
  known(origen,X), !. % Se busca en memoria si existe el lugar de origen, 
                      % si no se conoce entonces se pregunta y se guarda como "known"

% SE PREGUNTA POR EL LUGAR DE ORIGEN DEL VUELO
askOrigen(X,Menu):- 
  write('De las siguientes opciones, por favor indiqueme cual es el origen de su vuelo: '),
  nl, display_menu(Menu), % Se imprime una lista de los paises disponibles para viajar
  my_read(ListResponse), % Se lee lo que el usuario intruduce 
  askOrigenAux(X,ListResponse, Menu).

askOrigen(X,Menu):- askOrigen(X,Menu).

% SE BUSCA EL LUGAR DE ORIGEN EN LA ORACION QUE INTRODUJO EL USUARIO
askOrigenAux(X,ListResponse, Menu):-
  oracion(ListResponse,[]), % Se descompone la oracion por palabras
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(origen,X)). %Se inserta el lugar de origen como known

% SI NO SE ENCUENTRA UN LUGAR DE ORIGEN EN LA ORACION DEL USUARIO
askOrigenAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

% SE PREGUNTA POR EL LUGAR DE DESTINO DEL VUELO
askDestino(X,_):- 
  known(destino,X), !. % Se busca en memoria si existe el lugar de destino, 
                       % si no se conoce entonces se pregunta y se guarda como "known"

% SE PREGUNTA POR EL LUGAR DE DESTINO DEL VUELO
askDestino(X,Menu):-  % Si no se conoce entonces se pregunta y se guarda como "known"
  write('Muy bien! Ahora, de las siguientes opciones, por favor indiqueme cual es el destino de su vuelo: '),
  nl, display_menu(Menu),  % Se imprime una lista de los paises disponibles para viajar
  my_read(ListResponse), % Se lee lo que el usuario intruduce 
  askDestinoAux(X,ListResponse, Menu).

askDestino(X,Menu):- askDestino(X,Menu).

% SE BUSCA EL LUGAR DE ORIGEN EN LA ORACION QUE INTRODUJO EL USUARIO
askDestinoAux(X,ListResponse, Menu):-
  oracion(ListResponse,[]), % Se descompone la oracion por palabras
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(destino,X)). % Se inserta el lugar de destino como known

% SI NO SE ENCUENTRA UN LUGAR DE ORIGEN EN LA ORACION DEL USUARIO
askDestinoAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

% SE PREGUNTA POR UNA PREFERENCIA DE AEROLINEAS
askAero(X,_):-  % Si ya se conoce entonces solo se toma la conocida
  known(aerolinea,X), !. % Si no se conoce entonces se pregunta y se guarda como "known"

% SE PREGUNTA POR UNA PREFERENCIA DE AEROLINEAS
askAero(X,Menu):- 
  write('Tiene alguna preferencia de aerolinea?'),
  nl,
  my_read(ListResponse), % Se lee lo oracion del usuario
  askAeroAux(X,ListResponse,Menu).

askAero(X,Menu):- askAero(X,Menu).

% SE BUSCA LA AEROLINEA EN LA ORACION QUE INTRODUJO EL USUARIO
askAeroAux(X,ListResponse,Menu):-
  oracion(ListResponse,[]), % Se descompone la oracion del usuario
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(aerolinea,X)). % Se inserta la aerolinea como known

% SI EL USUARIO NO TIENE UNA AEROLINEA DE PREFERENCIA
askAeroAux(X,ListResponse,_Menu):-
  oracion(ListResponse,[]), % Se descompone la oracion del usuario
  miembro(Atom,ListResponse),
  miembro(Atom, ['No', 'no']), 
  X=[],
  !,
  asserta(known(aerolinea,X)).

% SI NO SE COMPRENDE LO QUE EL USUARIO INTRODUJO COMO ORACION, SE VUELVE A PREGUNTAR
askAeroAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

% SE PREGUNTA POR UNA PREFERENCIA DE CLASES DE VUELO
askClases(X,_):-  % Si ya se conoce entonces solo se toma la conocida
  known(clase,X), !. % Si no se conoce entonces se pregunta y se guarda como "known"

% SE PREGUNTA POR UNA PREFERENCIA DE CLASES DE VUELO
askClases(X,Menu):-  
  write('Tiene alguna clase preferencia de las siguientes opciones?'),
  nl, display_menu(Menu), % Se muestra un menu con las opciones de clases de vuelo
  my_read(ListResponse),
  askClasesAux(X,ListResponse,Menu).

askClases(X,Menu):- askClases(X,Menu).

% SE BUSCA LA CLASE DE VUELO EN LA ORACION QUE INTRODUJO EL USUARIO
askClasesAux(X,ListResponse,Menu):-
  oracion(ListResponse,[]), % Se descompone la oracion
  miembro(X,ListResponse),
  miembro(X,Menu),
  !,
  asserta(known(clase,X)). % Se inserta la clase como known

% SI EL USUARIO NO TIENE UNA AEROLINEA DE PREFERENCIA
askClasesAux(X,ListResponse,_Menu):-
  oracion(ListResponse,[]), % Se descompone la oracion del usuario
  miembro(Atom,ListResponse),
  miembro(Atom, ['No', 'no']), 
  X=economica,
  !,
  asserta(known(clase,X)).

% SI NO SE COMPRENDE LO QUE EL USUARIO INTRODUJO COMO ORACION, SE VUELVE A PREGUNTAR
askClasesAux(_X,_ListResponse,_Menu):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

% SE PREGUNTA AL USUARIO SI TIENE UN PREUPUESTO PARA EL VUELO
askPresupuesto(X):-  % Si ya se conoce entonces solo se toma la conocida
  known(presupuesto,X), !. % Si no se conoce entonces se pregunta y se guarda como "known"

% SE PREGUNTA AL USUARIO SI TIENE UN PREUPUESTO PARA EL VUELO
askPresupuesto(X):-  
  write('Tiene algun presupuesto?'),
  nl,
  my_read(ListResponse), % Se lee la respuesta del ususario
  askPresupuestoAux(X,ListResponse).

askPresupuesto(X):- askPresupuesto(X).

% SE BUSCA ALGUN VUELO DE COSTO MENOR O IGUAL AL PRESUPUESTO DEL USUARIO
askPresupuestoAux(X,ListResponse):-
  oracion(ListResponse,[]), % Se descompone la oracion del usuario
  miembro(Atom,ListResponse),
  atom_number(Atom,X),
  !,
  asserta(known(presupuesto,X)). % Se guarda el presupuesto del usuario

% SI EL USUARIO NO CUENTA CON UN PRESUPUESTO SE BUSCA EL PRIMER VUELO QUE CUMPLA CON LOS REQUISITOS
askPresupuestoAux(X,ListResponse):- 
  oracion(ListResponse,[]),
  miembro(Atom,ListResponse),
  miembro(Atom, ['No', 'no', 'ninguno']),  
  X=1500,
  !,
  asserta(known(presupuesto,X)). 

% SI NO SE ENTIENDE LO QUE EL USUARIO INTRODUCE CONO ORACION
askPresupuestoAux(_X,_ListResponse):-
  write('No comprendo lo que indicaste, Puedes volverlo a formular?'),
  nl,
  !,
  fail.

% REGLAS PARA MOSTRAR LAS DIFERENTES LISTAS DE DATOS
display_menu(Menu):-
  disp_menu(Menu), !. % No se hace backtracking cundo se termina de imprimir el menu

disp_menu([]). % Finaliza la recursion
disp_menu([[] | Rest]):- % Se salta el elemento vacio
  disp_menu(Rest).

disp_menu([Item | Rest]):- % Se imprime la lista de manera recursiva
  write('- '),write(Item),nl,
  disp_menu(Rest).
