%a)

N = 10000;
ano = 365;
n = 2;

while true
    matriz = sort(randi(ano,n,N));
    repetition = any(~diff(matriz));
    probRepetition = sum(repetition) / N;
    if probRepetition > 0.5
        break;
    end
    n = n + 1;
end

disp("A) Menor valor de n: " + n);

%b)

n = 2;

while true
    matriz = sort(randi(ano,n,N));
    repetition = any(~diff(matriz));
    probRepetition = sum(repetition) / N;
    if probRepetition > 0.9
        break;
    end
    n = n + 1;
end

disp("B) Menor valor de n: " + n);
