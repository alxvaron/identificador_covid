% Determinación de covid o enfermedades relacionadas
%Álvaro Varón 
diagnosticar:-
enfermedad(Enfermedad),
write('Probablemente el paciente sufre de '),
write(Enfermedad),
nl,
write('Guardar reposo!'),
deshacer.

/*Definición de enfermedades a probar*/
enfermedad(resfriado) :- resfriado.
enfermedad(gripe) :- gripe.
enfermedad(covid) :- covid.
enfermedad(enfermedad_desconocida):- enfermedad_desconocida. /* sin diagnostico*/

/*Reglas de identificacion*/
resfriado :-
sintoma(escalofrío),
sintoma(secrecion_nasal),
sintoma(estornudo),
sintoma(dolor_garganta),
write('Probablemente no tenga covid, sin embargo debe seguir este procedimiento médico:'),
nl,
write('1: Acetaminofem/tableta 500g c/8h'),
nl,
write('4: Gárgaras de sal'),
nl,
write('3: Aerosol nasal / beclometasona 2 disparos / 6 horas'),
nl,
write('El paciente debe mantenerse abrigado y evitar cambios de clima drásticos, así como actividades de esfuerzo físico.'),
nl.

gripe :-
sintoma(fiebre),
sintoma(dolor_cabeza),
sintoma(dolor_cuerpo),
sintoma(malestar_general),    
write('Probablemente no tenga covid, sin embargo debe seguir este procedimiento médico:'),
nl,
write('1: Acetaminofem/tableta 500g c/8h'),
nl,
write('2: amoxicilina/tableta 500g c/8h'),
nl,
write('3: Gárgaras de sal 3 veces por día.'),
nl,
write('El paciente debe tomar baños tibios y evitar actividades de esfuerzo físico.'),
nl.

covid :-
sintoma(dolor_cabeza),
sintoma(tos_seca),
sintoma(cansancio),
sintoma(fiebre),
sintoma(dificultad_respiratoria), 
sintoma(dolor_o_presion_pectoral),
    
write('El paciente debe aíslarse, evitar contacto con otros y seguir este procedimiento:'),
nl,
write('1: Buscar atención médica inmediata'),
nl,
write('2: Llamar a su centro de atención sanitaria antes de presentarte en el lugar en cuestión'),
nl,
write('3: Alertar a personas con quienes haya interactuado en los últimos 7 días'),
nl.

enfermedad_desconocida :-
write('El paciente no posee síntomas relacionados con covid-19 o enfermedades afines.'),
nl.

/* Se realizan las preguntas entrada-usuario para identificar los síntomas */
preguntar(Pregunta) :-
write('El paciente tiene los siguentes sintomas:'),
write(Pregunta),
write('? '),
read(Respuesta),
nl,
( (Respuesta == si)
->
assert(si(Pregunta)) ;
assert(no(Pregunta)), fail).

:- dynamic si/1,no/1.
/*Determina si los sintomas estan relacionados a una enfermedad */
sintoma(S) :-
(si(S)
->
true ;
(no(S)
->
fail ;
preguntar(S))).


/* deshacer all si/no aciertos*/
deshacer :- retract(si(_)),fail.
deshacer :- retract(no(_)),fail.
deshacer.
