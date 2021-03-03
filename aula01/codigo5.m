N = 100000;
p = 0.3;
n = 5;
k = 2;
fabrico = rand(n,N) < 0.3;
defeituosas = sum(fabrico) <= k;
pSimulada = sum(defeituosas)/N
pTeorica = 0;
for k = 0 : 2
    pTeorica = pTeorica + nchoosek(n,k)*(p^k)*(1-p)^(n-k);
end
pTeorica