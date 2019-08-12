function [H] = ME_to_H(A,B,C,D)
    % Las variables del modelo de estado deben tener 
    % la misma dimension del siguiente ejemplo
    %      -   -        - -        -   -
    % A = | a b |  B = | e |  C = | g h |  D = 0
    %     | c d |      | f |       -   -
    %      -   -        - -
    % Sabiendo que H=C*(SI-A)^-1 *B
    % Representando los polinomios 's' por un arreglo de 
    % sus indices, seria [1 0]
    %                 -              -
    %                |  -   -         |
    %                | | 1 0 |    0   |
    %       -   -    |  -   -         |
    % SI = | s 0 | = |         -   -  | 
    %      | 0 s |   |    0   | 1 0 | |
    %       -   -    |         -   -  |
    %                 -              -
    % Dado un proceso  en el que se sigue la representacion 
    % de los polinomios y se calcula H segun las formulas 
    % se obtiene que 
    %                   [ eg+fh  e(hc-dg)+f(gh-ab)]
    % H=C*((SI-A)^-1)*B = ---------------------------
    %                        [ 1  -a-d  ad-bc]
    %    
    % Por lo que ahora, basta con obtener los índices de
    % cada una de las matrices, y se obtiene la representacion 
    % de los indices de los polinomios numerador y denominador
    % que dan lugar a la funcion de transferencia
    
    H = [0,B(1,1)*C(1,1)+B(2,1)*C(1,2), B(1,1)*(C(1,2)*A(2,1)-A(2,2)*C(1,1))+B(2,1)*(C(1,1)*C(1,2)-A(1,1)*A(1,2));1, -A(1,1)-A(2,2), A(1,1)*A(2,2)-A(1,2)*A(2,1)];
    
end

