function [A,B,C,D] = H_to_ME(H1,H2)
    % Tomando H1 como b/(s+a) y H2 como d/(s+c)
    % Luego x1 = b(u-x2)/(s+a)
    %       x2 = d*x1/(s+c)
    % Asi  s*x1 = -a*x1 - b*x2 +b*u
    %      s*x2 = d*x1 - c*x2 + 0*u
    % Entonces 
    %  -   -     -     -   -  -     - -
    % | .x1 |   | -a -b | | x1 |   | b |
    % | .x2 | = |  d -c | | x2 | + | 0 | U
    %  -   -     -     -   -  -     - -
    %      -   -   -  -
    % Y = | 1 0 | | x1 | + 0 * U
    %      -   -  | x2 |
    %              -  -
    % Entonces los polinomios H1 y H2 deben ser 
    % pasados como parametros en matrices
    % H1 = [0,b;1,a]
    % H2 = [0,d;1,c]
    % Luego basta con reemplazar cada uno de los indices de las funciones
    % en las matrioces de las variables del modelo de estado
    
    A = [-H1(2,2),-H1(1,2);H2(1,2),-H2(2,2)];
    
    B = [H1(1,2);0];
        
    C = [1 0];
    
    D = 0;
end

