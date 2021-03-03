%% a)

p = 0.4;
q = 0.6;
matriz = [  p^2   0 0    q^2;
    (1-p)^2  0 0  q*(1-q);
     p*(1-p) 0 0  q*(1-q);
     p*(1-p) 1 1  (1-q)^2];
      
matriz = matriz./sum(matriz);
      
%% b)

x0 = [1 0 0 0]';
trans = [5 10 100 200];
prob = zeros(4,length(trans));
for t = 1 : length(trans)
    p = matriz^(trans(t)) * x0;
    for estado = 1 : 4
       prob(estado,t) = p(estado); 
    end
end

estados = ['A';'B';'C';'D'];

fprintf("b)\n");
for k = 1 : 4
    disp("Estados ao fim de " + trans(k) + " transições:");
    for j = 1 : 4
       disp("-> Estado " + estados(j) + ": " + prob(j,k));
    end
end

%% c)

fprintf("c)");

% eye(4) >> matriz identidade 4x4

H = [matriz - eye(4); ones(1,4)];        % matriz 4x4 de T-eye(4) e o ';' muda de linha e fica matriz 5x4 com a ultima linha com '1's
a = [zeros(4,1);1];                 	 % matriz 1x4 de '0's e ';' muda de linha e fica matriz 1x5 com a ultima linha =1
v = H\a;

fprintf("\nProb A: " + v(1) + "\nProb B: " + v(2) + "\nProb C: " + v(3) + "\nProb D: " + v(4) + "\n");
