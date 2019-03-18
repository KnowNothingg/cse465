/*
           QUADRATIC

The real roots of Ax^2+Bx+C=0 are returned in the list named ROOTS. If there are
two roots, they are arranged in ascending order.

Successful queries:
 quadratic(2,5,2,[-2.0,-0.5]).     
 quadratic(1,2,1,[-1.0]).
 quadratic(1,2,1, X).    % binds X to [-1.0]

Unsuccessful queries:
 quadratic(3,0,4,X).      % fails because no real roots
*/

quadratic(A, B, C, ROOTS) :- D is ((B*B) - (4*A*C)), (
    D < 0 -> fail; 
    D = 0, X is (-B)/(2*A), ROOTS = [X] ;
     E is sqrt(D), X1 is (-B-E)/(2*A), 
      X2 is (-B+E)/(2*A), ROOTS=[X1,X2]
).

/*
          MAX3

The first three parameters are bound numbers. The last parameter is a bound number
or a variable. The result is that last parameter is bound to the maximum of the three
numbers.

Successful queries:
 max3(1,2,3,3).     
 max3(1,2,3,X).     % X bound to 3

Unsuccessful queries:
 max3(1,2,3,0).     
*/

max3(A, B, C, MAX) :- (
    A =< B
    -> max2(B, C, MAX)
    ; max2(A, C, MAX)
).

max2(X, Y, MAX) :- (
    X =< Y
    -> MAX = Y
    ; MAX = X
).

/*
          ISSORTED

The parameter is a flat list of numbers. The rule succeeds if the number are in
ascending order.

Successful queries:
 isSorted([1,2,2]).     
 isSorted([]).

Unsuccessful queries:
 isSorted([1,2,1]).     
 isSorted([1,2,3,4,3,6,7]). 
*/

isSorted([]) :- true. 
isSorted([H]) :- true. 
isSorted([H1, H2 | T ]) :- H2 >= H1, isSorted([H2 | T]).

/*
         MAXOFLIST

The first parameter is a bound, flat, list of numbers. The second parameter corresponds
to the maximum value of the list. The query fails if the list is empty.

Successful queries:
 maxOfList([1,9,2,2], 9).     
 maxOfList([1,9,2,2], X).     % X bound to 9 
 maxOfList([1], 1).

Unsuccessful queries:
 maxOfList([], 0).     
 maxOfList([1,2,3,4,3,6,7], 1).
*/

maxOfList([H] , MAX) :- MAX is H. 
maxOfList([H], MAX) :- H >= MAX -> MAX is H ; MAX is MAX. 
maxOfList(LST, MAX) :- maxOfList1(LST, 0, MAX).

maxOfList1([H | T], NUM, MAX) :- H >= NUM -> maxOfList1(T, H, MAX) ; maxOfList1(T, NUM, MAX). 
maxOfList1([], MAX, MAX). 

/*
          SUMMATION

The first parameter is a flat list of numbers. The last parameter corresponds to the
summation of all of the numbers.

Sample successful queries:
 summation([1,2,2], 5).     
 summation([], 0).
 summation([1,2,2], X).     % X bound to 5

Sample unsuccessful queries:
 summation([1,2,1], 10).     
*/

summation(LST, SUM) :- summation1(LST, SUM, 0).

summation1([H|T], SUM, NEW) :- TEMP is H + NEW, summation1(T, SUM, TEMP).
summation1([], NEW, NEW). 

/*
           REMOVEKTH

The first parameter is a bound integer K. The second paramter is a abound list. The
third parameter is the same as the original list, but with the kth element removed,
where numbering starts at 1. The query fails if k is an invalid number.

Successful queries:
 removeKth(1, [a,b,c,d], [b,c,d]).
 removeKth(1, [a,b,c,d], L).		% binds L to [b,c,d]
 removeKth(3, [a,b,c,d], L).		% binds L to [a,b,d]

Unsuccessful queries:
 removeKth(10, [a,b,c,d], L).
 removeKth(0, [a,b,c,d], L).
 removeKth(-2, [a,b,c,d], L).
*/

removeKth(0, LST, NEWLST) :- fail. 
removeKth(1, [H|T], NEWLST) :- NEWLST = T, !. 
removeKth(K, [H|T], [H|X]) :- NEWK is K - 1, removeKth(NEWK, T, X), !. 

/*
         SPLITABLE

Succeeds if the list of integers can be cleved into two sublists that both sum to the same value.

Successful queries:
 splitable([1,2,3,4,10]).
 splitable([2,1,1]).
 splitable([0]).
Unsuccessful queries:
 splitable([1,4,8]).
 splitable([1,3,2]).
 splitable([2,2,1,1]).
*/ 

splitable(LST) :- splitable1(LST, 0, LST), !.

splitable1([], SUM, LST) :- X is SUM/2, splitable2(LST, X, 0.0). 
splitable1([H|T], SUM, LST) :-  SUM2 is SUM + H,  splitable1(T, SUM2, LST). 

splitable2(LST, SUM, SUM). 
splitable2([H|T], SUM, NEWS) :- X is NEWS + H, splitable2(T, SUM, X).

/*
        DOMINOS

Each domino is unique and is oriented left to right, but can be flipped. So, the domino
3-4 can appear as 4-3. The dominos in this particular rendition of the game are:
         1-4  4-2  9-8  7-8  15-7  10-12  2-12  10-4
These dominos are shown below. When you submit, the dominos must appear as they are
originally given to you.
*/

dom(1, 4).
dom(4, 2).
dom(9, 8).
dom(7, 8).
dom(15, 7).
dom(10, 12).
dom(2, 12).
dom(10, 4).

dom(100, 101).

dom(50, 51).
dom(52, 51).
dom(53, 52).
dom(55, 54).
dom(55, 55).
dom(54, 56).
dom(56, 53).
dom(55, 60).
dom(55, 61).
dom(60, 51).

/*
The dominos can be sequenced if the numbers on the adjacent dominos match. For example,
here is a legal sequence of three dominos: 4-2 2-12 12-10
The game is played by determining if a sequence of dominos exist that start and end with
particular values. For example, there exists a sequence of dominos that start with 4 and
end with 10. Write a rule that succeeds if a sequence exists. The dominos can be used
at most once in a sequence.

Successful queries:
 dominos(4, 10).
 dominos(10, 4).
 dominos(15, 7).
 dominos(7, 9).

Unsuccessful queries:
 dominos(1, 15).
 dominos(15, 1).
*/

dominos(START, END) :- dom(START, END).
dominos(START, END) :- dom(END, START).
dominos(START, END) :- L = [], dominos1(START, END, L). 

dominos1(END, END, LST) :- !.
dominos1(START, END, LST) :- dom(START, SECOND), contains(LST, dom(START, SECOND)), L = [dom(START, SECOND)|LST], dominos1(SECOND, END, L). 
dominos1(START, END, LST) :- dom(SECOND, START), contains(LST, dom(SECOND, START)), L = [dom(SECOND, START)|LST], dominos1(SECOND, END, L). 

contains([H|T], X) :- H \= X, contains(T, X). 
contains([], X). 

/*
       MTH COUSINS N TIMES REMOVED

Here are the parental relationships (see Google Docs file "GenerationNames").
The abbreviations used are based on females:
         D = daughther, A = aunt, N = niece, M = mother
So, ggm corresponds to great-grandmother. gn corresponds to great niece.
When you submit, the family relationships must appear exactly as the are originally
given to you.
*/ 

parent(gggm, ggm).
parent(ggm, gm).
parent(gm, m). 
parent(m, self).
parent(self, d).
parent(d, gd).

parent(gggm, gga). parent(gga, c12a). parent(c12a, c21a). parent(c21a, c3).
parent(ggm, ga). parent(ga, c11a). parent(c11a, c2).
parent(gm, a). parent(a, c1).

parent(m, s).

parent(s, n). parent(n, gn).
parent(c1, c11b). parent(c11b, c12b).

parent(c2, c21b). parent(c21b, c22).
parent(c3, c31). parent(c31, c32).

/*
Succeeds if P1 and P2 are Mth cousins N times removed.
M and N must be bound to integers when the query is issued.

Successful queries:
 mthCousinNTimesRemoved(self, c3, 3, 0).
 mthCousinNTimesRemoved(self, c31, 3, 1).
 mthCousinNTimesRemoved(self, c32, 3, 2).

 mthCousinNTimesRemoved(self, c2, 2, 0).
 mthCousinNTimesRemoved(self, c21a, 2, 1).
 mthCousinNTimesRemoved(self, c21b, 2, 1).
 mthCousinNTimesRemoved(self, c22, 2, 2).

 mthCousinNTimesRemoved(self, c1, 1, 0).
 mthCousinNTimesRemoved(self, c11a, 1, 1).
 mthCousinNTimesRemoved(self, c11b, 1, 1).
 mthCousinNTimesRemoved(self, c12a, 1, 2).
 mthCousinNTimesRemoved(self, c12b, 1, 2).

 mthCousinNTimesRemoved(c1, c2, 2, 0).
 mthCousinNTimesRemoved(c2, c1, 2, 0).
 mthCousinNTimesRemoved(c11b, c32, 3, 1).
 mthCousinNTimesRemoved(c32, c11b, 3, 1).

Sample unsuccessful queries:
 mthCousinNTimesRemoved(self, gn, 1, 2).
 mthCousinNTimesRemoved(self, s, 1, 0).
 mthCousinNTimesRemoved(gd, ggm, 1, 1).
*/

mthCousinNTimesRemoved(P1, P2, M, N) :- fail.

/* 
         SENTENCE 

This problem is exactly as described in the "parse.pl" code. The difference here is 
that the number (i.e., plurality) of the noun phrase and verb phrase must match. That
is, "The sun shines" and "The suns shine" is proper, whereas "The suns shines" and
"The sun shine" are not. Make sure your code includes the following vocabulary:

singular nouns:    sun, bus, deer
plural nouns:      suns, buses, deer
articles:          a, an, the
adverbs:           loudly, brightly
adjectives:        yellow, big, brown
plural verbs:      shine, run, eat
singular verbs:    shines, runs, eats

Successful queries:
 sentence([the, sun, shines]).	
 sentence([the, yellow, sun, shines]).	
 sentence([the, yellow, suns, shine]).

Unsuccessful queries:
 sentence([the, yellow, suns, shines]).
 sentence([the, yellow, sun, shine]). 


 s as plural.  eg: nouns, verbs, articles
 */ 

noun([sun]).
noun([bus]).
noun([deer]).

nouns([suns]).
nouns([buses]).
nouns([deer]).

verbs([shine]).
verbs([run]).
verbs([eat]).

verb([shines]).
verb([runs]).
verb([eats]).

thearticle([the]).

article([a]).
article([an]).

adjective([big]).
adjective([yellow]).
adjective([brown]).

adverb([brightly]).
adverb([loudly]).

sentence(S) :- append(NP, VP, S), np(NP), vp(VP).
sentence(S) :- append(NP, VP, S), nps(NP), vps(VP). 

np(NP) :- np2(NP). 
np([ART|NP])    :- thearticle([ART]), np2(NP). 
np([ART|NP]) :- article([ART]), np2(NP).     

nps([ART|NP])   :- thearticle([ART]), np2s(NP). 
nps(NP) :- np2s(NP). 


np2(NP2) :- noun(NP2).                 
np2([ADJ|NP2]) :- adjective([ADJ]), np2(NP2).  

np2s(NP2) :- nouns(NP2).               
np2s([ADJ|NP2]) :- adjective([ADJ]), np2s(NP2).      


vp(VP) :- verb(VP). 
vp([VERB|ADV]) :- verb([VERB]), adverb(ADV).

vps(VP) :- verbs(VP).
vps([VERB|ADV]) :- verbs([VERB]), adverb(ADV). 
