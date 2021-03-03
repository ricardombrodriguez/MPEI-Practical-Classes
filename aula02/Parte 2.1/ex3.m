%a)

fprintf("A) ");

N = 10000;
T = 1000;
k = 10;
matriz = sort(randi(T,k,N));
repeticao = any(~diff(matriz));
probColision = sum(repeticao) / N;
disp("Probabilidade de Colisão: " + probColision);

%b)

fprintf("Gráfico de B e de C");

keys = [2 5 10 20 25 40 50 60 70 80 90 100 125 150];
colisions = zeros(1,length(keys));
for k = 1 : length(keys)
    matriz = sort(randi(T,keys(k),N));
    repeticao = any(~diff(matriz));
    colisions(k) = sum(repeticao) / N;
end
subplot(2,1,1);
plot(keys,colisions,'LineWidth',2);
title("3.B) Probabilidade de haver pelo menos uma colisão em função do nº de keys");
xlabel("Nº de keys");
ylabel("Probabilidade");

%c)

k = 50;
T = [100:100:1000];
zeroColisions = zeros(1,length(T));
for t = 1 : length(T)
    matriz = sort(randi(T(t),k,N));
    repeticao = any(~diff(matriz));
    zeroColisions(t) = 1 - (sum(repeticao) / N);
end
subplot(2,1,2);
plot(T,zeroColisions,'-r','LineWidth',2);
title("3.C) Probabilidade de NÃO haver colisão com 50 keys");
xlabel("Tamanho do array");
ylabel("Probabilidade");