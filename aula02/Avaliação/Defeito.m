
function probDefeito = Defeito(p1,p2,pa,x,n,N)
    brinquedos = rand(3, n * N);
    Defeito = zeros(n,N);
    for k = 1:n*N
        Defeito(k) = brinquedos(1,k) < p1 | brinquedos(2,k) < p2 | brinquedos(3,k) < pa;
    end
    probDefeito = sum(sum(Defeito) == x) / N;
end