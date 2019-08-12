function []= N_Raphson(polinomio,max_iter,error,x0)
    raiz=x0;
    df=polyder(polinomio);
        
    if error >= abs (polyval(polinomio,raiz))
        fprintf ('La raiz aproximada es: %4f\n',raiz)
        return;
    else 
        xn= x0 - polyval(polinomio,x0)/polyval(df,x0);
        N_Raphson(polinomio,max_iter - 1,error,xn);
    end
end