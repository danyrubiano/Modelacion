%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Respuesta continua al escalon
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Representacion del numerador y denominador a discretizar
numc = [5 18];
denc = [34 -6 25];

figure; %permite crear una nueva ventana para cada grafico
step(numc,denc); % Grafico de la respuesta al escalon
grid on;
title('Respuesta continua al escalón de H(s)');
xlabel('Tiempo');
ylabel('Amplitud');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discretización 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Aplicacion del comando de discretizacion c2dm
[numd1, dend1] = c2dm(numc, denc, 0.8, 'zoh');

% Construccion de los puntos
[y1] = dstep(numd1, dend1, 200+1);
x1 = 0:0.8:0.8*200;

figure;
stairs(x1,y1);
grid;
title('Discretización de respuesta al escalón de H(s) con Ts=0,8');
xlabel('Tiempo');
ylabel('Amplitud');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discretización 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Aplicacion del comando de discretizacion c2dm
[numd2, dend2] = c2dm(numc, denc, 0.08, 'zoh');

% Construccion de los puntos
[y2] = dstep(numd2, dend2, 200+1);
x2 = 0:0.08:0.08*200;

figure;
stairs(x2,y2);
grid;
title('Discretización de respuesta al escalón de H(s) con Ts=0,08');
xlabel('Tiempo');
ylabel('Amplitud');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Discreto a Continuo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d2cm de funcion discreta a espacio continuo 
[numdc, dendc] = d2cm(numd2, dend2, 0.08, 'foh');

figure;
step(numdc,dendc);
grid;
title('Respuesta al escalón de H(s) con Ts=0,08, de discreta a continua');
xlabel('Tiempo');
ylabel('Amplitud');

