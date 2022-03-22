% Oraci�n: Sintagma inicial del BNF. A partir de este, se divide en los
% distintos sintagmas y elementos de las oraciones v�lidas Para
% verificar si una oraci�n es v�lida o no, se escribe
% oracion(Lista_palabras_de_la_oraci�n,[]).

oracion(S0,S):-agradecimiento(S0,S1),sintagma_nominal(Pers,Num,_Gend,S1,S2),sintagma_verbal(Pers,Num,S2,S).
oracion(S0,S):-agradecimiento(S0,S1),advebio_negacion_afirmacion(S1,S2),sintagma_nominal(Pers,Num,_Gend,S2,S3),sintagma_verbal(Pers,Num,S3,S).
oracion(S0,S):-sintagma_nominal(Pers,Num,_Gend,S0,S1),sintagma_verbal(Pers,Num,S1,S).
oracion(S0,S):-advebio_negacion_afirmacion(S0,S1),sintagma_nominal(Pers,Num,_Gend,S1,S2),sintagma_verbal(Pers,Num,S2,S).
oracion(S0,S):-sintagma_verbal(_Pers,_Num,S0,S).
oracion(S0,S):-sintagma_nominal(_Pers,_Num,_Gend,S0,S).
oracion(S0,S):-agradecimiento(S0,S).
oracion(S0,S):-saludoGeneral(S0,S).
oracion(S0,S):-advebio_negacion_afirmacion(S0,S).

%sintagma_nominal: corresponde a los pronombres, nombres y complementos directos que pueden ser utilizados como sujeto en las oraciones
sintagma_nominal(Pers,Num,Gend,S0,S):-pronombre(Pers,Num,Gend,S0,S).
sintagma_nominal(Pers,Num,Gend,S0,S):-complemento_directo(Pers,Num,Gend,S0,S).

%complemento_directo: comprende todos las posibles combinaciones válidas de nombres, adjetivos, y determinantes.
complemento_directo(Pers,Num,Gend,S0,S):-nombre(Pers,Num,Gend,S0,S).
complemento_directo(_Pers,Num,Gend,S0,S):-adjetivo(Num,Gend,S0,S).
complemento_directo(Pers,Num,Gend,S0,S):-nombre(Pers,Num,Gend,S0,S1),adjetivo(Num,Gend,S1,S).
complemento_directo(Pers,Num,Gend,S0,S):-determinante(Num,Gend,S0,S1),nombre(Pers,Num,Gend,S1,S).
complemento_directo(Pers,Num,Gend,S0,S):-determinante(Num,Gend,S0,S1),nombre(Pers,Num,Gend,S1,S2),adjetivo(Num,Gend,S2,S).

%sintagma_verbal: comprende todas las combinaciones válidas de verbos, verbos infinitivos, y complementos directos.
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S).
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),complemento_directo(_Pers2,_Num2,_Gend2,S1,S).
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),verbo_infinitivo(S1,S).
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),verbo_infinitivo(S1,S2),
                                complemento_directo(_Pers2,_Num2,_Gend2,S2,S).

% determinante: Son todos los articulos que pueden estar junto con un
% nombre. Estan dados por
% determinante(numero,genero,['determinante'|S],S). (singulaar, plural,
% masculino, femenino)
determinante(s,m,['el'|S],S).
determinante(s,m,['al'|S],S).
determinante(p,m,['los'|S],S).
determinante(p,m,['a','los'|S],S).
determinante(s,f,['la'|S],S).
determinante(s,f,['a','la'|S],S).
determinante(p,f,['las'|S],S).
determinante(p,f,['a','las'|S],S).
determinante(s,m,['un'|S],S).
determinante(s,m,['a','un'|S],S).
determinante(p,m,['unos'|S],S).
determinante(p,m,['a','unos'|S],S).
determinante(s,f,['una'|S],S).
determinante(s,f,['a','una'|S],S).
determinante(p,f,['unas'|S],S).
determinante(p,f,['a','unas'|S],S).

%determinante: Son todos los nombres que pueden estár dados para un complemento directo o sujeto del sintagma nominal
% Estan dados por nombre(persona(generalmente
% t[tercera]),numero,genero,['nombre'|S],S)
nombre(t,s,m,['costa rica'|S],S).
nombre(t,p,m,['panama'|S],S).
nombre(t,s,f,['brazil'|S],S).
nombre(t,s,m,['mexico'|S],S).
nombre(t,s,f,['miami'|S],S).
nombre(t,s,f,['nueva york'|S],S).
nombre(t,s,m,['orlando'|S],S).
nombre(t,s,m,['chile'|S],S).
nombre(t,s,m,['colombia'|S],S).
nombre(t,p,f,['vuelo'|S],S).
nombre(t,s,f,['clase'|S],S).
nombre(t,s,f,['aerolinea'|S],S).
nombre(t,s,f,['dolares'|S],S).
nombre(t,s,m,['copa'|S],S).
nombre(t,s,m,['avianca'|S],S).
nombre(t,s,m,['latam'|S],S).
nombre(t,s,m,['american'|S],S).
nombre(t,s,f,['united'|S],S).
nombre(t,s,f,['aeromexico'|S],S).
nombre(t,s,f,['economica'|S],S).
nombre(t,s,f,['de negocios'|S],S).
nombre(t,s,f,['ambas'|S],S).
nombre(t,s,f,['preferencia'|S],S).
nombre(t,p,f,['prefrencias'|S],S).
nombre(t,p,f,[_NumCalorias,'calorias'|S],S).
nombre(t,s,m,['activo'|S],S).
nombre(t,p,f,[_NumVeces,'veces','a','la','semana'|S],S).

% adjetivos: Son todos los adjetivos que pueden estar dados para
% describir un nombre de un complemento directo Estan dados por
% adjetivo(numero,genero,['adjetivo'|S],S)
adjetivo(s,m,['rapido'|S],S). % (singular, plural), (masculino, femenino)
adjetivo(s,f,['charter'|S],S).
adjetivo(p,m,['economica'|S],S).
adjetivo(p,f,['negocios'|S],S).
adjetivo(s,m,['barato'|S],S).
adjetivo(p,m,['caro'|S],S).
adjetivo(s,f,['simple'|S],S).
adjetivo(p,f,['directo'|S],S).
adjetivo(s,f,['indirecto'|S],S).
adjetivo(s,m,[_NumVeces,'veces','a','la','semana'|S],S).

%verbo_infinitivo: verbos infinitivos que se pueden usar en conjunto con los verbos transitivos disponibles.
%Estan dados por verbo_infinitivo(['verbo_infinitivo'|S],S)
verbo_infinitivo(['llevar'|S],S).
verbo_infinitivo(['ser'|S],S).
verbo_infinitivo(['llegar'|S],S).
verbo_infinitivo(['hacer'|S],S).
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
verbo_transitivo(p,s,['salgo'|S],S).
verbo_transitivo(p,s,['deseo'|S],S).
verbo_transitivo(p,s,['quisiera'|S],S).
verbo_transitivo(p,s,['tengo'|S],S).
verbo_transitivo(p,s,['quiero'|S],S).
verbo_transitivo(p,s,['estoy'|S],S).
verbo_transitivo(t,s,['recomendaron'|S],S).
verbo_transitivo(t,s,['han','recomendado'|S],S).
verbo_transitivo(p,s,['he','pensado'|S],S).
verbo_transitivo(p,s,['prefiero'|S],S).
verbo_transitivo(t,s,['gusta'|S],S).

% pronombre: Son todos los pronombres que se puede usar como sujeto de
% las oraciones validas. Estan dados por
% pronombre(persona,numero,genero,['pronombre'|S],S)
pronombre(p,s,n,['Yo'|S],S).
pronombre(p,s,n,['yo'|S],S).
pronombre(p,s,n,['Me'|S],S).
pronombre(p,s,n,['me'|S],S).
pronombre(t,s,n,['Me'|S],S).
pronombre(t,s,n,['me'|S],S).

%agradecimiento: Son todas las expresiones de agradecimiento que permite colocar en las oraciones,
%Estan dados por agradecimiento(['agradecimiento'|S],S)
agradecimiento(['Gracias,'|S],S).
agradecimiento(['Muchas','Gracias,'|S],S).
agradecimiento(['Gracias'|S],S).
agradecimiento(['Muchas','Gracias'|S],S).

%advebio_negacion_afirmacion: Son todas los adverbios de negación y afirmación que permite utilizar en las oraciones
%Estan dados por advebio_negacion_afirmacion(['advebio_negacion_afirmacion'|S],S)
advebio_negacion_afirmacion(['si'|S],S).
advebio_negacion_afirmacion(['Si'|S],S).
advebio_negacion_afirmacion(['si,'|S],S).
advebio_negacion_afirmacion(['Si,'|S],S).
advebio_negacion_afirmacion(['no'|S],S).
advebio_negacion_afirmacion(['No'|S],S).
advebio_negacion_afirmacion(['no,'|S],S).
advebio_negacion_afirmacion(['No,'|S],S).


%saludo: Son todas los saludos disponibles para iniciar el programa de NutriTec
%Estan dados por saludo(['saludo'|S],S)
saludo(['Hola'|S],S).
saludo(['Buenos','dias'|S],S).
saludo(['Buenas','tardes'|S],S).
saludo(['Buenas','noches'|S],S).

%my_read: Es la funci�n dada para leer el input del usuario,
% de tal manera que se guarde como una lista donde cada �tomo es un
% elemento de la lista, ya que as� se debe guardar para sea evaluado por
% la regla oraci�n(). List es la lista que contiene lo que el usuario
% escribi�.
my_read(List):-
read_string(user,"\n","\r",_,String), % divide la oracion en palabras
atom_string(Atom,String),             % Convierte el atomo a un string
atomic_list_concat(List,' ',Atom).    % lista de palabras, caracter a concatenar, variable donde se guarda
