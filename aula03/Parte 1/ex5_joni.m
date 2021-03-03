%% exercício 5
% a prob de estar x estado sabendo que no dia anterior esteve y estado
T = [0.7 0.2 0.3;
     0.2 0.3 0.3;
     0.1 0.5 0.4];

fprintf("b)\n");
x1 = [1 0 0]';
x2 = T^1 * x1 % dia 1 para o dia 2 é só uma transição
x3 = T^1 * x2 
% x3 = T^2 * x1;
prob_sol = x2(1) * x3(1); 
disp(prob_sol);

fprintf("c)\n");
prob2 = x2(1) + x2(2);
prob3 = x3(1) + x3(2);
prob_nao_chuva = prob2 * prob3;
disp(prob_nao_chuva);

fprintf("d)\n");
% janeiro: 31 dias --> 30 transições
% x30 = T^30 * x1; % errado porqeu isto é a prob passado 30 dias
dias = zeros(3,31);
dias(:,1) = x1;
for k = 1:30    % 30 transições
    dias(:,k+1) = T^k * x1;
end
prob_media_sol_d = sum(dias(1,:))/31;
prob_media_nuvens_d = sum(dias(2,:))/31;
prob_media_chuva_d = sum(dias(3,:))/31;
fprintf("o nº médio de dias de sol em janeiro é "+ 31 * prob_media_sol_d +"\n");
fprintf("o nº médio de dias de nuvens em janeiro é "+ 31 * prob_media_nuvens_d +"\n");
fprintf("o nº médio de dias de chuva em janeiro é "+ 31 * prob_media_chuva_d +"\n");

fprintf("e)\n");
x1 = [0 0 1]';
dias = zeros(3,31);
dias(:,1) = x1;
for k = 1:30    % 30 transições
    dias(:,k+1) = T^k * x1;
end
prob_media_sol_e = sum(dias(1,:))/31;
prob_media_nuvens_e = sum(dias(2,:))/31;
prob_media_chuva_e = sum(dias(3,:))/31;
fprintf("o nº médio de dias de sol em janeiro é "+ 31 * prob_media_sol_e +"\n");
fprintf("o nº médio de dias de nuvens em janeiro é "+ 31 * prob_media_nuvens_e +"\n");
fprintf("o nº médio de dias de chuva em janeiro é "+ 31 * prob_media_chuva_e +"\n");


fprintf("f)\n");
dores = [0.1 0.3 0.5];

fprintf("--> caso o 1º dia tenha estado sol\n");
dias_dores_sol = dores(1) * prob_media_sol_d * 31;
dias_dores_nuvens = dores(2) * prob_media_nuvens_d * 31;
dias_dores_chuva = dores(3) * prob_media_chuva_d * 31;

dias_dores =  dias_dores_chuva + dias_dores_nuvens + dias_dores_sol;
fprintf("o nº médio de dias com dores é "+ dias_dores +"\n");

fprintf("--> caso o 1º dia tenha estado chuva\n");
dias_dores_sol = dores(1) * prob_media_sol_e * 31;
dias_dores_nuvens = dores(2) * prob_media_nuvens_e * 31;
dias_dores_chuva = dores(3) * prob_media_chuva_e * 31;

dias_dores =  dias_dores_chuva + dias_dores_nuvens + dias_dores_sol;
fprintf("o nº médio de dias com dores é "+ dias_dores +"\n");