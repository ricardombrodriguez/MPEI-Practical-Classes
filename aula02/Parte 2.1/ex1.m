% a)

fprintf("A)");

N = 1e5; 
p = 0.5; 
k = 0;  
n = 2;   

filhos = rand(n,N) > p;
sucessos = sum(filhos) == k;            % probabilidade de não ter rapaz
probSimulacao = 1 - sum(sucessos) / N;  % complemento


%b)

fprintf("B)");

probTeo = 1 - factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k)


%c)

fprintf("C)");
%A -> Outro filho ser rapaz
%B -> Um dos filhos é rapaz
%Como, B admite que um dos filhos é rapaz e A que o outro também é rapaz,
%então P(AB) significa que ambos são rapazes

%P(AB):
N = 1e5; 
p = 0.5; 
k = 2;   %serem ambos rapazes
n = 2;   

filhos = rand(n,N) > p;
sucessos = sum(filhos)==k;
probSimulacao = sum(sucessos)/N;

%P(B)
k = 1;
sucessos = sum(filhos) >= k; %um ou mais
probSimulacaoB = sum(sucessos)/N;

probSimFinal = probSimulacao / probSimulacaoB

%Teoria:

%P(AB)
p = 0.5; 
k = 2;   
n = 2;   

probTeorica = factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k);

%P(B)

k = 0;
probTeoricaB = 1 - (factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k));
probTeoricaFinal = probTeorica / probTeoricaB


%D)

fprintf("D)");

%A -> Segundo filho ser rapaz
%B -> Primeiro filho é rapaz
%P(A|B) = P(AB)/P(B)

%Por teoria:

%P(AB)
p = 0.5; 
k = 2;   %ambos serem rapazes
n = 2;   

probTeorica = factorial(n)/ (factorial(n-k)*factorial(k)) * p^k*(1-p)^(n-k);

%P(B) = 0.5 %é igual à probabilidade de ser rapaz

probTeoricaFinal = probTeorica / 0.5

%Por Simulacao:

%P(AB)
N = 1e5; 
p = 0.5; 
k = 2;   
n = 2;   

filhos = rand(n,N) > p;
sucessos = sum(filhos) == k;    %ambos são rapazes
probSimulacao = sum(sucessos) / N;

%P(B)
k = 1;
primeiro = sum(filhos(1,:) == k);      %filhos(1,:) -> verificação de toda a primeira linha, para ver se o 1º filho é 1 (rapaz) ou 0 (rapariga)
probSimulacaoB = sum(primeiro) / N;

probSimFinal = probSimulacao / probSimulacaoB

%E)
fprintf("E)");

%A -> Apenas um dos outros ser rapaz
%B -> Pelo menos um dos filhos ser rapaz
%AB -> Ter dois filhos rapazes

%P(AB)
N = 1e5; 
p = 0.5; 
k = 2;  
n = 5;  

filhos = rand(n,N) > p;
sucessos = sum(filhos) == k;
probSimulacao = sum(sucessos) / N;

%P(B)
k = 1;
sucessos = sum(filhos) >= k; %pelo menos um deles ser rapaz
probSimulacaoB = sum(sucessos) / N;

probSimulacaoFinal = probSimulacao / probSimulacaoB


%F)
fprintf("F)");

%A -> Pelo menos um, ou mais, é rapaz
%B -> Pelo menos um dos filhos é rapaz
%AB -> Ter pelo menos dois filhos rapazes

%P(AB)
N = 1e5; 
p = 0.5;
k = 2;   
n = 5;  

filhos = rand(n,N) > p;
sucessos = sum(filhos) >= k;    %pelo menos 2 rapazes
probSimulacao = sum(sucessos)/N;

%P(B)
k = 1;
sucessos = sum(filhos) >= k;
probSimulacaoB = sum(sucessos) / N;

probSimulacaoFinal = probSimulacao / probSimulacaoB
