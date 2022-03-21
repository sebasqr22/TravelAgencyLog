
print_diet :- 
  dieta(X), write(X), fail.

miembro(H,[H|_T]).
miembro(X,[_H|T]) :-  miembro(X,T).

% tipos: proteina, keto, vegana, pescatariana
posibles_tipos([proteina, keto, vegana, pescatariana, []]).
% calorias: 1200-4200
% padecimientos: diabetes, dislipidemia, hipercolesterolemia, sobrepeso, desnutrido
posibles_padecimientos([diabetes, dislipidemia, hipercolesterolemia, sobrepeso, desnutrido, []]).
% actividad: 0, 1, 2, 3, 4, 5, 6, 7 (veces a la semana)
posibles_actividades([0, 1, 2, 3, 4, 5, 6, 7]).
% comidas: la comida que traigan
posibles_comidas(['gallo pinto', avena, granola, salchicha, 'jamón', pescado, carne, huevo, verduras, aguacate, leche, 'maní', fruta, papa, carne, tortilla, queso, pollo, 'atún']).

%%% Regañadas
dieta('Es necesario aumentar la actividad física si desea consumir tantas calorías diarias'):-
  calorias(Cal), (Cal >= 3000),
  actividad(A), (A =< 1).

dieta('Es imposible asignarle una dieta vegana si no le gustan los vegetales'):-
  tipo(X), X = vegana, comida(C), C = vegetales.

dieta('Es imposible asignarle una dieta pescatariana si no le gusta el pescado'):-
  tipo(X), X = pescatariana, comida(C), C = pescado.

dieta('Si padece de sobrepeso no debe consumir tantas calorías diarias'):-
  padecimientos(X), X = sobrepeso, calorias(Cal), (Cal >= 3000).

dieta('Si está desnutrido debe consumir más calorías diarias'):-
  padecimientos(X), X = desnutrido, calorias(Cal), (Cal < 2000).

dieta('Para mantener tanta actividad física debe de consumir más calorías'):-
  calorias(Cal), (Cal =< 2000),
  actividad(A), (A >= 4).

%%% DIETA 1
dieta('Su dieta sería:
Desayuno:  4 Huevos picados con verduras. 
  1 de aguacate. 
Merienda Mañana: 1 taza leche. 
  1 taza de fruta. 
1 cdta de mantequilla de maní. 
Almuerzo:  1 taza de vegetales salteados. 
  1 taza de pure de papas. 
1 bistec encebollado (300g) 
Merienda tarde:  1 taza de café o té. 
  2 tortillas del Fogon. 
30g de queso. 
  1 Fruta. 
Cena:  1 taza de ensalada. 
  300g de pollo a la plancha. 
1 lata de atún mediana en agua.') :-
  tipo(T), /*write('Tipo:'),tab(1), write(T), nl,*/ miembro(T, [proteina, keto, []]),
  calorias(Cal), (Cal=<4000, Cal>=2900), /*write('Calorías:'),tab(1), write(Cal), nl,*/
  padecimientos(P), miembro(P, [desnutrido, diabetes, dislipidemia, []]), /*write('Padecimiento:'),tab(1), write(P), nl,*/
  actividad(A), miembro(A, [3, 4, 5, 6, 7]), /*write('Nivel de actividad:'), tab(1), write(A), nl,*/
  comida(C), not(miembro(C, [huevo, verduras, aguacate, leche, 'maní', fruta, papa, carne, tortilla, queso, pollo, 'atún'])).

%%% DIETA 2
dieta('Su dieta sería:
Desayuno:  ½ taza de gallo pinto. 
  1 Huevo + rebanada de queso blanco. 
1 cdta de aceite de oliva para preparar el huevo. 
Merienda Mañana: ½ taza de yogurt light. 
  ¼ taza de granola sin azúcar añadida.
1 taza de papaya picada. 
Almuerzo:  2 tazas de ensalada Mixta 
1/3 taza de arroz + ½ taza de frijoles, garbanzos o lentejas. 
  1 Filet de pescado a la plancho 
  Merienda tarde:  1 taza de café o té. 
2 Rebanadas de pan Integral. 
  30g de atún en agua. 
1 cdta de margarina. 
Cena:  2 tazas de ensalada verde mixta. 
  1 tortilla de trigo. 
1 lata de atún mediana en agua. 
  1/8 de aguacate. ') :-
    tipo(T), miembro(T, [pescatariana, []]), 
    calorias(Cal), (Cal<3000, Cal>=2000), 
    padecimientos(P), miembro(P, [sobrepeso, desnutrido, diabetes, dislipidemia, []]), 
    actividad(A), miembro(A, [0, 1, 2, 3]), 
    comida(C), not(miembro(C, [huevo, queso, aguacate, leche, frijoles, fruta, garbanzos, papaya, lenteja, pescado, 'atún', queso, tortilla])).

%%% DIETA 3
dieta('Su dieta sería:
Desayuno:  1 taza de gallo pinto o avena.
Merienda Mañana: 1 taza de frutas con granola.
Almuerzo:  Sopa de garbanzos,
con 1 taza de vegetales.
  Merienda tarde:  1 taza de café o té. 
tortillas con queso de soya.
Cena:  1 taza de ensalada
Pasta con salsa de tomate.') :-
  tipo(T), miembro(T, [vegana, []]), 
  calorias(Cal), (Cal=<2600, Cal>=1200), 
  padecimientos(P), miembro(P, [hipercolesterolemia, sobrepeso, diabetes, dislipidemia, []]), 
  actividad(A), miembro(A, [0, 1, 2, 3]), 
  comida(C), not(miembro(C, ['gallo pinto', verduras, garbanzos, avena, fruta, tortilla, queso, soya])).

%%% DIETA 4
dieta('Su dieta sería:
Desayuno:  3 huevos.
Merienda Mañana: 1 taza leche. 
  1 cdta de mantequilla de maní. 
Almuerzo:  Salchichas con jamón. 
  Merienda tarde: 100g de queso.
Cena: Filet de carne.') :-
  tipo(T), miembro(T, [keto, []]), 
  calorias(Cal), /*write('Calorías: '), write(Cal),*/ (Cal<2700, Cal>=1600), 
  padecimientos(P), miembro(P, [sobrepeso, []]), 
  actividad(A), miembro(A, [0, 1, 2, 3, 4, 5]), 
  comida(C), not(miembro(C, [huevo, leche, 'maní', salchicha, 'jamón', queso, carne])).

%%% DIETA 5
dieta('Su dieta sería:
Desayuno:  2 tazas de gallo pinto
1 de aguacate. 
Merienda Mañana: 1 taza de fruta.
  3 cdta de mantequilla de maní. 
Almuerzo:  1 taza de vegetales salteados. 
  1 taza de pure de papas. 
3 tazas de garbanzos.
Merienda tarde:  1 taza de café o té. 
  1 Granola.
1 Fruta. 
Cena:  1 taza de ensalada. 
  2 tazas de garbanzos.
.') :-
  tipo(T), /*write('Tipo:'),tab(1), write(T), nl,*/ miembro(T, [vegana, proteina, pescatariana, []]), 
  calorias(Cal), /*write('Calorías:'),tab(1), write(Cal), nl,*/ (Cal=<3900, Cal>=2400), 
  padecimientos(P), miembro(P, [hipercolesterolemia, desnutrido, diabetes, dislipidemia, []]), /*write('Padecimiento:'),tab(1), write(P), nl, */
  actividad(A), miembro(A, [2, 3, 4, 5, 6, 7]), /*write('Nivel de actividad:'), tab(1), write(A), nl, */
  comida(C), /*write('comidas:'),tab(1),write(C), nl,*/ not(miembro(C, ['gallo pinto', aguacate, fruta, 'maní', vegetales, papa, garbanzos, granola, fruta])).