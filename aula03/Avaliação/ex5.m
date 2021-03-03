
dicionarioPonto = dicionario + ".";     %adicionar o último caractere '.' a cada palavra de 'dicionario'
letras = ['a' 'm' 'o' 'r' '.'];         %lista de caracteres que vão corresponder às linhas/colunas da 'matrizT'
matrizT = zeros(5,5);                   %inicialização da matriz de transição 5x5 dos 5 estados de 'letras'

for palavra = dicionarioPonto              %para cada palavra em dicionarioPonto
    listaPalavra = char(palavra);          %criamos uma lista com os caracteres da mesma
    for c = 1 : length(listaPalavra)-1     %do index 1 até ao penúltimo de "listaPalavra" -> atualizar matriz de transição 
       matrizT(strfind(letras,listaPalavra(c+1)),strfind(letras,listaPalavra(c))) = matrizT(strfind(letras,listaPalavra(c+1)),strfind(letras,listaPalavra(c))) + 1;
    end
end
matrizT = matrizT./sum(matrizT);    %matriz estocástica
matrizT(:,5) = 0; matrizT(5,5) = 1; %para ficar com valores nulos em vez de 'NaN' e para o último valor da matriz ser '1'

%% Probabilidades da 1º letra para mapWords7, nº de palavras diferentes geradas e probabilidade de palavra válida em PT

valoresN = [4 6 8 Inf];    %valores que pretendemos usar no for loop seguinte

for n = 1 : 4               %para percorrer os valores de "valoresN"
    N = 10e5;
    mapWords7 = containers.Map('keyType', 'char', 'ValueType', 'double'); %Map Container para guardar palavras dif. geradas 
    
    for k = 1 : N       %armazenar primeiras letras de palavras geradas e a respetiva probabilidade
        num = min(find(prob1Letra > rand()));          %armazena o menor index em que rand() é menor que prob1Letra
        estados = crawl(matrizT, num, 5, valoresN(n)); %gerar estados
        palavra = convertToWord(estados);                       %gerar palavra a partir da lista de "estados"
        firstChar = palavra{1}(1);                              %guardar primeira letra da "palavra"

        if ~(isKey(mapWords7, palavra))                         %caso a "palavra" não exista em mapWords8, então:
            mapWords7(palavra) = 1/N;                           %adiciona-mos a palavra como key com probabilidade 1/N
        else                                                    %caso contrário:
            total = mapWords7(palavra);                         %armazenamos a probabilidade atual dessa palavra
            total = total * N + 1;                              %incrementa-se a contagem dessa palavra
            mapWords7(palavra) = total/N;                       %atualiza-se a nova probabilidade (contagem/10e5)
        end
    end

    valid = 0;                                       %variável declarada como 0 que vai guardar o nº de palavras válidas
    for word = keys(mapWords7)                       %para cada palavra das keys de "mapWords7"
        for k = 1:length(dicionario)                 %percorre todos as palavras no "dicionario"
            if strcmp(dicionario{k}, word)
                valid = valid + N*mapWords7(word{1});
            end
        end
    end
    fprintf("\nQuando n = " + valoresN(n) + ":\n");
    disp("Número de palavras diferentes geradas = " + length(mapWords7)); 
    disp("Probabilidade de uma palavra gerada ser válida = " + valid/N);    
end

