prob = [1:100];
matriz = zeros(2,length(prob));

for p = prob
    
    plane2engines = randi(100,2,10000) < p;
    matriz(1,p) = sum(sum(plane2engines) == 2) / 10000;
    
    plane4engines = randi(100,4,10000) < p;
    matriz(2,p) = sum(sum(plane4engines) > 2) / 10000;
    
end

plot(prob,matriz(1,:),'LineWidth',2);
hold on
plot(prob,matriz(2,:),'-r','LineWidth',2);
title("Probabilidade de avião se despenhar");
xlabel("Probabilidade de um motor falhar");
ylabel("Probabilidade de mais de metade dos motores falharem");
legend("Avião de 2 motores","Avião de 4 motores");

for c = 1 : length(matriz)
    
    quociente = matriz(1,c) / matriz(2,c);
    if quociente > 1
        disp("p = " + c + " -> Mais seguro = Avião de quatro motores ");
    else 
        disp("p = " + c + " -> Mais seguro = Avião de dois motores ");
    end
    
end