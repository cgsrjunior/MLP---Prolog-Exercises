pessoa(ana).
pessoa(joao).
pessoa(andre).
pessoa(carla).
gosta(ana, futebol).
gosta(andre, futebol). 

ultimo([X]):-
    write(X).

ultimo([_|Tail]):-
    ultimo(Tail).

reverte([],List1,List1).
reverte([Head|Tail],List1,List2):-reverte(Tail,[Head|List1],List2).
inverte(List, Reverse):-reverte(List,[],Reverse).


contaClausulas(Elem, R):- aggregate_all(count, call(Elem, _), R).

fibo(0, 1) :- !.
fibo(1, 1) :- !.
fibo(N, F) :-
        N > 1,
        N1 is N-1,
        N2 is N-2,
        fibo(N1, F1),
        fibo(N2, F2),
        F is F1+F2.

imprimeLst([Head|Tail]):-
	write(Head),
	nl,
	imprimeLst(Tail).

tamanhoLstGosto([],0).
tamanhoLstGosto([Head|Tail],Q):-
    tamanhoLstGosto(Tail,Q1),
    (   \+(number(Head))
    ->  Q is Q1+1
    ;   Q = Q1
    ).

lstPessoasQueGostam(G, R):- setof(P, gosta(P, G), R).

le_gosto:-write('Qual gosto deseja consultar:'),nl,read(X),
  lstPessoasQueGostam(X,R),  
  tamanhoLstGosto(R,Q),
  write('Numero de pessoas encontradas: '),write(Q),nl,
  imprimeLst(R).
