%% 1 a)

N = 10e5;
imin = 6;
imax = 20;
caracteres = ['A':'Z' 'a':'z'];
cell1 = gerarConjunto(N,imin,imax,caracteres);

%% 1 b)

N = 10e5;
imin = 6;
imax = 20;
caracteres = 'abcdefghijklmnopqrstuvwxyz';
file = fopen("prob_pt.txt",'r');
probabilidades = textscan(file,"%s"); 
probabilidades = probabilidades{1,1};
probabilidades = str2double(probabilidades);
fclose(file);
cell2 = gerarConjunto(N,imin,imax,caracteres,probabilidades);


