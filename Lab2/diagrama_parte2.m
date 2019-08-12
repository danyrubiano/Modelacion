% Funcion 1
num1 = [0 0 4 0];
den1 = [0 10 0 4];

% Funcion 2
num2 = [0 0 0 3];
den2 = [0 0 6 16];

% Funcion 3
num3 = [0 0 4 10];
den3 = [4 9 5 0];

% Funcion 4
num4 = [0 0 0 1];
den4 = [0 0 7 10];

% Funcion 5
num5 = [0 0 8 8];
den5 = [1 2 3 0];

% Funcion 6
num6 = [0 0 3 2];
den6 = [0 5 7 10];


% Conexion en paralelo entre funcion 1 y 2
[n1y2,d1y2] = parallel(num1,den1,num2,den2);

% Conexion de lazo cerrado para funcion 3
[n_cerrado3,d_cerrado3] = feedback(num3,den3,1,1);

% Conexion en paralelo entre funcion 4 y 5
[n4y5,d4y5] = parallel(num4,den4,num5,den5);

% Conexion en serie entre funcion 3 de lazo cerrado y función 4 y 5
[n34y5,d34y5] = series(n_cerrado3,d_cerrado3,n4y5,d4y5);

% Conexion en serie entre funcion 3, 4 y 5 y funcion 6
[n345y6,d345y6] = series(n34y5,d34y5,num6,den6);

% Conexion en paralelo entre funcion 3, 4, 5 y 6 y funcion 1 y 2
[n_Y,d_Y] = parallel(n1y2,d1y2,n345y6,d345y6);

figure;
step(n_Y,d_Y);
title('Respuesta al escalon Y(s)');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;

figure;
step(n_Y,d_Y,20);
title('Respuesta al escalon Y(s) acotado a 20 seg');
xlabel('Tiempo');
ylabel('Amplitud');
grid on;
