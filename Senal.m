# Código para la experimentación con la FFT

# Señal generada y su comportamiento

% 1. Parámetros de la señal
fs = 1000;           % Frecuencia de muestreo (Hz)
t = 0:1/fs:1-1/fs;   % Vector de tiempo (1 segundo de duración)
N = length(t);       % Número de muestras (N = 1000)

% 2. Generación de una señal compuesta (ej. 50 Hz y 120 Hz)
% Diferentes señales: puedes cambiar estas funciones para probar otras formas
f1 = 50;
f2 = 120;
x = sin(2*pi*f1*t) + 0.5*cos(2*pi*f2*t);

% 3. Cálculo de la FFT
X = fft(x);

% 4. Cálculo de Magnitud
% Se normaliza dividiendo entre N.
magnitud = abs(X) / N;

% Por simetría de señales reales, solo graficamos la primera mitad (hasta Nyquist)
magnitud_mitad = magnitud(1:floor(N/2)+1);
% Se multiplica por 2 para conservar la energía (excepto la componente DC)
magnitud_mitad(2:end-1) = 2 * magnitud_mitad(2:end-1);
f = fs*(0:floor(N/2))/N; % Eje de frecuencias en Hz

% 5. Cálculo de la Fase
% Se aplica un umbral para ignorar la fase donde la magnitud es casi cero (ruido numérico)
umbral = 1e-5;
X_limpia = X;
X_limpia(abs(X)/N < umbral) = 0;
fase = angle(X_limpia);
fase_mitad = fase(1:floor(N/2)+1);

% 6. Visualización
figure;
subplot(3,1,1);
plot(t(1:100), x(1:100), 'LineWidth', 1.5); % Mostramos solo un fragmento
title('Señal en el Dominio del Tiempo'); xlabel('Tiempo (s)'); ylabel('Amplitud');
grid on;

subplot(3,1,2);
stem(f, magnitud_mitad, 'Marker', 'none', 'LineWidth', 1.5);
title('Espectro de Magnitud'); xlabel('Frecuencia (Hz)'); ylabel('|X(f)|');
xlim([0 150]); % Hacemos zoom en las frecuencias de interés
grid on;

subplot(3,1,3);
stem(f, fase_mitad, 'Marker', 'none', 'LineWidth', 1.5);
title('Espectro de Fase'); xlabel('Frecuencia (Hz)'); ylabel('Fase (rad)');
xlim([0 150]);
grid on;
