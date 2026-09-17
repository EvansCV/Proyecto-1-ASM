% a) Generación de señal conocida y sus ecos
fs = 44100;           % Frecuencia de muestreo
vs = 343;             % Velocidad del sonido
t_tx = 0:1/fs:0.05;   % Duración de 50 ms

% Generación del chirp matemáticamente
f0 = 1000; f1 = 5000; T_total = t_tx(end);
tx = sin(2 * pi * (f0 .* t_tx + ((f1 - f0) / (2 * T_total)) .* (t_tx.^2)));

% Simulación de un eco (objeto a 2 metros) con ruido
tiempo_vuelo_real = (2 * 2.0) / vs;
muestras_retardo = round(tiempo_vuelo_real * fs);
rx = [zeros(1, muestras_retardo), 0.3 * tx];
rx = rx + 0.05 * randn(1, length(rx)); % Se añade ruido y reflexiones

% b) Implementación directa de la correlación
% Se inicia la medición de tiempo. Utilizando la convolución con la señal
% transmitida invertida (fliplr), lo cual es el equivalente
% matemático a la correlación cruzada directa en el dominio del tiempo.
tic();
r_directa = conv(rx, fliplr(tx));
tiempo_directa = toc();

% c) Implementación de la correlación mediante FFT
tic();
L = length(tx) + length(rx) - 1;
TX = fft(tx, L);
RX = fft(rx, L);

% Relación entre convolución y multiplicación en frecuencia
R_xy_frecuencia = conj(TX) .* RX;
r_fft = abs(ifft(R_xy_frecuencia));
tiempo_fft = toc();

% d) Comparación de tiempos
disp('--- Comparación de Tiempos de Ejecución ---');
disp(['Correlación Directa (O(N^2)): ', num2str(tiempo_directa), ' segundos']);
disp(['Correlación por FFT (O(N log N)): ', num2str(tiempo_fft), ' segundos']);

% Visualización para e) Recopilación de imágenes
figure;
subplot(2,1,1);
plot(abs(r_directa), 'LineWidth', 1.2);
title('b) Resultado de Correlación Directa');
xlabel('Muestras de Retardo'); ylabel('Magnitud');
grid on;

subplot(2,1,2);
plot(r_fft, 'LineWidth', 1.2, 'color', 'r');
title('c) Resultado de Correlación mediante FFT');
xlabel('Muestras de Retardo'); ylabel('Magnitud');
grid on;
