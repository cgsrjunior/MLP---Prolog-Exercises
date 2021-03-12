:- discontiguous comanda/2.
:- discontiguous eh_um/2.
:- discontiguous aconselha/2.
:- discontiguous pertence/2.
:- discontiguous locomocao/2.

% Exercicio 1

comanda('Archer','NX-01').
eh_um('NX-01','Enterprise').

aconselha('Spock','Kirk').
comanda('Kirk','NCC-1701').
eh_um('NCC-1701','Enterprise').

aconselha('Diana','Picard').
comanda('Picard','NCC-1701-D').
eh_um('NCC-1701-D','Enterprise').

comanda('Janeway','Voyager').
eh_um('Voyager','Enterprise').

pertence('Enterprise','Federação').
locomocao('Enterprise','Motor de Dobra').
eh_um('Enterprise','Nave').

comanda('Almak','IRW TMet').
eh_um('IRW TMet','D-deridex').
pertence('D-deridex','Imperio Romulano').
eh_um('D-deridex','Nave').

% Exercicio 2

comandante(X,Y):-
    comanda(X,W),
    eh_um(W,P),
    pertence(P,Y).

% Exercicio 3

isNotEqual(A,B):- A\=B.
isEqual(A,B):- A=B.

inimigos(X,Y):-
    comandante(X,P),
    comandante(Y,Q),
    isNotEqual(P,Q).

% Exercicio 4
    
listaInimigos(C,Ls):-bagof(X,inimigos(X,C),Ls).

% Exercicio 5

listaComandantes(F,Ls):-bagof(X,comandante(X,F),Ls).

% Exercicio 6

tamanhoLstNaves([],0).
tamanhoLstNaves([Head|Tail],Q):-
    tamanhoLstNaves(Tail,Q1),
    (   \+(number(Head))
    ->  Q is Q1+1
    ;   Q = Q1
    ).

conta_naves:-write('Deseja contar as naves de qual facção?'),nl,read(X),
  listaComandantes(X,R),  
  tamanhoLstNaves(R,Q),
  write('A federação possui '),write(Q),write(' naves conhecidas').


