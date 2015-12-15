%Vi definerer et knalltall til å være et positivt heltall der primtallsfaktorene
% kun kan være 2, 3 eller 5. Unntaket er tallet 1 som også er definert 
%til å være et knalltall. positive tall der primfaktorene kun inneholder 2, 3 eller 5.
% I tillegg er tallet 1 også regnet som det første knalltallet. 

%Listen over de 10 første knalltallene er: [1, 2, 3, 4, 5, 6, 8, 9, 10, 12]

%Oppgaven går ut på å finne knalltall nummer 10000.
-module(luke13).
-compile(export_all).

%X = tallet så langt
%N = Antall knalltall funnet
%M = hvilket knalltall jeg vil finne

knalltall(M) ->
 	knalltall(1, 1, M).

knalltall(X, N, M) when N =< M ->
		%io:fwrite("~p, ~p ~n", [X, N]),
		knalltall(X + 1, N + knall(X), M);

knalltall(X, N, M) when N > M ->
 	X-1.



knall (1) ->
	1;

knall(Y) when Y > 1 ->
 	if Y rem 2 == 0 -> knall ( Y div 2);
 	   Y rem 3 == 0 -> knall(Y div 3);
 	   Y rem 5 == 0 -> knall(Y div 5);
	   true -> 0
 	end.
