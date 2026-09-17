# Proyecto-1-ASM
Repo correspondiente al primer proyecto de Análisis de Señales Mixtas, que consiste en crear un sistema de radar acústico para estimación de distancia.
Los estudiantes deben generar un sistema de radar ac´ustico capaz de detectar un objeto y
estimar su distancia mediante el an´alisis del eco producido por una se˜nal ac´ustica conocida.
Para esto deber´an implementar un sistema transmisor, receptor y procesador digital de se˜nales
utilizando uno o m´as microcontroladores.
El sistema deber´a transmitir una se˜nal ac´ustica conocida, capturar el eco producido por un
objeto, determinar el tiempo de vuelo de la se˜nal y calcular la distancia aproximada al objeto.
Para aumentar la robustez de la detecci´on, los estudiantes utilizar´an t´ecnicas de an´alisis
espectral mediante FFT y correlaci´on. La se˜nal transmitida podr´a consistir en un pulso ac´ustico,
una secuencia de pulsos o un chirp de frecuencia conocida definido por los estudiantes dentro del
rango permitido por el hardware seleccionado.
El sistema tendr´a la siguiente funcionalidad:
1. Transmisor: Generar´a una se˜nal ac´ustica conocida y la reproducir´a mediante un parlante
o transductor. La se˜nal deber´a estar dise˜nada de manera que pueda ser identificada posteriormente en la se˜nal recibida. Los estudiantes deber´an justificar la frecuencia, duraci´on,
frecuencia de muestreo y energ´ıa de la se˜nal utilizada.
2. Receptor: Capturar´a mediante un micr´ofono o transductor la se˜nal ac´ustica directa y las
reflexiones producidas por el objeto. El microcontrolador deber´a digitalizar la se˜nal y
utilizar herramientas de procesamiento digital para identificar el eco correspondiente al
objeto.
3. Procesamiento: El sistema deber´a utilizar la FFT para analizar el contenido espectral de la
se˜nal recibida y deber´a utilizar correlaci´on, convoluci´on o una implementaci´on equivalente
en el dominio de la frecuencia para determinar el retardo temporal asociado al eco.

4. Estimaci´on de distancia: A partir del tiempo de vuelo estimado, el sistema deber´a calcular
la distancia aproximada al objeto. Para una configuraci´on monost´atica, donde el transmisor
y receptor se encuentren aproximadamente en la misma posici´on, se utilizar´a:
d = v_sτ/2
donde d corresponde a la distancia al objeto, vs corresponde a la velocidad del sonido y τ
corresponde al tiempo de vuelo medido.
5. Visualizaci´on: El sistema deber´a mostrar la distancia estimada en una pantalla LCD,
OLED, terminal serial u otro dispositivo de visualizaci´on aprobado por el profesor.
