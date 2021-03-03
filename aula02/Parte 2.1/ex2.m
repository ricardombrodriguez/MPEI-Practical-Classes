% a)

fprintf("A)");

N = 10000;
alvos = 100;
dardos = 20;

matriz = randi(alvos,dardos,N);           %gerar matriz (dardos x N) com numeros de 1 até alvos (100)
lancamentos = sort(matriz);               %ordenar valores da matriz por coluna
repeticao = any(~diff(lancamentos));      %diff calcula a diferença entre valores adjacentes da coluna, ~diff dá 1 se os valores forem iguais (diferença dá 1) e caso se verifique valores iguais então a coluna vai ter o valor 1
probSimulacao = sum(repeticao) / N;       %soma de colunas que possuem valores iguais (alvo repetido) sobre N  
probFinal = 1 - probSimulacao;            %probabilidade de não ter alvos repetidos
disp("Probabilidade de nenhum alvo ter sido atingido mais do que uma vez: " + probFinal);

% b)

fprintf("B)");
disp("Probabilidade de pelo menos 1 alvo ter sido atingido 2 ou mais vezes: " + probabilidadeRepetidos(matriz,N,alvos,dardos));

% c)

fprintf("Gráficos do exercício C e D");

alvos = 1000;
dardos = [10:10:100];
x = zeros(length(dardos));
for d = dardos
    matriz = randi(alvos,d,10000);
    x(d/10) = probabilidadeRepetidos(matriz,10000,alvos,d);
end
subplot(3,1,1);
plot(dardos,x,'LineWidth',2);
title("Ex 2.c) Probabilidade de alvo ter sido repetido 2 ou mais vezes com m = 1000 alvos");
xlabel("Número de dardos");

alvos = 100000;  
y = zeros(length(dardos));
for d = dardos
    matriz = randi(alvos,d,10000);
    y(d/10) = probabilidadeRepetidos(matriz,10000,alvos,d);
end
subplot(3,1,2)
plot(dardos,y,'-r','LineWidth',2);
title("Ex 2.c) Probabilidade de alvo ter sido repetido 2 ou mais vezes com m = 100000 alvos");
xlabel("Número de dardos");
ylabel("Probabilidade de alvo repetido 2 ou mais vezes");


%d)

dardos = 100;    %dardos
alvos = [200 500 1000 2000 5000 10000 20000 50000 100000];   %alvos
probabilidades = zeros(1,length(alvos));

for n = 1 : length(alvos)
    matriz = randi(alvos(n),dardos,10000);
    probabilidades(n) = probabilidadeRepetidos(matriz,10000,alvos(n),dardos);
end
subplot(3,1,3);
plot(alvos,probabilidades,'-y','LineWidth',2);
title("Ex 2.d) Probabilidade de alvo ter sido repetido 2 ou mais vezes com m = 100 dardos");
xlabel("Número de alvos");


function probRepetidos = probabilidadeRepetidos(matriz,N,alvos,dardos)
    repetidos = zeros(1,N);         
    for i = 1 : N
        [gc, gr] = groupcounts(matriz(:,i));
        repetidos(i) = sum(gc > 1); 
    end
    probRepetidos = sum(repetidos > 0) / N;
end


