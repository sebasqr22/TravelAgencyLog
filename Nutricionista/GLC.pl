%Oración: Sintagma inicial del BNF. A partir de este, se divide en los distintos sintagmas y elementos de las oraciones válidas
%Para verificar si una oración es válida o no, se escribe oracion(Lista_palabras_de_la_oración,[]).

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
sintagma_verbal(Pers,Num,S0,S):-verbo_transitivo(Pers,Num,S0,S1),verbo_infinitivo(S1,S2),complemento_directo(_Pers2,_Num2,_Gend2,S2,S).

%saludoGeneral: es el saludo general para iniciar el programa NutriTec.
saludoGeneral(S0,S):-saludo(S0,S1),nombreNutriTec(S1,S).

%determinante: Son todos los artículos que pueden estár junto con un nombre.
%Estan dados por determinante(número,género,['determinante'|S],S)
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
%Estan dados por nombre(persona(generalmente t[tercera]),número,género,['nombre'|S],S)
nombre(t,s,m,['sobrepeso'|S],S).
nombre(t,p,m,['mariscos'|S],S).
nombre(t,s,f,['avena'|S],S).
nombre(t,s,m,['peso'|S],S).
nombre(t,s,f,['granola'|S],S).
nombre(t,s,f,['salchicha'|S],S).
nombre(t,s,m,['jamon'|S],S).
nombre(t,s,m,['pescado'|S],S).
nombre(t,s,m,['huevo'|S],S).
nombre(t,p,f,['verduras'|S],S).
nombre(t,s,f,['leche'|S],S).
nombre(t,s,f,['fruta'|S],S).
nombre(t,s,f,['tortilla'|S],S).
nombre(t,s,m,['queso'|S],S).
nombre(t,s,m,['pollo'|S],S).
nombre(t,s,m,['atún'|S],S).
nombre(t,s,m,['mani'|S],S).
nombre(t,s,f,['carne'|S],S).
nombre(t,s,f,['diabetes'|S],S).
nombre(t,s,f,['con','diabetes'|S],S).
nombre(t,s,f,['dislipidemia'|S],S).
nombre(t,s,f,['con','dislipidemia'|S],S).
nombre(t,s,f,['hipercolosterolemia'|S],S).
nombre(t,s,f,['con','hipercolosterolemia'|S],S).
nombre(t,s,m,['sobrepeso'|S],S).
nombre(t,s,m,['con','sobrepeso'|S],S).
nombre(t,s,m,['desnutricion'|S],S).
nombre(t,s,m,['con','desnutricion'|S],S).
nombre(t,s,m,['desnutrido'|S],S).
nombre(t,s,m,['estilo','de','vida'|S],S).
nombre(t,s,f,['vida'|S],S).
nombre(t,s,f,['dieta'|S],S).
nombre(t,s,f,['preferencia'|S],S).
nombre(t,s,m,['ciclismo'|S],S).
nombre(t,s,f,['natación'|S],S).
nombre(t,s,m,['deporte'|S],S).
nombre(t,p,f,['prefrencias'|S],S).
nombre(t,p,f,[_NumCalorias,'calorias'|S],S).
nombre(t,s,m,['activo'|S],S).
nombre(t,p,f,[_NumVeces,'veces','a','la','semana'|S],S).

%adjetivos: Son todos los adjetivos que pueden estár dados para describir un nombre de un complemento directo
%Estan dados por adjetivo(número,género,['adjetivo'|S],S)
adjetivo(s,m,['saludable'|S],S).
adjetivo(s,f,['saludable'|S],S).
adjetivo(p,m,['saludables'|S],S).
adjetivo(p,f,['saludables'|S],S).
adjetivo(s,m,['sano'|S],S).
adjetivo(p,m,['sanos'|S],S).
adjetivo(s,f,['sana'|S],S).
adjetivo(p,f,['sanas'|S],S).
adjetivo(s,f,['keto'|S],S).
adjetivo(s,f,['vegana'|S],S).
adjetivo(s,f,['pescatriana'|S],S).
adjetivo(s,f,['proteina'|S],S).
adjetivo(s,f,['proteica'|S],S).
adjetivo(s,f,['normal'|S],S).
adjetivo(s,m,['normal'|S],S).
adjetivo(s,m,[_NumVeces,'veces','a','la','semana'|S],S).

%verbo_infinitivo: verbos infinitivos que se pueden usar en conjunto con los verbos transitivos disponibles.
%Estan dados por verbo_infinitivo(['verbo_infinitivo'|S],S)
verbo_infinitivo(['llevar'|S],S).
verbo_infinitivo(['ser'|S],S).
verbo_infinitivo(['llegar'|S],S).
verbo_infinitivo(['comer'|S],S).
verbo_infinitivo(['consumir'|S],S).
verbo_infinitivo(['a', 'correr'|S],S).
verbo_infinitivo(['a', 'nadar'|S],S).
verbo_infinitivo(['a', 'caminar'|S],S).
verbo_infinitivo(['hacer'|S],S).
verbo_infinitivo(['estar'|S],S).
verbo_infinitivo(['seguir'|S],S).
verbo_infinitivo(['tener'|S],S).
verbo_infinitivo(['conseguir'|S],S).
verbo_infinitivo(['obtener'|S],S).

%verbo_transitivo: Son todos los verbos conjugados transitivos que se pueden utilizar en las oraciones
%Estan dados por verbo_transitivo(persona,número,['verbo_transitivo'|S],S)
verbo_transitivo(p,s,['salgo'|S],S).
verbo_transitivo(p,s,['corro'|S],S).
verbo_transitivo(p,s,['corro'|S],S).
verbo_transitivo(p,s,['deseo'|S],S).
verbo_transitivo(p,s,['deseo'|S],S).
verbo_transitivo(p,s,['tengo'|S],S).
verbo_transitivo(t,s,['quiere'|S],S).
verbo_transitivo(p,s,['quiero'|S],S).
verbo_transitivo(p,s,['estoy'|S],S).
verbo_transitivo(t,s,['diagnosticaron'|S],S).
verbo_transitivo(t,s,['han','diagnosticado'|S],S).
verbo_transitivo(t,s,['recomendaron'|S],S).
verbo_transitivo(t,s,['han','recomendado'|S],S).
verbo_transitivo(p,s,['había','pensado'|S],S).
verbo_transitivo(p,s,['había','calculado'|S],S).
verbo_transitivo(p,s,['prefiero'|S],S).
verbo_transitivo(p,s,['hago'|S],S).
verbo_transitivo(t,s,['gusta'|S],S).

%pronombre: Son todos los pronombre que se puede usar como sujeto de las oraciones válidas
%Estan dados por pronombre(persona,número,género,['pronombre'|S],S)
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


nombreNutriTec(['NutriTec'|S],S).

%saludo: Son todas los saludos disponibles para iniciar el programa de NutriTec
%Estan dados por saludo(['saludo'|S],S)
saludo(['Hola'|S],S).
saludo(['Buenos','dias'|S],S).
saludo(['Buenas','tardes'|S],S).
saludo(['Buenas','noches'|S],S).

%my_read: Es la función dada para leer el input del usuario,
% de tal manera que se guarde como una lista donde cada átomo es un elemento de la lista,
% ya que así se debe guardar para sea evaluado por la regla oración().
% List es la lista que contiene lo que el usuario escribió.
my_read(List):-
read_string(user,"\n","\r",_,String),
atom_string(Atom,String),
atomic_list_concat(List,' ',Atom).
