
function A = gerarConjunto(N,imin,imax,caracteres,probabilidades)
    if nargin == 5   %caso probabilidades seja input
        A = {};
        for k = 1:N
            comprimento = randi([imin,imax]);
            palavra = "";
            for j = 1 : comprimento
                palavra = palavra + char(discrete_rnd(caracteres,probabilidades));
            end
            A{end+1} = char(palavra);
        end
        C = unique(A);
        while (length(C) < N)
            comprimento = randi([imin,imax]);
            palavra = "";
            for j = 1 : comprimento
                palavra = palavra + char(discrete_rnd(caracteres,probabilidades));
            end
            if ~ismember(C,char(palavra))
                C{end+1} = char(palavra);
            end
        end
            
    else            %caso probabilidades não seja input
        probabilidades = ones(1,length(caracteres));
        probabilidades = probabilidades./length(probabilidades);
        A = {};
        for k = 1:N
            comprimento = randi([imin,imax]);
            palavra = "";
            for j = 1 : comprimento
                palavra = palavra + char(discrete_rnd(caracteres,probabilidades));
            end
            A{end+1} = char(palavra);
        end
        C = unique(A);
        while (length(C) < N)
            comprimento = randi([imin,imax]);
            palavra = "";
            for j = 1 : comprimento
                palavra = palavra + char(discrete_rnd(caracteres,probabilidades));
            end
            if ~ismember(C,char(palavra))
                C{end+1} = char(palavra);
            end
        end
    end
end
