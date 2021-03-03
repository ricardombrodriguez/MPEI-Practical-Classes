%% a)

H = zeros(6,6);
H(1,5) = 1;
H(2,1) = 1; H(2,5) = 1;
H(3,2) = 1; H(3,4) = 1;
H(4,3) = 1;
H(5,2) = 1;
H(6,5) = 1;
H = H./sum(H);
H(:,6) = 0;

x0 = (ones(1,6)/6)';
x10 = H^10 * x0;

pages = ['A' 'B' 'C' 'D' 'E' 'F'];
pagerank = zeros(1,6);
for k = 1 : 6
    pagerank(k) = sum(x10(k,:));
end

for k = 1 : 6
   disp("Página " + pages(k) + ": " + pagerank(k)); 
end

disp("-------------------------");

%% b)

% dead-end --> página F (estado absorvente)
% spider traps --> página C e D 

%% c)

H(:,6) = 1/6;
p10 = H^10;
pages = ['A' 'B' 'C' 'D' 'E' 'F'];
pagerank = zeros(1,6);
for k = 1 : 6
    pagerank(k) = sum(p10(k,:));
end
for k = 1 : 6
    pagerank(k) = sum(p10(k,:));
end

for k = 1 : 6
   disp("Página " + pages(k) + ": " + pagerank(k)); 
end
disp("-------------------------");

%% d)

b = 0.8;
H(:,6) = 1/6;
A = b*H + (1-b)*ones(6)/6;
%A(isnan(A)) = 1/N
p10 = A^10;
pages = ['A' 'B' 'C' 'D' 'E' 'F'];
pagerank = zeros(1,6);
for k = 1 : 6
    pagerank(k) = sum(p10(k,:));
end
for k = 1 : 6
    pagerank(k) = sum(p10(k,:));
end

for k = 1 : 6
   disp("Página " + pages(k) + ": " + pagerank(k)); 
end

