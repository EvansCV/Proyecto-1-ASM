# Código para la experimentación con la FFT

# Primero la transformada discreta
tic();

x = [2, 4, 6, 8, 10, 12, 14, 16, 18 20] # Entrada elegida para emitir en función de tres valores
N = length(x) # Es el número de componente del vector
X = zeros(10,1) # Genera una matriz con una fila de tantas columnas que es el tamaño

for k = 0: N - 1 # Se crea un ciclo for desde k=0 hasta N - 1
    for n = 0: N - 1 # Se crea un ciclo for para el número de muestras
        X(k + 1) = X(k + 1) + x(n + 1)*exp((-j*2*pi*n*k)/N) # Aquï se aplica la sumatoria aumentando k y n
    endfor
    DFT = x
endfor # finaliza la transformada
toc();
