function Nu_avg = combinedEntry_calcNu(Re, Pr, D, x)

Gzd = Re*Pr/(x/D);

Nu_avg = (3.66/(tanh(2.264*Gzd^(-1/3) + 1.7*Gzd^(-2/3))) + ...
    (.0499*Gzd*tanh(Gzd^-1)))/(tanh(2.432*Pr^(1/6)*Gzd^(-1/6)));

end