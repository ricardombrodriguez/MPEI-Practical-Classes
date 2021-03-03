%% a)

matriz = [ 0.8 0 0 0.3 0;
           0.2 0.6 0 0.2 0;
           0 0.3 1 0 0;
           0 0.1 0 0.4 0;
           0 0 0 0.1 1];
           
%% b)

fprintf("b)");
x0 = [1 0 0 0 0]';
for n = 1 : 100
    m = matriz^n*x0;
    disp("N = " + n + ": " + m(2));
end

%% c)

x0 = [1 0 0 0 0]';
estado3 = zeros(1,100);
estado5 = zeros(1,100);
for n = 1 : 100
   m = matriz^n*x0;
   estado3(n) = m(3)*100;
   estado5(n) = m(5)*100;
end
xlabel = [1:100];
plot(xlabel,estado3,'-g',xlabel,estado5);

%% d)

% o estado 3 e o estado 5 são estados absorventes (só queremos o 1,2 e 4)
fprintf("d)");

Q = [matriz(1,1:2) matriz(1,4);
     matriz(2,1:2) matriz(2,4);
     matriz(4,1:2) matriz(4,4)]
 
 %% e)
 
 % eye -> matriz identidade com tamanho n x n
 fprintf("e)");
 
 resultado = eye(length(Q)) - Q;
 F = inv(resultado)
 
 %% f)
 
fprintf("f)\n");
ti = zeros(1,3);
ti(:) = sum(F);
disp("Média do número de passos até à absorção do estado 1: " + ti(1) + " | Do estado 2: " + ti(2) + " | Do estado 4: " + ti(3));

%% g)

% B = R x F;
fprintf("g)\n");

R = [matriz(3,1:2) matriz(3,4);
     matriz(5,1:2) matriz(5,4)];

B = R*F
x0 = [1 0 0]';

B_estado1 = B*x0;

disp("Probabilidade de absorção do estado 3 começando no estado 1: " + B_estado1(1));
disp("Probabilidade de absorção do estado 5 começando no estado 1: " + B_estado1(2));
