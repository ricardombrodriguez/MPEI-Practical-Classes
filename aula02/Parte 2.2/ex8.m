n = 100;
lambda = 0.02 * n;
pk = 0;

for k = 0:1
   pk = pk + lambda^k * exp(-lambda) / factorial(k); 
end

disp("Probabilidade de haver no máximo um erro num livro de 100 páginas: " + pk);