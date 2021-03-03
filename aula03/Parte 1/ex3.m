%% a)

matriz = rand(20,20);

%para uma matriz estocática, temos de normalizar a matriz, isto é, dividir
%os numeros de cada coluna pela respetiva soma da coluna (de forma a que
%todas as somas dêm 1)

matriz = matriz./sum(matriz);
estocastica = zeros(1,20);
for k = 1 : 20
   estocastica(k) = sum(matriz(:,k)) ;
end

%% b)

aux = [2 5 10 100];
x0 = zeros(20,1);
x0(1) = 1;
for j = aux
    p = matriz^j*x0;
    fprintf("A probabilidade após %d transições é de %.5f%%\n",j,p(20)*100);
end

