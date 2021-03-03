%% a)

lambda = 15;
k = 0;
pk0 = lambda^k * exp(-lambda) / factorial(k)
disp("Probabilidade de o servidor não receber nenhuma mensagem: " + pk0);

%% b)

fprintf("\nb) ");
% [1:11] mensagens recebidas

pX = zeros(1, 11);
for i = 1: 11
   k = i -1;
   pX(i) = lambda^k * exp(-lambda) / factorial(k); % lei de Poisson
end
prob = 1 - sum(pX);

fprintf("a probabilidade de, num intervalo de um segundo, o servidor receber mais de 10 mensagens é "+ prob +"\n");