1{action(down, T); action(up, T); action(right, T); action(left, T)}1 :- time(T), not finished(T).
#show state_at/2.
 #show action/2.

cell((0..18, 0..7)).
#minimize{1, X, T: action(X,T)}.
adjacent(right, (X+1,Y),(X,Y))   :- cell((X,Y)), cell((X+1,Y)).
adjacent(left,(X,Y),  (X+1,Y)) :- cell((X,Y)), cell((X+1,Y)).
adjacent(down, (X,Y+1),(X,Y))   :- cell((X,Y)), cell((X,Y+1)).
adjacent(up,   (X,Y),  (X,Y+1)) :- cell((X,Y)), cell((X,Y+1)).

wall((4, 4)).

wall((3, 0)).

wall((5, 4)).

wall((5, 0)).

wall((4, 0)).

wall((0, 3)).

wall((0, 4)).

wall((0, 5)).

wall((0, 2)).

wall((4, 7)).

wall((5, 7)).

wall((6, 7)).

wall((6, 4)).

wall((7, 7)).

wall((8, 7)).

wall((7, 4)).

wall((3, 7)).

wall((2, 7)).

wall((8, 4)).

wall((9, 7)).

wall((11, 6)).

wall((10, 7)).

wall((11, 5)).

wall((13, 3)).
link_start((12,6)). link_dest((14,1)). 

wall((14, 2)).

wall((13, 1)).

wall((14, 0)).

wall((15, 2)).

wall((15, 0)).

wall((16, 2)).

wall((16, 0)).
%START
state_at(V0, T+1) :- time(T), link_dest(V0), action(down, T).
state_at(V1, T+1) :- time(T), adjacent(left, V0, V1), state_at(V0, T), action(right, T), not wall(V1).
state_at(V0, T+1) :- time(T), adjacent(left, V0, V1), state_at(V1, T), action(left, T), not wall(V0).
state_at(V1, T+1) :- time(T), adjacent(up, V0, V1), state_at(V0, T), action(down, T), not wall(V1).
state_at(V0, T+1) :- time(T), adjacent(up, V0, V1), state_at(V1, T), action(up, T), not wall(V0).
state_at(V0, T+1) :- time(T), adjacent(left, V0, V1), state_at(V0, T), action(right, T), wall(V1).
state_at(V1, T+1) :- time(T), adjacent(left, V0, V1), state_at(V1, T), action(left, T), wall(V0).
state_at(V0, T+1) :- time(T), adjacent(up, V0, V1), state_at(V0, T), action(down, T), wall(V1).
state_at(V1, T+1) :- time(T), adjacent(up, V0, V1), state_at(V1, T), action(up, T), wall(V0).

%END
finished(T):- goal(T2), time(T), T >= T2.
 goal(T):- state_at((17, 1), T), not finished(T-1).
goalMet:- goal(T).
:- not goalMet.
%AAA
state_at((3, 5), 0).
%BBB
%CCC
time(0..250).
%DDD
%ANSWER SETS

%state_at((3,5),0)
%state_at((14,1),1)
%action(down,0)
%state_at((3,6),1)
%action(right,3)
%action(right,2)
%state_at((15,1),2)
%action(right,1)
%state_at((4,6),2)
%state_at((16,1),3)
%state_at((5,6),3)
%state_at((17,1),4)
%state_at((6,6),4)
