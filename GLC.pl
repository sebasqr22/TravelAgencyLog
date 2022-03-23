% Oraci�n: Sintagma inicial del BNF. A partir de este, se divide en los
% distintos sintagmas y elementos de las oraciones v�lidas Para
% verificar si una oraci�n es v�lida o no, se escribe
% oracion(Lista_palabras_de_la_oraci�n,[]).



oracion(S0,S):-sintagma_nominal(S0,S1),sintagma_verbal(S1,S).
oracion(S0,S):-advebio_negacion_afirmacion(S0,S1),sintagma_nominal(S1,S2),sintagma_verbal(S2,S).
oracion(S0,S):-sintagma_verbal(S0,S). %%%%%%%
oracion(S0,S):-sintagma_nominal(S0,S).
oracion(S0,S):-advebio_negacion_afirmacion(S0,S).

%sintagma_nominal: corresponde a los pronombres, nombres y complementos directos que pueden ser utilizados como sujeto en las oraciones
sintagma_nominal(S0,S):-pronombre(S0,S).
sintagma_nominal(S0,S):-complemento_directo(S0,S).

%complemento_directo: comprende todos las posibles combinaciones válidas de nombres, adjetivos, y determinantes.
complemento_directo(S0,S):-nombre(S0,S).
complemento_directo(S0,S):-adjetivo(S0,S).
complemento_directo(S0,S):-nombre(S0,S1),adjetivo(S1,S).
complemento_directo(S0,S):-determinante(S0,S1),nombre(S1,S).
complemento_directo(S0,S):-determinante(S0,S1),nombre(S1,S2),adjetivo(S2,S).
sintagma_verbal(S0,S):-verbo_transitivo(S0,S).
sintagma_verbal(S0,S):-verbo_transitivo(S0,S1),complemento_directo(S1,S).%%%%
sintagma_verbal(S0,S):-verbo_transitivo(S0,S1),verbo_infinitivo(S1,S).
sintagma_verbal(S0,S):-verbo_transitivo(S0,S1),verbo_infinitivo(S1,S2),
                                complemento_directo(S2,S).

% determinante: Son todos los articulos que pueden estar junto con un
% nombre. Estan dados por
% determinante(numero,genero,['determinante'|S],S). (singular, plural,
% masculino, femenino)
determinante(['el'|S],S).
determinante(['mas'|S],S).
determinante(['por'|S],S).
determinante(['en'|S],S).
determinante(['para'|S],S).
determinante(['mi'|S],S).
determinante(['este'|S],S).
determinante(['al'|S],S).
determinante(['a'|S],S).
determinante(['los'|S],S).
determinante(['a','los'|S],S).
determinante(['en','los'|S],S).
determinante(['la'|S],S).
determinante(['en','la'|S],S).
determinante(['a','la'|S],S).
determinante(['las'|S],S).
determinante(['en','las'|S],S).
determinante(['a','las'|S],S).
determinante(['un'|S],S).
determinante(['a','un'|S],S).
determinante(['unos'|S],S).
determinante(['a','unos'|S],S).
determinante(['una'|S],S).
determinante(['a','una'|S],S).
determinante(['unas'|S],S).
determinante(['a','unas'|S],S).

%determinante: Son todos los nombres que pueden estár dados para un complemento directo o sujeto del sintagma nominal
% Estan dados por nombre(persona(generalmente
% t[tercera]),numero,genero,['nombre'|S],S)
nombre(['costarica'|S],S).
nombre(['panama'|S],S).
nombre(['brazil'|S],S).
nombre(['mexico'|S],S).
nombre(['miami'|S],S).
nombre(['nueva york'|S],S).
nombre(['orlando'|S],S).
nombre(['chile'|S],S).
nombre(['colombia'|S],S).
nombre(['vuelo'|S],S).
nombre(['destino'|S],S).
nombre(['favor'|S],S).
nombre(['clase'|S],S).
nombre(['aerolinea'|S],S).
nombre(['dolares'|S],S).
nombre(['copa'|S],S).
nombre(['avianca'|S],S).
nombre(['latam'|S],S).
nombre(['american'|S],S).
nombre(['united'|S],S).
nombre(['aeromexico'|S],S).
nombre(['economica'|S],S).
nombre(['de negocios'|S],S).
nombre(['ambas'|S],S).
nombre(['preferencia'|S],S).
nombre(['preferencias'|S],S).
nombre([_NumDolares|S],S).
nombre([_NumDolares,'dolares'|S],S).
nombre(['activo'|S],S).
nombre([_NumVeces,'veces','a','la','semana'|S],S).

% adjetivos: Son todos los adjetivos que pueden estar dados para
% describir un nombre de un complemento directo Estan dados por
% adjetivo(numero,genero,['adjetivo'|S],S)
adjetivo(['rapido'|S],S). % (singular, plural), (masculino, femenino)
adjetivo(['charter'|S],S).
adjetivo(['economica'|S],S).
adjetivo(['negocios'|S],S).
adjetivo(['barato'|S],S).
adjetivo(['caro'|S],S).
adjetivo(['simple'|S],S).
adjetivo(['directo'|S],S).
adjetivo(['indirecto'|S],S).

%verbo_infinitivo: verbos infinitivos que se pueden usar en conjunto con los verbos transitivos disponibles.
%Estan dados por verbo_infinitivo(['verbo_infinitivo'|S],S)
verbo_infinitivo(['llevar'|S],S).
verbo_infinitivo(['ser'|S],S).
verbo_infinitivo(['ir'|S],S).
verbo_infinitivo(['querer'|S],S).
verbo_infinitivo(['llegar'|S],S).
verbo_infinitivo(['hacer'|S],S).
verbo_infinitivo(['viajar'|S],S).
verbo_infinitivo(['estar'|S],S).
verbo_infinitivo(['volar'|S],S).
verbo_infinitivo(['seguir'|S],S).
verbo_infinitivo(['salir'|S],S).
verbo_infinitivo(['tener'|S],S).
verbo_infinitivo(['conseguir'|S],S).
verbo_infinitivo(['obtener'|S],S).

%verbo_transitivo: Son todos los verbos conjugados transitivos que se pueden utilizar en las oraciones
% Estan dados por
% verbo_transitivo(persona,numero,['verbo_transitivo'|S],S)
verbo_transitivo(['salgo'|S],S).
verbo_transitivo(['voy'|S],S).
verbo_transitivo(['sale'|S],S).
verbo_transitivo(['encuentro'|S],S).
verbo_transitivo(['quiero'|S],S).
verbo_transitivo(['seria'|S],S).
verbo_transitivo(['gustaria'|S],S).
verbo_transitivo(['deseo'|S],S).
verbo_transitivo(['quisiera'|S],S).
verbo_transitivo(['tengo'|S],S).
verbo_transitivo(['estoy'|S],S).
verbo_transitivo(['he','pensado'|S],S).
verbo_transitivo(['prefiero'|S],S).
verbo_transitivo(['gusta'|S],S).

% pronombre: Son todos los pronombres que se puede usar como sujeto de
% las oraciones validas. Estan dados por
% pronombre(persona,numero,genero,['pronombre'|S],S)
pronombre(['Yo'|S],S).
pronombre(['yo'|S],S).
pronombre(['Me'|S],S).
pronombre(['me'|S],S).
pronombre(['Me'|S],S).
pronombre(['me'|S],S).
pronombre(['mi'|S],S).



%advebio_negacion_afirmacion: Son todas los adverbios de negación y afirmación que permite utilizar en las oraciones
%Estan dados por advebio_negacion_afirmacion(['advebio_negacion_afirmacion'|S],S)
advebio_negacion_afirmacion(['si'|S],S).
advebio_negacion_afirmacion(['Si'|S],S).
advebio_negacion_afirmacion(['Si,'|S],S).
advebio_negacion_afirmacion(['si,', ''|S],S).
advebio_negacion_afirmacion(['Si,'|S],S).
advebio_negacion_afirmacion(['no'|S],S).
advebio_negacion_afirmacion(['No'|S],S).
advebio_negacion_afirmacion(['no,'|S],S).
advebio_negacion_afirmacion(['No,'|S],S).
advebio_negacion_afirmacion(['ninguno,'|S],S).




%my_read: Es la funci�n dada para leer el input del usuario,
% de tal manera que se guarde como una lista donde cada �tomo es un
% elemento de la lista, ya que as� se debe guardar para sea evaluado por
% la regla oraci�n(). List es la lista que contiene lo que el usuario
% escribi�.
my_read(List):-
read_string(user,"\n","\r",_,String), % divide la oracion en palabras
atom_string(Atom,String),             % Convierte el atomo a un string
atomic_list_concat(List,' ',Atom).    % lista de palabras, caracter a concatenar, variable donde se guarda
