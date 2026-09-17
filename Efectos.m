% 1. Parámetros de la señal
fs = 200;           % Frecuencia de muestreo (Hz)
t = 0:1/fs:1-1/fs;  % Vector de tiempo (1 segundo de duración)
N = length(t);      % Número de muestras (N = 200)

% 2. Generación de una señal compuesta
% f1 generará fuga espectral (50.5 no es múltiplo entero de la resolución)
% f2 generará aliasing (150 Hz es mayor a la frecuencia de Nyquist que es 100 Hz)
f1 = 50.5;
f2 = 150;
x = sin(2*pi*f1*t) + 0.5*cos(2*pi*f2*t);

% 3. Cálculo de la FFT
X = fft(x);

% 4. Cálculo de Magnitud Completa
% Se normaliza dividiendo entre N
magnitud_completa = abs(X) / N;

% Eje de frecuencias completo: va desde 0 hasta (N-1), escalado a Hz
f_completa = fs * (0:(N-1)) / N;

% 5. Cálculo de la Fase Completa
% Se aplica un umbral para ignorar la fase donde la magnitud es casi cero
umbral = 1e-5;
X_limpia = X;
X_limpia(abs(X)/N < umbral) = 0;
fase_completa = angle(X_limpia);

% 6. Visualización
figure;
subplot(3,1,1);
plot(t(1:100), x(1:100), 'LineWidth', 1.5);
title('Señal en el Dominio del Tiempo'); xlabel('Tiempo (s)'); ylabel('Amplitud');
grid on;

subplot(3,1,2);
stem(f_completa, magnitud_completa, 'Marker', 'none', 'LineWidth', 1.5);
title('Espectro de Magnitud Completo (Muestra Aliasing, Fuga y Simetría)');
xlabel('Frecuencia (Hz)'); ylabel('|X(f)|');
xlim([0 fs]); % Mostramos todo el espectro de 0 a 200 Hz
grid on;

subplot(3,1,3);
stem(f_completa, fase_completa, 'Marker', 'none', 'LineWidth', 1.5);
title('Espectro de Fase Completo');
xlabel('Frecuencia (Hz)'); ylabel('Fase (rad)');
xlim([0 fs]);
grid on;
