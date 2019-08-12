x=[0:0.01:10*pi]; %intervalo de x con espaciado de 0.01
a=4*log(9*x-2)/log(5);
b=cos(4*(log(2*x+3)/log(6)))+sin(2*(log(2*x+5)/log(6)));

figure; %permite crear una nueva ventana para cada grafico
plot(x,a,'g+'); %crea un grafico de los datos de la funcion en comparacion con los valores del intervalo en que se mueve x
xlabel({'x'},'Interpreter','latex'); %permite agregar el nombre del eje x
ylabel({'a(x)'},'Interpreter','latex'); %permite agregar el nombre del eje y
title({'a(x)=4log(9x-2)/log(5)'},'Interpreter','latex'); %permite agregar un titulo al grafico

figure;
plot(x,b,'r*');
xlabel({'x'},'Interpreter','latex');
ylabel({'f(x)'},'Interpreter','latex');
title({'b(x)=cos(4(log(2x+3)/log(6)))+sin(2(log(2x+5)/log(6)))'},'Interpreter','latex');

figure;
hold on; %retiene los graficos para agregar otros
plot(x,a,'g+');
plot(x,b,'r*');
xlabel({'x'},'Interpreter','latex');
ylabel({'b(x)'},'Interpreter','latex');
title({'Funciones a(x) y b(x)'},'Interpreter','latex');
legend('a(x)','b(x)');
hold off; %termina con la retension inicial

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x=[-10:0.05:10]; %intervalo de x con espaciado de 0.05
c=6*exp(9*x-4);

figure;
plot(x,c,'b-');
xlabel({'x'},'Interpreter','latex');
ylabel({'c(x)'},'Interpreter','latex');
title({'c(x) en Escala Normal'},'Interpreter','latex');

figure;
semilogy(x,c,'g-'); %grafica con cambio de escala logaritmica en base 10 al eje c(x)
xlabel({'x'},'Interpreter','latex');
ylabel({'c(x)'},'Interpreter','latex');
title({'c(x)en Escala Logartimica'},'Interpreter','latex');
