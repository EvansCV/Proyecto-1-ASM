# Código para la experimentación con la FFT

# Ahora con la transformada rápida de Fourier

% Función recursiva para la FFT (Algoritmo Radix-2)
x = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32];
function X = mi_fft(x)
    N = length(x);

    % Caso base de la recursividad
    if N <= 1
        X = x;
    else
        % Separación de componentes en índices pares e impares
        pares = mi_fft(x(1:2:N));
        impares = mi_fft(x(2:2:N));

        % Factor de giro (Twiddle factor)
        k = 0:(N/2 - 1);
        factor = exp(-2i * pi * k / N);

        % Combinación de resultados
        mitad_1 = pares + factor .* impares;
        mitad_2 = pares - factor .* impares;

        X = [mitad_1, mitad_2];
    end
end

% --- Prueba de tiempos de ejecución ---
% Esto es basado en el algoritmo Radix-2 Estándar, por lo tanto N debe ser alguna potencia de 2


tic();
X_fft = mi_fft(x);
tiempo_fft = toc();



disp(['Tiempo de ejecución FFT: ', num2str(tiempo_fft), ' segundos']);
disp(X_fft)
