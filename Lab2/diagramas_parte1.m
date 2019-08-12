%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funcion 1

figure; %permite crear una nueva ventana para cada grafico
step([3 0],[2 1]); %funcion que genera el grafico del lazo abierto
title('Lazo abierto de H1(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
[num, den] = cloop([3 0],[2 1]);
step(num, den);
title('Lazo cerrado de H1(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
bode([3 0],[2 1]);
title('Bode lazo abierto de H1(s)');
xlabel('Frecuencia');
ylabel('Fase');
grid on;

figure;
[num, den] = cloop([3 0],[2 1]);
bode(num, den);
title('Bode lazo cerrado de H1(s)');
xlabel('Frecuencia');
ylabel('Fase');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funcion 2

figure;
step([2 8 1],[1 4 7]);
title('Lazo abierto de H2(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
[num, den] = cloop([2 8 1],[1 4 7]);
step(num, den);
title('Lazo cerrado de H2(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
bode([2 8 1],[1 4 7]);
title('Bode lazo abierto de H2(s)');
xlabel('Frecuencia');
ylabel('Fase');
grid on;

figure;
[num, den] = cloop([2 8 1],[1 4 7]);
bode(num, den);
title('Bode lazo cerrado de H2(s)');
xlabel('Frecuencia');
ylabel('Fase');
grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funcion 3

figure; 
step(8,[1 1]);
title('Lazo abierto de H3(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
[num, den] = cloop(8,[1 1]);
step(num, den);
title('Lazo cerrado de H3(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure; 
bode(8,[1 1]);
title('Bode lazo abierto de H3(s)');
xlabel('Frecuencia');
ylabel('Fase');
grid on;

figure;
[num, den] = cloop(8,[1 1]);
bode(num, den);
title('Bode lazo cerrado de H3(s)');
xlabel('Frecuencia');
ylabel('Fase');
grid on;