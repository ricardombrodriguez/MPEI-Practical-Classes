%% a)

N = 100000;                             
lancamentos = rand(4,N) > 0.5;          
px0 = sum(sum(lancamentos) == 0) / N;
px1 = sum(sum(lancamentos) == 1) / N;
px2 = sum(sum(lancamentos) == 2) / N;
px3 = sum(sum(lancamentos) == 3) / N;
px4 = sum(sum(lancamentos) == 4) / N;

px = [px0 px1 px2 px3 px4];
x = [0:4];
stem(x,px);

%% b)

fprintf("b)\n\n");
valorEsperado = x * px';
variancia = (x - valorEsperado).^2 * px';
dp = sqrt(variancia);
disp("Valor esperado: " + valorEsperado);
disp("Variância: " + variancia);
disp("Desvio padrão: " + dp);

%% c)

fprintf("\nc)\n\n");
disp("Distribuição binomial");
disp("px(k) = (nCk)*(p^k)*((1-p)^n-k)");

%% d)

fprintf("\nd)\n\n");
n = 4;
p = 0.5;
prob0 = factorial(n)/(factorial(0)*(factorial(n-0)))*(p^0)*((1-p)^(n-0));
prob1 = factorial(n)/(factorial(1)*(factorial(n-1)))*(p^1)*((1-p)^(n-1));
prob2 = factorial(n)/(factorial(2)*(factorial(n-2)))*(p^2)*((1-p)^(n-2));
prob3 = factorial(n)/(factorial(3)*(factorial(n-3)))*(p^3)*((1-p)^(n-3));
prob4 = factorial(n)/(factorial(4)*(factorial(n-4)))*(p^4)*((1-p)^(n-4));

disp("Px(0): " + prob0);
disp("Px(1): " + prob1);
disp("Px(2): " + prob2);
disp("Px(3): " + prob3);
disp("Px(4): " + prob4);

%% e)

fprintf("\ne)\n\n");
pxTeorico = [prob0 prob1 prob2 prob3 prob4];
coroas = [0:4];
valEsperadoTeorico = pxTeorico * coroas';
varianciaTeorico = sum(coroas .* (pxTeorico .* (1-pxTeorico)));
disp("Valor esperado teórico: " + valEsperadoTeorico);
disp("Variância teórica: " + varianciaTeorico);

%% f)

fx = cumsum(pxTeorico);
fprintf("\nf)\n\n");
disp("i. P(X >= 2) = " + (fx(4) - fx(2)));
disp("ii. P(X <= 1) = " + fx(1));
disp("iii. P(1 => X <= 3) = " + (fx(3) - fx(1)));
