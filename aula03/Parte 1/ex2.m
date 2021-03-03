%% a)

%      A    B    C
% A   1/3  1/4   0
% B   1/3 11/20 1/2
% C   1/3  1/5  1/2

matriz = [1/3 1/4 0; 1/3 11/20 1/2; 1/3 1/5 1/2];
matriz = matriz./sum(matriz);

%% b)

x0 = [60 15 15]';

%% c)

p = matriz^30 * x0;
disp("c) Número de elementos no fim da aula 30:");
fprintf("Grupo A: " + p(1) + "\nGrupo B: " + p(2) + "\nGrupo C: " + p(3) +"\n");

%% d )

x0 = [30 30 30]';
p = matriz^30 * x0;
disp("d) Número de elementos no fim da aula 30 (com grupos equitativos):");
fprintf("Grupo A: " + p(1) + "\nGrupo B: " + p(2) + "\nGrupo C: " + p(3) +"\n");