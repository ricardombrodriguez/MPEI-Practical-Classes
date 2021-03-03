    
p1 = 0.2/100;           %prob. da componente 1 do brinquedo ter defeito
p2 = 0.5/100;           %prob. da componente 2 do brinquedo ter defeito
pa = 1/100;             %prob. do processo de montagem do brinquedo ser insucedido
N = 10000;
pmontagem = 1/100;      %probabilidade de defeito na montagem do brinquedo

% A -> "uma caixa de brinquedos tem pelo menos 1 brinquedo com defeito"

%% 1)
%% a)

fprintf("1)\n");
n = 8;        
brinquedos = rand(3,n*N);
brinquedos = ((brinquedos(1,:) <= p1) | (brinquedos(2,:) <= p2) | (brinquedos(3,:) <= pmontagem));
caixas = zeros(1,N/n);
for k = [1 : n : n*N]
    caixas(floor(k/n)+1) = any(brinquedos(k:k+7));
end
probCaixaComDefeito = sum(caixas) / N;
disp("A probabilidade de uma caixa de brinquedos ter pelo menos 1 brinquedo com defeito é " + probCaixaComDefeito);

%% b)

brinquedos = rand(3,n*N);
brinquedos = (brinquedos(1,:) > p1 & brinquedos(2,:) > p2 & brinquedos(3,:) <= pmontagem);
probMontagemComDefeito = sum(brinquedos) / N;
disp("b) O valor médio de brinquedos defeituosos apenas devido ao processo de montagem quando ocorre A é " + probMontagemComDefeito);


%% 2)
%% a)

% B -> "Uma caixa de brinquedos não tem brinquedos com defeito"

fprintf("\n2)\n");
brinquedos = rand(3,n*N);
SemDefeito = zeros(n,N);
for k = 1:n*N
        SemDefeito(k) = (brinquedos(1,k) > p1 & brinquedos(2,k) > p2 & brinquedos(3,k) > pmontagem);
end
probB = sum(sum(SemDefeito) == 8) / N;
disp("a) Probabilidade de uma caixa de brinquedos não ter defeito: " + probB);

%% b)

p = (1-p1)*(1-p2)*(1-pa);
pk8 = p^8;
disp("b) Px(k = 8) = " + pk8);


%% c)

disp("c) ------");
valoresN = [2:20];
probabilidades = zeros(1,length(valoresN));
for n = 2:20
    brinquedos = rand(3,n*N);
    SemDefeito = zeros(n,N);
    for k = 1:n*N
        SemDefeito(k) = (brinquedos(1,k) > p1 & brinquedos(2,k) > p2 & brinquedos(3,k) > pmontagem);
    end
    probabilidades(n-1) = sum(sum(SemDefeito) == n) / N;
end
figure(101);
plot(valoresN, probabilidades);
title("Probabilidade de uma caixa com n brinquedos não ter nenhum com defeito");
xlabel("Número de brinquedos por caixa");
ylabel("Probabilidade de a caixa não ter nenhum brinquedo com defeito");

%% d)

disp("d) Quando n = 6");


%% 3)
%% a)

fprintf("\n3)\n");
n = 8;
N = 10000;
numeros = [0:8];
px = zeros(1,length(numeros));

brinquedos = rand(3,n*N);
ComDefeito = zeros(n,N);
    for k = 1:n*N
        ComDefeito(k) = (brinquedos(1,k) < p1 | brinquedos(2,k) < p2 | brinquedos(3,k) < pmontagem);
    end

for i = numeros
    px(i+1) = sum(sum(ComDefeito) == i) / N;
end

figure(102);
stem(numeros,px);

%% b)

fx = cumsum(px);
probXMaiorQue1 = fx(length(fx)) - fx(3);
disp("b) P(X >= 2) = " + probXMaiorQue1);

%% c)

valorEsperado = 0;
variancia = 0;

for n = [0:8]
    valorEsperado = valorEsperado + n*px(n+1);
    variancia = variancia + ( (n^2) * px(n+1) * (1-px(n+1)) - ( n * px(n+1) * (1-px(n+1))^2 ));
end

num = [0:8]
media = num * px';
var = px' * ((num - media).^2);

desvioPadrao = sqrt(variancia);

disp("c) Valor esperado = " + valorEsperado);
disp("Variância = " + variancia);
disp("Desvio Padrão = " + desvioPadrao);

%% d)

fprintf("\d)");
n = [8 16];
figure(103);
for i = 1:2
    fprintf("\nPara n = " + n(i) + ":");
    x = 0:n(i);
    pX = zeros(1, length(x));
    for k = 1:length(x)
        pX(k) = Defeito(p1,p2,pa,x(k),n(i),N);
    end
    subplot(2,1,i);
    stem(x, pX);
    xlabel("Nº de brinquedos com defeito");
    ylabel("pX com " + n(i) + " brinquedos por caixa");
    title("Exercício 3(a) para n = " + n(i));

    fprintf("\nb) ");
    p = sum(pX(x >= 2));
    disp("A probabilidade de X >= 2 é "+ p);

    fprintf("c) "); % distribuição binomial
    E = x * pX';
    disp("O valor esperado é "+ E);

    V = (x.^2 * pX') - E^2; % V = E[X^2] -E[X]^2
    disp("A variância é "+ V);

    dp = sqrt(V);
    disp("O desvio padrão é "+ dp);
    
    fprintf("\n-------------------------------------------------------------\n");

end