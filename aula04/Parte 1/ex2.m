hashList = cell(4,3);
collisions = cell(4,3);
execTime = zeros(4,3);
tamanhos = [5*10^5 10^6 2*10^6];

for i = 1 : length(tamanhos)
    t = tamanhos(i);
    disp("-----------------------------");
    disp("Para tamanho = " + t + ":");
    func = ["DJB2" "SDBM" "DJB31MA" "HashString"];
    for f = 1 : 4
        hashList{f,i} = zeros(1,N);
        collisions{f,i} = zeros(1,t);
        col = 0;
        for k = 1 : length(cell1)
            palavra = char(cell1{k});
            tic;
            hash = rem(string2hash(palavra,"djb2",t),t) + 1;
            hashList{f,i}(k) = hash;
            if (collisions{f,i}(hash) > 0)
                col = col + 1;
            end
            collisions{f,i}(hash) = collisions{f,i}(hash) + 1;
            execTime(f,i) = execTime(f,i) + toc;
        end
        disp(func(f) + ": " + col + " colisões. exec time: " + execTime(f,i) + " segundos.");
    end
end

%%

for k = 1 : 12
   figure(k);
   histogram(hashList{k},100);
end
