

fprintf("a) ");
matriz1 = [0   1/2   0   1/2   0 ;
        1/4   0   1/3   0    0 ;
        1/4  1/2   0   1/2   0 ;
        1/4   0   1/3   0    0 ;
        1/4   0   1/3   0    1 ];

state = crawl(matriz1, randi([1,4]), 5, Inf);
palavra1 = convertToWord(estados);
fprintf("palavra formada: "+ palavra1 +"\n");

%% 1b

fprintf("b) ");
N = 10e5;
mapWords = containers.Map('keyType', 'char', 'ValueType', 'double'); % map com a palavra gerada e a respetiva probabilidade

for k = 1:N
    estados = crawl(matriz1, randi([1,4]), 5, Inf);
    word = convertToWord(estados);
    
    if ~(isKey(mapWords, word))
        mapWords(word) = 1/N;
    else
        total = mapWords(word);
        total = N * total + 1;
        mapWords(word) = total/N;
    end
end 

cincoMax = maxk(cell2mat(values(mapWords)), 5); 
cincoPalavras = {};
disp("Probabilidades simuladas: ");
for i = 1 : 5
   logicalEqualArray = cellfun(@(x)isequal(x,cincoMax(i)),values(mapWords));%array do tamanho de mapWords com '1' se = cincoMax(i)
   allKeys = keys(mapWords);   
   palavraMax = allKeys(logicalEqualArray);
   cincoPalavras{i} = palavraMax;
   disp(i + "º: '" + palavraMax + "' -> Probabilidade = " + cincoMax(i));
end

fprintf("nº de palavras diferentes: "+ length(keys(mapWords)) +"\n");

%% 1c

fprintf("c)\n");
lista = ['a','m','o','r','.'];
cincoPalavrasC = cincoPalavras + ".";
n = 1;
probT = zeros(1,5);
disp("Probabilidades teóricas: ");
for word = cincoPalavrasC
    probabilidade = 0.25;   %probabilidade de escolher o estado inicial (a,m,o,r)
    temp = char(word);
    for c = 1 : length(temp)-1
        probabilidade = probabilidade * matriz1(strfind(lista,temp(c+1)),strfind(lista,temp(c)));
    end
    disp("Probabilidade teórica de " + word + " -> " + probabilidade);
end

%% 1d

fprintf("d) ");
file = fopen("wordlist-preao-20201103.txt",'r');    %abrir "wordlist...3.txt" como ficheiro de leitura e guardar em "file"
fileDictionary = textscan(file,"%s");               %ler strings/palavras de "file" e guardá-las numa célula fileDictionary
fclose(file);                                       %parar leitura do ficheiro
fileDictionary = fileDictionary{1,1};               %para poder, mais tarde, percorrer os valores de fileDictionary                   

dicionario = {};                                    %array de células que vai guardar as palavras que contém 'a','m','o','r'
expression = 'amor';                                
for k = 1 : length(fileDictionary)                                  %para percorrer todas as células de fileDictionary
    if (min(ismember(lower(fileDictionary{k}),expression)) == 1)    %se a palavra contém a "expression", então:
        dicionario{end+1} = lower(fileDictionary(k));               %adiciona-se essa palavra depois do final de "dicionario"                
    end
end

valid = 0;                                                  %verificação do nº de palavras válidas em português
for word = keys(mapWords)                                   %se as keys de mapWords forem iguais a alguma palavra
    for k = 1:length(dicionario)                            %de "dicionario", então incrementa-se a variável "valid"
        if strcmp(dicionario{k}, word)                      %com o número de ocorrências dessa palavra
            valid = valid + N*mapWords(word{1});
        end
    end
end
disp("Probabilidade de gerar uma palavra aleatória válida em português = " + valid/N);

%% 1f

fprintf("f) ");
valoresN = [4 6 8];                 %valores de n para os quais pretendemos gerar 10e5 palavras aleatórias
probabilidadesN = zeros(1,3);       %cria-se um array nulo de tamanho 1x3 para depois armazenar as probabilidades para cada n
palavrasDiferentesN = zeros(1,3);   %cria-se um array nulo de tamanho 1x3 para armazenar o nº de palavras diferentes geradas
for n = 1:3                             %queremos as probabilidades dos index 1-3 de valoresN
    N = 10e5;
    mapWords = containers.Map('keyType', 'char', 'ValueType', 'double'); % map com a palavra gerada e a respetiva probabilidade
    
    for k = 1:N                         %começar do k = 1 até N (10e5)
        estados = crawl(matriz1, randi([1,4]), 5, valoresN(n));  
        word = convertToWord(estados);  
        if ~(isKey(mapWords, word))     %se a palavra gerada ainda não é uma key de mapWords, então:
            mapWords(word) = 1/N;       %adiciona-se essa key a "mapWords" com o valor de probabilidade 1/N
        else                            %se a palavra já pertence a "mapWords"
            total = mapWords(word);     %guarda-se o valor atual da probabilidade dessa palavra
            total = total * N + 1;      %multiplica esse valor por N para obter a contagem e soma-se um
            mapWords(word) = total/N;   %a nova probabilidade de 'word' é 'total' (contagem) sobre N (10e5)    
        end
    end
    
    valid = 0;                                       %variável declarada como 0 que vai guardar o nº de palavras válidas
    for word = keys(mapWords)                        %para cada palavra das keys de "mapWords"
        for k = 1:length(dicionario)                 %percorre todos as palavras no "dicionario"
            if strcmp(dicionario{k}, word)
                valid = valid + N*mapWords(word{1});
            end
        end
    end
    probabilidadesN(n) = valid/N;                 %o valor da probabilidade para n é o número de palavras válidas sobre N (10e5)
    palavrasDiferentesN(n) = length(mapWords);    %guardar o número de palavras dif. geradas que é o comprimento do map container
end

for n = 1 : 3
   fprintf("\nQuando n = " + valoresN(n) + ":\n");
   disp("Probabilidade de uma palavra gerada ser válida = " + probabilidadesN(n));
   disp("Número de palavras diferentes geradas = "  + palavrasDiferentesN(n)); 
end
