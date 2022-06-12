function I=prob_cum(x,N)
    nodi=linspace(0,x,N+1)';
    pesi=x.*[1/2,ones(1,N-1),1/2]./N;
    integranda=@(t) exp(-t.^2)/sqrt(pi);
    I=pesi*integranda(nodi);
end
