
function [prob] = codigo4(num,caras,experiencias)
    lancamentos = rand(num,experiencias) > 0.5;
    sucessos = sum(lancamentos) == caras;
    prob = sum(sucessos) / experiencias;
end



%função tem que ter o mesmo nome que o ficheiro