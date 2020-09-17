function [p,tau] = tandp(CW,m,n)
    i = 1:m; 
    p = 0:0.01:1;
    P = [];
    for k = 1:m
        P = [P;p];
    end
    
    tau1 = 2./(1+CW+CW*p.*sum((2*P).^(i')));
    tau2 = 1-(1-p).^(1/(n-1)); 
    
    [p,tau] = polyxpoly(p,tau1,p,tau2);
end

