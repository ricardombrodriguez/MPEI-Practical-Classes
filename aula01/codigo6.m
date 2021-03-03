function [prob] = codigo6(defeito,defeituosas,amostra,experiencias)
    testes = rand(amostra,experiencias) <= defeito
    sucessos = sum(testes) == defeituosas
    prob = sum(sucessos) / experiencias
end