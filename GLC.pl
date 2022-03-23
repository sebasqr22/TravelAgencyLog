% Oraci�n: Sintagma inicial del BNF. A partir de este, se divide en los
% distintos sintagmas y elementos de las oraciones v�lidas Para
% verificar si una oraci�n es v�lida o no, se escribe



% DIFERENTES POSIBLES ESTRUCTURAS PARA LAS ORACIONES INTRODUCIDAS POR EL USUARIO
% oracion(Lista_palabras,[]).
oracion(S0,S):-sintagma_nominal(S0,S1),sintagma_verbal(S1,S). % orcaion formada por un sintagma nominal y un sintagma verbal
oracion(S0,S):-advebio(S0,S1),sintagma_nominal(S1,S2),sintagma_verbal(S2,S). % orcaion formada por un adverbio, un sintagma nominal y un sintagma verbal
oracion(S0,S):-sintagma_verbal(S0,S). % orcaion formada por un sintagma verbal
oracion(S0,S):-sintagma_nominal(S0,S). % orcaion formada por un sintagma nominal
oracion(S0,S):-advebio(S0,S). % orcaion formada por un adverbio

% SINTAGMA NOMINAL DE LA ORACION
% formado por pronombres, nombres y complementos directos
sintagma_nominal(S0,S):-pronombre(S0,S).
sintagma_nominal(S0,S):-complemento_directo(S0,S).

% COMPLEMENTO DIRECTO DE LA ORACION
% combinaciones de nombres, adjetivos, y articulos.
complemento_directo(S0,S):-nombre(S0,S). % solo lo forma un nombre
complemento_directo(S0,S):-adjetivo(S0,S). % solo lo forma un adjetivo
complemento_directo(S0,S):-nombre(S0,S1),adjetivo(S1,S). % se forma de un nombre y un adjetivo
complemento_directo(S0,S):-articulo(S0,S1),nombre(S1,S). % se forma de un articulo y un nombre
complemento_directo(S0,S):-articulo(S0,S1),nombre(S1,S2),adjetivo(S2,S). % se forma de un articulo, un nombre y un adjetivo

% SINTAGMA VERBAL
% formado por pronombres, nombres y complementos directos
sintagma_verbal(S0,S):-verbo_transitivo(S0,S). % solo lo forma un vervo conjugado
sintagma_verbal(S0,S):-verbo_transitivo(S0,S1),complemento_directo(S1,S). % lo forma un verbo conjugado y un complemento directo
sintagma_verbal(S0,S):-verbo_transitivo(S0,S1),verbo_infinitivo(S1,S). % lo forma un verbo tansitivo y un verbo infinitivo
sintagma_verbal(S0,S):-verbo_transitivo(S0,S1),verbo_infinitivo(S1,S2),
                                complemento_directo(S2,S).% lo forma un verbo tansitivo, un verbo infinitivo y un complemento directo

% TODOS LOS ARTICULOS QUE PUEDEN ACOMPAÑAR UN NOMBRE
% articulo(['articulo'|S],S).
articulo(['el'|S],S).
articulo(['mas'|S],S).
articulo(['por'|S],S).
articulo(['en'|S],S).
articulo(['para'|S],S).
articulo(['mi'|S],S).
articulo(['este'|S],S).
articulo(['al'|S],S).
articulo(['a'|S],S).
articulo(['los'|S],S).
articulo(['a','los'|S],S).
articulo(['en','los'|S],S).
articulo(['la'|S],S).
articulo(['en','la'|S],S).
articulo(['a','la'|S],S).
articulo(['las'|S],S).
articulo(['en','las'|S],S).
articulo(['a','las'|S],S).
articulo(['un'|S],S).
articulo(['a','un'|S],S).
articulo(['unos'|S],S).
articulo(['a','unos'|S],S).
articulo(['una'|S],S).
articulo(['a','una'|S],S).
articulo(['unas'|S],S).
articulo(['a','unas'|S],S).

% POSIBLES NOMBRES QUE PUEDEN SER UTILIZADOS EN UNA ORACION EN EL COMPLEMENTO DIRECCTO Y EL SINTAGMA NOMINAL
% nombre(['nombre'|S],S)
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

% POSIBLES ADJETIVOS UTILIZADOS EN UNA ORACION
% adjetivo(['adjetivo'|S],S)
adjetivo(['rapido'|S],S).
adjetivo(['charter'|S],S).
adjetivo(['economica'|S],S).
adjetivo(['negocios'|S],S).
adjetivo(['barato'|S],S).
adjetivo(['caro'|S],S).
adjetivo(['simple'|S],S).
adjetivo(['directo'|S],S).
adjetivo(['indirecto'|S],S).

% POSIBLES VERBOS INFINITIVOS UTILIZADOS EN UNA ORACION
% verbo_infinitivo(['verbo_infinitivo'|S],S)
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

% POSIBLES VERBOS TRANSITIVOS O CONJUGADOS UTILIZADOS EN UNA ORACION
% verbo_transitivo(['verbo_transitivo'|S],S)
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

% POSIBLES PRONOMBRES UTILIZADOS COMO SUJETO EN UNA ORACION
% pronombre(['pronombre'|S],S)
pronombre(['Yo'|S],S).
pronombre(['yo'|S],S).
pronombre(['Me'|S],S).
pronombre(['me'|S],S).
pronombre(['Me'|S],S).
pronombre(['me'|S],S).
pronombre(['mi'|S],S).


% POSIBLES ADVERBIOS DE NEGACION Y AFIRMACION UTILIZADOS EN UNA ORACION
% advebio(['advebio_negacion_afirmacion'|S],S)
advebio(['si'|S],S).
advebio(['Si'|S],S).
advebio(['Si,'|S],S).
advebio(['si,', ''|S],S).
advebio(['Si,'|S],S).
advebio(['no'|S],S).
advebio(['No'|S],S).
advebio(['no,'|S],S).
advebio(['No,'|S],S).
advebio(['ninguno,'|S],S).



% REGLA PARA LEER LE ORACION DEL USUARIO. ESTA ORACION SE GUARDA COMO UNA LISTA DE PALABRAS PARA LUEGO SER EVALUADA
% POR LA REGLA oracion.
% oracion(). List contiene lo que el usuario escribe
my_read(List):-
read_string(user,"\n","\r",_,String), % divide la oracion en palabras
atom_string(Atom,String),             % Convierte el atomo a un string
atomic_list_concat(List,' ',Atom).    % lista de palabras, caracter a concatenar, variable donde se guarda
