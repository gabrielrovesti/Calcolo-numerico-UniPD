% Definire le successioni u_n, z_n, y_n
u = @(u) sqrt((length(u)+1).^2 .* u(end).^2 + 6) ./ (length(u)+1);
z = @(z) 2.^(length(z)+1/2) .* sqrt(1 - sqrt(1 - 4.^(-length(z)) .* z(end).^2));
y = @(y) sqrt(2) .* y(end) ./ sqrt(1 + sqrt(1 - 4.^(-length(y)) .* y(end).^2));

% Calcolo delle successioni
U = SuccessioneRicorsiva(sqrt(6),u,99);
Z = SuccessioneRicorsiva(2,z,99);
Y = SuccessioneRicorsiva(2,y,99);

% Calcolo degli errori assoluti
err_U = abs(U-pi);
err_Z = abs(Z-pi);
err_Y = abs(Y-pi);

% Grafico
figure(1)
semilogy(err_U(1:45),' .')
hold on
semilogy(err_Z(1:45),' +')
semilogy(err_Y(1:45),' o')
hold off