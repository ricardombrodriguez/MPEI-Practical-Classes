%% a)

fprintf("a)\n");

p = 0.3;
n = 5;
N = 10000;

amostra = rand(n,N) < 0.3;
px0 = sum(sum(amostra) == 0) / N;
px1 = sum(sum(amostra) == 1) / N;
px2 = sum(sum(amostra) == 2) / N;
px3 = sum(sum(amostra) == 3) / N;
px4 = sum(sum(amostra) == 4) / N;
px5 = sum(sum(amostra) == 5) / N;
px = [px0 px1 px2 px3 px4 px5];
num = [0:5];
subplot(2,1,1);
stem(num,px);
title("Função massa de probabilidade");

fx = cumsum(px);
subplot(2,1,2);
stairs([0 num 6],[0 fx 1]);
title("Função de distribuição acumulada");

disp("Probabilidade de ter até 2 peças defeituosas: " + fx(2));

%% b)

fprintf("\nb)\n");
disp("A função distribuição acumulada de x é o somatório de x*px (desde 0 até x).");
disp("A função distribuição acumulada de 2 (máximo de 2 peças defeituosas) é a soma de todas as funções massa probabilidade desde 0 até x = 2.");
