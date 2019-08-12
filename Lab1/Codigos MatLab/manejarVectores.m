function [] = manejarVectores(vector)

    if isnumeric(vector)==0 %verifica si el vector ingresado contiene solo valores numericos
        fprintf('El formato de los datos es invalido. Se deben ingresar valores numericos.\n')
    end
    if length(vector)<4 %verifica si el vector posee minimo cuatro elementos. Si posee 4 elementos la operacion debe ser cero, ya que los 4 mayores son igual que los 4 menores
        fprintf('La entrada de datos requerida debe tener 4 elementos como minimo.\n')
    end
    if isnumeric(vector)==1 && length (vector)>=4
        n=length(vector);
        %ordenamiento decreciente mediante burbuja
        for a= 1:n
            for j=1:n-1
                if vector(j)>vector(j+1)
                    aux=vector(j);
                    vector(j)=vector(j+1);
                    vector(j+1)=aux;
                end
            end
        end
        vector1=vector(n-3:n); %Vector con los 4 mayores valores
        vector2=vector(1:4); %Vector con los 4 menores valores

        acumulador1=0.0;
        acumulador2=0.0;
        for i=1:4
            acumulador1=acumulador1+(vector1(i)); %suma de los 4 mayores valores
            acumulador2=acumulador2+sqrt(vector2(i)); %suma de la raiz de los 4 menores valores
        end
        acumulador1=sqrt(acumulador1); %raiz de la suma de los 4 mayores valores               
        resultado=acumulador1-acumulador2;
        fprintf('El resultado de la raiz cuadrada de la suma de los 4 elementos de mayor valor,\nmenos el resultado de la suma de la raiz cuadrada de los 4 elementos de menor valor es: %8f\n',resultado);
    end
end