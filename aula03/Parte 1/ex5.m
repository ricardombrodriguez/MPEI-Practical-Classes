%% a)
         %SOL NUV CHU
matriz = [0.7 0.2 0.3
          0.2 0.3 0.3
          0.1 0.5 0.4]
      
%% b)

x1 = [1 0 0]';
dia2 = matriz*x1;

x2 = [1 0 0]';
dia3 = matriz*x2

probSolSol = dia2(1)*dia3(1)

%% c)

x1 = [1 0 0]';
p2 = matriz*x1;
p3 = matriz^2*x1;

probNChover = (1-p2(3))*(1-p3(3))

%% d)

x1 = [1 0 0]';
dias = zeros(3,31);
dias(:,1) = x1;
for k = 1 : 30
   dias(:,k+1) = matriz^k * x1;
end
prob_media_sol_d = sum(dias(1,:))/31;
prob_media_nuvens_d = sum(dias(2,:))/31;
prob_media_chuva_d = sum(dias(3,:))/31;
fprintf("o nº médio de dias de sol em janeiro é "+ 31 * prob_media_sol_d +"\n");
fprintf("o nº médio de dias de nuvens em janeiro é "+ 31 * prob_media_nuvens_d +"\n");
fprintf("o nº médio de dias de chuva em janeiro é "+ 31 * prob_media_chuva_d +"\n");

%% e)

x1 = [0 0 1]';
dias = zeros(3,31);
dias(:,1) = x1;
for k = 1 : 30
   dias(:,k+1) = matriz^k * x1;
end
prob_media_sol_d = sum(dias(1,:))/31;
prob_media_nuvens_d = sum(dias(2,:))/31;
prob_media_chuva_d = sum(dias(3,:))/31;
fprintf("o nº médio de dias de sol em janeiro é "+ 31 * prob_media_sol_d +"\n");
fprintf("o nº médio de dias de nuvens em janeiro é "+ 31 * prob_media_nuvens_d +"\n");
fprintf("o nº médio de dias de chuva em janeiro é "+ 31 * prob_media_chuva_d +"\n");
