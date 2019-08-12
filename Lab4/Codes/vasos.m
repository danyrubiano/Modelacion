function [A,B,C,D,dh,y] = parte2(A1,A2,h1,h2,F0)
   % Variables de entrada: F0
   % Variables de estado:  h1, h2
   % Variables de salida:  F2
   %
   % dV1/dt = F0-F1
   % dV2/dt = F1-F2
   %
   % (dh1*A1)/dt = F0 - (h1-h2)
   % (dh2*A2)/dt = (h1-h2) - h2
   %
   % dh1/dt = F0/A1 - (h1-h2)/A1
   % dh2/dt = h1/A2 - 2h2/A2
   %  -   -     -           -   -  -     -    -
   % | .h1 |   | -1/A1  1/A1 | | h1 |   | 1/A1 | 
   % | .h2 | = |  1/A2 -2/A2 | | h2 | + |  0   | F0
   %  -   -     -           -   -  -     -    -
   %      -   -   -  -
   % y = | 0 1 | | h1 | + 0*F2
   %      -   -  | h2 |
   %              -  - 
   
   A = [-1/A1,1/A1;1/A2,-2/A2];
   B = [1/A1;0];
   C = [0,1];
   D = 0;
   
   y = C * [h1;h2]; % y = C*[h1;h2] + D*F2
   dh = A*[h1;h2]+B*F0; % dh = A*[h1,h2] + B*F0 
   
end

