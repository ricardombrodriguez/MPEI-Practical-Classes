            %  a    m    o    r    .
matriz2 =    [ 0   0.7   0   0.7   0;
              0.2   0   0.2   0    0;
              0.1  0.3   0   0.3   0;
              0.3   0   0.3   0    0;
              0.4   0   0.5   0    1];
          
valoresN = [4 6 8 Inf];            %valores que pretendemos "percorrer"
probabilidesN = zeros(1,4);         %lista que vai armazenar as probabilidades de gerar uma palavra válida em português
palavrasDiferentes = zeros(1,4);    %lista que vai armazenar o número de palavras diferentes geradas

for n = 1:4 
    
    N = 10e5;
    mapWords2 = containers.Map('keyType', 'char', 'ValueType', 'double'); % map com a palavra gerada e a respetiva probabilidade

    for k = 1:N
        estados = crawl(matriz2, randi([1,4]), 5, valoresN(n));
        word = convertToWord(estados);

        if ~(isKey(mapWords2, word))
            mapWords2(word) = 1/N;
        else
            total = mapWords2(word);
            total = total * N + 1;
            mapWords2(word) = total/N;       
        end
    end
    
    valid = 0;                                        %variável declarada como 0 que vai guardar o nº de palavras válidas
    for word = keys(mapWords2)                        %para cada palavra das keys de "mapWords2"
        for k = 1:length(dicionario)                  %percorre todos as palavras no "dicionario"
            if strcmp(dicionario{k}, word)
                valid = valid + N*mapWords2(word{1});
            end
        end
    end
    palavrasDiferentes(n) = length(mapWords2);    %o número de palavras diferentes geradas é igual ao comprimento de mapWords2
    probabilidadesN(n) = valid/N;                 %probabilidade de gerar uma palavra válida em português          
end

for n = 1 : 4
    fprintf("\nQuando n = " + valoresN(n) + ":\n");
    disp("Probabilidade de uma palavra gerada ser válida = " + probabilidadesN(n));
    disp("Número de palavras diferentes geradas = " + palavrasDiferentes(n)); 
end
