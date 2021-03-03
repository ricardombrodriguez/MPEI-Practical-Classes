          % a   m   o   r   .
matriz3 = [ 0  0.7  0  0.6  0;
           0.2  0  0.2 0.1  0;
           0.1 0.3  0  0.3  0;
           0.6  0  0.3  0   0;
           0.4  0  0.5  0   0];
       
valoresN = [4 6 8 Inf]; 

for n = 1 : 4

    N = 10e5;
    mapWords5 = containers.Map('keyType', 'char', 'ValueType', 'double'); % map com a palavra gerada e a respetiva probabilidade

    for k = 1 : N   %percorrer todos os valores de 1 até 10e5

        num = min(find(prob1Letra > rand()));          %armazena o menor index em que rand() é menor que prob1Letra
        estados = crawl(matriz3, num, 5, valoresN(n)); %gerador de estados
        palavra = convertToWord(estados);              %converter o array de estados numa palavra
        
        if ~(isKey(mapWords5, palavra))                         %caso a "palavra" não exista em mapWords8, então:
            mapWords5(palavra) = 1/N;                           %adiciona-mos a palavra como key com probabilidade 1/N
        else                                                    %caso contrário:
            total = mapWords5(palavra);                         %armazenamos a probabilidade atual dessa palavra
            total = total * N + 1;                              %incrementa-se a contagem dessa palavra
            mapWords5(palavra) = total/N;                       %atualiza-se a nova probabilidade (contagem/10e5)
        end
    end

    valid = 0;                                       %variável declarada como 0 que vai guardar o nº de palavras válidas
    for word = keys(mapWords5)                       %para cada palavra das keys de "mapWords5"
        for k = 1:length(dicionario)                 %percorre todos as palavras no "dicionario"
            if strcmp(dicionario{k}, word)
                valid = valid + N*mapWords5(word{1});
            end
        end
    end
    
    fprintf("\nQuando n = " + valoresN(n) + ":\n");
    disp("Número de palavras diferentes geradas = " + length(mapWords5)); 
    disp("Probabilidade de uma palavra gerada ser válida = " + valid/N);   
end



