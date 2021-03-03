% X - classificacoes dos alunos de um determinado curso
N = 10e5;
dp = 2; % desvio padrao
m = 14; % media

notas = dp.*randn(1,N) + m;

fprintf("a) ");
probA = sum(notas < 16 & notas > 12) / N;
fprintf("A probabilidade de um aluno do curso ter uma classificacao entre 12 e 16 é "+ probA);

fprintf("\nb) ");
probB = sum(notas < 18 & notas > 10) / N;
fprintf("A probabilidade dos alunos terem classificacoes entre 10 e 18 é "+ probB);

fprintf("\nc) ");
probC = sum(notas >= 9.5 ) / N;
fprintf("A probabilidade dum aluno passar é "+ probC);

fprintf("\nd) ");
probA = normcdf(16,14, 2) - normcdf(12,14, 2);
fprintf("\tprobA = "+ probA);
probB = normcdf(18,14, 2) - normcdf(10,14, 2);
fprintf("\n\tprobB = "+ probB);
probC = normcdf(20,14, 2) - normcdf(10,14, 2);
fprintf("\n\tprobC = "+ probC + "\n");