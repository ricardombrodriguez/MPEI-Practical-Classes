%90 notas de 5 euros, 9 notas de 50 e 1 de 100

%a)
S = 90 + 9 + 1;
prob5 = 90 / S;
prob50 = 9 / S;
prob100 = 1 / S;

disp("Espaço de amostragem (S): " + S);
disp("Probabilidade de retirar nota de 5: " + prob5);
disp("Probabilidade de retirar nota de 50: " + prob50);
disp("Probabilidade de retirar nota de 100: " + prob100);

%b)
subplot(2,1,1);
notas = [5 50 100];
probNotas = [prob5 prob50 prob100];
stem(notas,probNotas);

%c)
subplot(2,1,2);
fx = cumsum(probNotas);
stairs([0 notas 120],[0 fx 1]);

