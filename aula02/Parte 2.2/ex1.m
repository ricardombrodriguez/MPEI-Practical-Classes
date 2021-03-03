%a)

subplot(2,1,1);
x = 1:6;
px = 1/6 * ones(1,6);
stem(x,px);

%b)
subplot(2,1,2);
fx = cumsum(px);
stairs([0 x 7],[0 fx 1]);
