function [A,B,C,D,dVC,y] = circuitoRC(R1,R2,C1,C2,VC1,VC2,VS)
   % Variables de entrada: VS
   % Variables de estado:  VC1, VC2
   % Variables de salida:  VC1, VC2
   %
   % VS = R1*i1+VC1 = R2*i2+VC"
   % i1 = (VS-VC1)/R1
   % i2 = (VS-VC2)/R2
   %
   % C1*dVC1/dt = i1 = (VS-VC1)/(R1*C1)
   % C2*dVC2/dt = i2 = (VS-VC2)/(R2*C2)
   %
   % dVC1/dt = (VS-VC1)/(R1*C1)
   % dVC2/dt = (VS-VC2)/(R2*C2)
   %
   %  -   -     -                    -   -   -     -         -
   % | .VC1 |   | -1/(R1*C1)     0    | | VC1 |   | 1/(R1*C1) | 
   % | .VC2 | = |     0     -1/(R2*C2)| | VC2 | + | 1/(R2*C2) | VS
   %  -   -     -                    -   -   -     -         -
   %  -   -     -   -   -  -
   % | VC1 | = | 1 0 | | VC1 | + 0*VS
   % | VC2 |   | 0 1 | | VC2 |
   %  -   -     -   -   -  - 
   
   A = [-1/R1*C1,0;0,-1/R2*C2];
   B = [1/R1*C1;1/R2*C2];
   C = [1,0;0,1];
   D = 0;

   y = C * [VC1;VC2]; % y = C*[VC1;VC2] + D*VS
   dVC = A*[VC1;VC2]+B*VS; % dh = A*[VC1,VC2] + B*VS 

end

