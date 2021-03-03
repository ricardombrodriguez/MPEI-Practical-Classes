
mapWords3 = containers.Map('keyType', 'char', 'ValueType', 'double');
N = length(dicionario);    %comprimento de "dicionario" -> contém todas as palavras do ficheiro com as letras [amor]

for index = 1 : N                                   %percorrer todos os indexes de "dicionario"
    primeiroChar = lower(dicionario{index}{1}(1));  %guardar a primeira letra (em minusculo) do index de dicionario
   if ~(isKey(mapWords3, primeiroChar))             %se essa letra ainda não é key de mapWords3, então:
        mapWords3(primeiroChar) = 1/N;              %adiciona-se essa key com o valor de probabilidade inicial 1/N 
   else                                             %se a primeira letra já é key de mapWords3, então:
        total = mapWords3(primeiroChar);            %guarda-se o valor da probabilidade respetiva em total
        total = total * N + 1;                      %incrementa-se um valor na contagem dessa palavra
        mapWords3(primeiroChar) = total/N;        	%atualiza-se a probabilidade, contagem/length(dicionario)
    end
end

prob1Letra = zeros(1,4);                            %lista que vai armazenar as probabilidades de ocorrer cada 1º letra
primeiraLetra = keys(mapWords3);                    %armazenar em "primeiraLetra" as chaves de mapWords3
for key = 1 : length(mapWords3)
    prob1Letra(key) = mapWords3(primeiraLetra{key}); %guardar na posição key o valor da probabilidade de cada primeira letra
    disp("Probabilidade da primeira letra de 'dicionario' ser '" + primeiraLetra{key} + "' = " + mapWords3(primeiraLetra{key})); 
end
prob1Letra = cumsum(prob1Letra);                    %transformar lista numa função cumulativa

%%

valoresN = [4 6 8 Inf]; 

for n = 1 : 4
    
    N = 10e5;
    mapWords4 = containers.Map('keyType', 'char', 'ValueType', 'double');  %map com a palavra gerada e a respetiva probabilidade
    
    for k = 1 : N                                              %percorrer todos os casos
        num = min(find(prob1Letra > rand()));                  %armazena o menor index em que rand() é menor que prob1Letra
        estados = crawl(matriz2, num, 5, valoresN(n));          %gerar lista de "estados"
        palavra = convertToWord(estados);                      %transformar "estados" numa palavra

        if ~(isKey(mapWords4, palavra))                         %caso a "palavra" não exista em mapWords4, então:
            mapWords4(palavra) = 1/N;                           %adiciona-mos a palavra como key com probabilidade 1/N
        else                                                    %caso contrário:
            total = mapWords4(palavra);                         %armazenamos a probabilidade atual dessa palavra
            total = total * N + 1;                              %incrementa-se a contagem dessa palavra
            mapWords4(palavra) = total/N;                       %atualiza-se a nova probabilidade (contagem/10e5)
        end        
    end
    
    valid = 0;                                       %variável declarada como 0 que vai guardar o nº de palavras válidas
    for word = keys(mapWords4)                       %para cada palavra das keys de "mapWords4"
        for k = 1:length(dicionario)                 %percorre todos as palavras no "dicionario"
            if strcmp(dicionario{k}, word)
                valid = valid + N*mapWords4(word{1});
            end
        end
    end
    palavrasDiferentes(n) = length(mapWords4);    %o número de palavras diferentes geradas é igual ao comprimento de mapWords4
    probabilidadesN(n) = valid/N;                 %probabilidade de gerar uma palavra válida em português      
end

for n = 1 : 4                                     
   disp("A probabilidade de uma palavra gerada ser válida quando n = " + valoresN(n) + " ---> " + probabilidadesN(n));
end

for n = 1 : 4
   disp("O número de palavras diferentes geradas quando n = " + valoresN(n) + " ---> " + palavrasDiferentes(n)); 
end

