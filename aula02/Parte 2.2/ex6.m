p = 1/1000; % prob de ser defeituoso
N = 20000; % num experiencias
n = 8000; % num de chips
k = 7;

% probabilidade de numa amostra de 8000 chips aparecerem 7 defeituosos

%% a) usando a distribuição binomial
fprintf("a) ");

amostras = rand(n,N) < p;
pX_7 = sum(sum(amostras) == 7)/N;
pX_exp = nchoosek(n,k)*(p^k)*(1-p)^(n-k);
fprintf("A probabilidade de numa amostra de 8000 chips aparecerem 7 defeituosos, usando a distibuição binomial, é "+ pX_7);

%% b) usando a distribuição de Poisson
fprintf("\nb) ");
lambda = n * p;
% usando a lei de Poisson
pX_7 = lambda^7 * exp(-lambda) / factorial(7);
fprintf("A probabilidade de numa amostra de 8000 chips aparecerem 7 defeituosos, usando a distibuição de Poisson, é "+ pX_7 +"\n");

%% Conclusão
% A lei de Poisson, para além de ser um método rápido, apresenta um valor
% muito proximo do valor obtido pela distribuição binomial.
