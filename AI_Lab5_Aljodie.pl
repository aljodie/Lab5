
% Facts

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(mona, herb).
parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).
parent(clancy, patty).
parent(jackie, patty).
parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).
parent(homer, lisa).
parent(marge, lisa).
parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).

% Rules

father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

son(X, Y) :-
    parent(Y, X),
    male(X).

daughter(X, Y) :-
    parent(Y, X),
    female(X).

brother(X, Y) :-
    parent(P, X),
    parent(P, Y),
    male(X),
    X \= Y.

sister(X, Y) :-
    parent(P, X),
    parent(P, Y),
    female(X),
    X \= Y.

grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

aunt(X, Y) :-
    parent(P, Y),
    sister(X, P).

uncle(X, Y) :-
    parent(P, Y),
    brother(X, P).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    brother(P1, P2).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sister(P1, P2).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).


% queries and answers


% father(abraham, homer).
% true.
% father(homer, lisa).
% true.

% mother(mona, homer).
% true.
% mother(marge, bart).
% true.

% son(homer, mona).
% true.
% son(bart, homer).
% true.

% daughter(marge, clancy).
% true.
% daughter(lisa, marge).
% true.

% brother(homer, herb).
% true.
% brother(bart, lisa).
% true.

% sister(marge, patty).
% true.
% sister(lisa, maggie).
% true.

% grandfather(abraham, bart).
% true.
% grandfather(clancy, lisa).
% true.

% aunt(patty, bart).
% true.
% aunt(selma, lisa).
% true.

% uncle(herb, bart).
% true.
% uncle(herb, lisa).
% true.

% cousin(bart, ling).
% true.
% cousin(lisa, ling).
% true.

% ancestor(abraham, maggie).
% true.
% ancestor(jackie, ling).
% true.
