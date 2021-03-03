%A – a soma dos dois valores é igual a 9 (3+6)(6+3)(4+5)(5+4)
%B – o segundo valor é par
%C – pelo menos um dos valores é igual a 5
%D – nenhum dos valores é igual a 1

%a)

N = 10000;
lancamentos = randi(6,2,N);
somaNove = sum(lancamentos) == 9;
probabilidadeNove = sum(somaNove) / N;
disp("P(A): " + probabilidadeNove);

segundoPar = zeros(1,N);
segundoPar(:) = rem(lancamentos(2,:),2) == 0;
probSegundoPar = sum(segundoPar) / N;
disp("P(B): " + probSegundoPar);

iguaisCinco = sum(lancamentos == 5) > 0;
probIguaisCinco = sum(iguaisCinco) / N;
disp("P(C): " + probIguaisCinco);

comUns = sum(lancamentos == 1) > 0;
probHaverUns = sum(comUns) / N;
probSemUns = 1 - probHaverUns;
disp("P(D): " + probSemUns);

%b)

%A – a soma dos dois valores é igual a 9 
%B – o segundo valor é par
fprintf("\nB)\n");
disp("Dois acontecimentos são independentes se P(AB) = P(A)*p(B)");
disp("'A' acontece quando (3+6),(6+3),(4+5),(5+4). Existem 4 casos favoráveis em 6*6 = 36 casos prováveis");
disp("Desta forma, P(A) = 4/36 = 0.1(1)");
disp("'B' acontece quando o segundo valor for 2,4,6. Existem 6*3 = 18 casos favoráveis entre 36 casos prováveis.");
disp("Desta forma, P(B) = 18/36 = 0.5");
disp("'AB' acontece quando (3+6) ou (5+4). Existem 2 casos favoráveis entre 36 casos prováveis");
disp("Desta forma, P(AB) = 2/36 = 0.5(5)");
disp("Como P(AB) = 0.5(5) = 0.1(1) * 0.5 = P(A) * P(B) -> A e B são acontecimentos independentes");

%c)
%C – pelo menos um dos valores é igual a 5
%D – nenhum dos valores é igual a 1
fprintf("\nC)\n");
disp("Dois acontecimentos são independentes se P(CD) = P(C)*P(D)");
disp("P(C) = 5*1 + 1*5 + 1*1 / 36 = 11 / 36 = 0.30(5)");
disp("P(D) = 5*5 / 36 = 25 / 36 = 0.69(4) ");
disp("'CD' acontece quando não pode haver nenhum 1 e pelo menos um dos valores é 5");
disp("P(CD) = 1*4 (primeiro ser 5) + 4*1 (segundo ser 5) + 1*1 (primeiro e segundo serem 5) / 36 = 9 / 36 = 0.25");
disp("Como P(CD) = 0.25 e P(C)*P(D) = 0.30(5)*0.69(4) = 0.21, os acontecimentos são dependentes");





