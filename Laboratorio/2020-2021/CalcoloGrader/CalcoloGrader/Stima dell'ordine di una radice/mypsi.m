function Psi=mypsi(x)
if x>=0
    Psi=psi(x);
else
    Psi=psi(1-x)-pi./(tan(pi*x));
end
    