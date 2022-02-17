# Signals-Processing-PPG

'Signals_v1.mat' y 'Signals_v2.mat', son estructuras que contienen los señales adquiridas. La duración de las señales es de 120 segundos. En cada estructura la columna 1 pertenece a la luz infrarroja, la columna 2 a la luz roja y la columna 3 a la luz verde. Las señales individuales estan distribuidas en los renglones, de la siguiente manera: el renglon 1 y 2, tienen una frecuencia respiratoria de 10 rpm (0.166 Hz), los renglones 3 y 4 tienen una frecuencia respiratoria de 15 rpm (0.25 Hz), los renglones 5 y 6 tienen una frecuencia respiratoria de 20 rpm (0.333 Hz). En la estructura v1, el sensor estar encapsulado en una pinza de un pulsioximetro, en la estructura v2, además de estar encapsulado el sensosr en una pinza, esta cubierto con una toalla.

El archivo de 'RawSignals.m' contiene el código con el cual se creó cada una de las estructuras.

El archivo 'Preprocesamiento.m' es el código principal, donde se obtienen los componentes AC/DC (con filtros Butterworth y FFT) y el PSD (método de Welch) de cada señal, además de normalizar para poder visualizar que sobrepuestas cada una de las ondas de luz tienen la misma forma. 'PSDwelch.m', es una función que se utiliza en el código principal para poder hacer el cálculo de la PSD de las señales

'Observaciones.docx', se presentan las figuras mas representantivas y una breve descripción.
