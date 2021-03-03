%% 1
%% a)

fprintf("a)");

x0 = [0 1]';     %0 - > Faltar    1 -> Não faltar

% F - "faltou"
%     F   !F
%  F 0.2  0.3
% !F 0.8  0.7

matriz = [0.2 0.3; 0.8 0.7];

p = matriz^2 * x0;
disp("Probabilidade de estar na quarta da anterior e na quarta da atual: " + p(2));

%% b)

fprintf("b)");

x0 = [1 0]';    %1 -> Faltar      %0 -> Não faltar   
p = matriz^2 * x0;
disp("Probabilidade de faltar na quarta da anterior e ir à quarta da atual: " + p(2));

%% c)

fprintf("c)");

x0 = [0 1]';
p = matriz^(15*2)*x0;
disp("Probabilidade de ir à primeira e ir à última aula (15 semanas depois): " + p(2));

%% d)

x0 = [0.15 0.85]';
probFaltar = zeros(1,30);
probFaltar(1) = x0(1);
p = x0;
for k = 2 : 30
    p = matriz * p;
    probFaltar(k) = p(1);
end
plot([1:30],probFaltar);
