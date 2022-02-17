%% Señales Crudas
%Esta porción de código sirve para asignar y visualizar las señales crudas
%obtenidas directamento del sensor

%En cada archivo .csv existen 4 columnas, la primera es el numero del dato,
%la segunda es la señal de la luz infrarroja, la tercera la señal de la luz
%roja y la cuarta la señal de la luz verde

%Las señales tienen una frecuencia de muestreo de 100 Hz y fueron obtenidas
%durante 2 minutos (120 segundos), mediante diferentes maniobras indicadas
%en el nombre del archivo de la siguiente manera:
%   "version - rpm _ # de rpms - # de archivo.csv"

%Fecha de creación: 08/02/2022
%Ultimas modificaciones:
%   13/02/22: se agrego la segunda seccion para crear la estructura de las
%       segunda version de las señales adquiridas

clear all, close all, clc

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Asignacion de los archivos .csv a una variable
signal1 = load('v1-rpm_10-1.csv_PPG.csv');
signal2 = load('v1-rpm_10-2.csv_PPG.csv');
signal3 = load('v1-rpm_15-1.csv_PPG.csv');
signal4 = load('v1-rpm_15-2.csv_PPG.csv');
signal5 = load('v1-rpm_20-1.csv_PPG.csv');
signal6 = load('v1-rpm_20-2.csv_PPG.csv');

% Separando cada una de las señales en una variable
Signals_v1(1).IR = signal1(:,2);   Signals_v1(1).RED = signal1(:,3);     Signals_v1(1).GREEN = signal1(:,4);
Signals_v1(2).IR = signal2(:,2);   Signals_v1(2).RED = signal2(:,3);     Signals_v1(2).GREEN = signal2(:,4);
Signals_v1(3).IR = signal3(:,2);   Signals_v1(3).RED = signal3(:,3);     Signals_v1(3).GREEN = signal3(:,4);
Signals_v1(4).IR = signal4(:,2);   Signals_v1(4).RED = signal4(:,3);     Signals_v1(4).GREEN = signal4(:,4);
Signals_v1(5).IR = signal5(:,2);   Signals_v1(5).RED = signal5(:,3);     Signals_v1(5).GREEN = signal5(:,4);
Signals_v1(6).IR = signal6(:,2);   Signals_v1(6).RED = signal6(:,3);     Signals_v1(6).GREEN = signal6(:,4);

% Vector de tiempo
fs = 100;
t = [1:length(signal1(:,1))]/fs;

% Grafica Señales Crudas
figure('name','10 rpm')
ax1=subplot(321); plot(t,Signals_v1(1).IR,'b'); title('Infrarrojo');
ax2=subplot(323); plot(t,Signals_v1(1).RED,'r'); title('Rojo');
ax3=subplot(325); plot(t,Signals_v1(1).GREEN,'g'); title('Verde');

ax4=subplot(322); plot(t,Signals_v1(2).IR,'b'); title('Infrarrojo');
ax5=subplot(324); plot(t,Signals_v1(2).RED,'r'); title('Rojo');
ax6=subplot(326); plot(t,Signals_v1(2).GREEN,'g'); title('Verde');

linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');

figure('name','15 rpm')
ax1=subplot(321); plot(t,Signals_v1(3).IR,'b'); title('Infrarrojo');
ax2=subplot(323); plot(t,Signals_v1(3).RED,'r'); title('Rojo');
ax3=subplot(325); plot(t,Signals_v1(3).GREEN,'g'); title('Verde');

ax4=subplot(322); plot(t,Signals_v1(4).IR,'b'); title('Infrarrojo');
ax5=subplot(324); plot(t,Signals_v1(4).RED,'r'); title('Rojo');
ax6=subplot(326); plot(t,Signals_v1(4).GREEN,'g'); title('Verde');

linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');

figure('name','20 rpm')
ax1=subplot(321); plot(t,Signals_v1(5).IR,'b'); title('Infrarrojo');
ax2=subplot(323); plot(t,Signals_v1(5).RED,'r'); title('Rojo');
ax3=subplot(325); plot(t,Signals_v1(5).GREEN,'g'); title('Verde');

ax4=subplot(322); plot(t,Signals_v1(6).IR,'b'); title('Infrarrojo');
ax5=subplot(324); plot(t,Signals_v1(6).RED,'r'); title('Rojo');
ax6=subplot(326); plot(t,Signals_v1(6).GREEN,'g'); title('Verde');

linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');




%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Asignacion de los archivos .csv a una variable
signal1 = load('v2-rpm_10-1.csv_PPG.csv');
signal2 = load('v2-rpm_10-2.csv_PPG.csv');
signal3 = load('v2-rpm_15-1.csv_PPG.csv');
signal4 = load('v2-rpm_15-2.csv_PPG.csv');
signal5 = load('v2-rpm_20-1.csv_PPG.csv');
signal6 = load('v2-rpm_20-2.csv_PPG.csv');

% Asignando las señales a una estructura
Signals_v2(1).IR = signal1(:,2);   Signals_v2(1).RED = signal1(:,3);     Signals_v2(1).GREEN = signal1(:,4);
Signals_v2(2).IR = signal2(:,2);   Signals_v2(2).RED = signal2(:,3);     Signals_v2(2).GREEN = signal2(:,4);
Signals_v2(3).IR = signal3(:,2);   Signals_v2(3).RED = signal3(:,3);     Signals_v2(3).GREEN = signal3(:,4);
Signals_v2(4).IR = signal4(:,2);   Signals_v2(4).RED = signal4(:,3);     Signals_v2(4).GREEN = signal4(:,4);
Signals_v2(5).IR = signal5(:,2);   Signals_v2(5).RED = signal5(:,3);     Signals_v2(5).GREEN = signal5(:,4);
Signals_v2(6).IR = signal6(:,2);   Signals_v2(6).RED = signal6(:,3);     Signals_v2(6).GREEN = signal6(:,4);

% Vector de tiempo
fs = 100;
t = [1:length(signal1(:,1))]/fs;

% Grafica Señales Crudas
figure('name','10 rpm')
ax1=subplot(321); plot(t,Signals_v2(1).IR,'b'); title('Infrarrojo');
ax2=subplot(323); plot(t,Signals_v2(1).RED,'r'); title('Rojo');
ax3=subplot(325); plot(t,Signals_v2(1).GREEN,'g'); title('Verde');

ax4=subplot(322); plot(t,Signals_v2(2).IR,'b'); title('Infrarrojo');
ax5=subplot(324); plot(t,Signals_v2(2).RED,'r'); title('Rojo');
ax6=subplot(326); plot(t,Signals_v2(2).GREEN,'g'); title('Verde');

linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');

figure('name','15 rpm')
ax1=subplot(321); plot(t,Signals_v2(3).IR,'b'); title('Infrarrojo');
ax2=subplot(323); plot(t,Signals_v2(3).RED,'r'); title('Rojo');
ax3=subplot(325); plot(t,Signals_v2(3).GREEN,'g'); title('Verde');

ax4=subplot(322); plot(t,Signals_v2(4).IR,'b'); title('Infrarrojo');
ax5=subplot(324); plot(t,Signals_v2(4).RED,'r'); title('Rojo');
ax6=subplot(326); plot(t,Signals_v2(4).GREEN,'g'); title('Verde');

linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');

figure('name','20 rpm')
ax1=subplot(321); plot(t,Signals_v2(5).IR,'b'); title('Infrarrojo');
ax2=subplot(323); plot(t,Signals_v2(5).RED,'r'); title('Rojo');
ax3=subplot(325); plot(t,Signals_v2(5).GREEN,'g'); title('Verde');

ax4=subplot(322); plot(t,Signals_v2(6).IR,'b'); title('Infrarrojo');
ax5=subplot(324); plot(t,Signals_v2(6).RED,'r'); title('Rojo');
ax6=subplot(326); plot(t,Signals_v2(6).GREEN,'g'); title('Verde');

linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');
