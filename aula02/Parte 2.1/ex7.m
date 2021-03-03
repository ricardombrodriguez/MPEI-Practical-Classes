probAndre = 0.01;
probBruno = 0.05;
probCarlos = 0.001;

% A -> Programa ser do André
% B -> Programa ser do Bruno
% C -> Programa ser do Carlos
% D -> Programa tem um erro sério

%a)

% P(C|D) = P(CD) / P(D) = 0.50*0.001 / (0.20*0.01 + 0.30*0.05 + 0.50*0.001) 
prob = 0.5*probCarlos / (0.2*probAndre + 0.3*probBruno + 0.5*probCarlos);
disp("Probabilidade do programa ser do Carlos sabendo que este tem um bug sério: " + prob);

%b)

disp("P(A|D) = [P(D|A)xP(A)]/P(D) = " + (0.01 * 0.20) / (0.2*0.01 + 0.3*0.05 + 0.5*0.001));
disp("P(B|D) = [P(D|B)xP(B)]/P(D) = " + (0.05 * 0.30) / (0.2*0.01 + 0.3*0.05 + 0.5*0.001)); 
disp("P(C|D) = [P(D|C)xP(C)]/P(D) = " + (0.001 * 0.50) / (0.2*0.01 + 0.3*0.05 + 0.5*0.001)); 
disp("Bruno. Porque é a pessoa mais provável de ser o desenvolvedor do programa sabendo que este tem um erro.");