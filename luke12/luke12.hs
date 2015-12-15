doubleMe x = x + x 

--Finn summen av alle tall fra og med 1 og til og med 100 000 000 som er har 7 som en divisor, og samtidig IKKE har 5 som en divisor.


sevendiv = sum [x | x <- [1..100000000], mod x 7 == 0 && mod x 5 /= 0]  