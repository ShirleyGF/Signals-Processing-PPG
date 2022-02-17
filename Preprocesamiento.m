%% Carga de las señales
clear all, close all, clc

% Cargar una de las versiones de las señales adquiridas
%   v1 es el sensor en la pinza y v2 es el sensor en la pinza y ademas
%   tapado con una toalla

% load('Signals_v1.mat');
load('Signals_v2.mat');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ========== Filtros Butterwoth para obtener componentes en AC y DC ==========

fs = 100;
t = [1:120*fs]/fs;

%Butterworth Pasabajas (4to orden, 1 Hz)  (DC)
f1 = 1;
w1 = f1/(fs/2);
[B1,A1] = butter(4,w1);

%Butterworth Pasabandas (4to orden, 1-3 Hz)  (AC)
fpb = [1 3];
wpb = fpb/(fs/2);
[Bpb,Apb] = butter(4,wpb);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ========== Filtrado de las señales de PPG sin normalizar ==========
for i=1:6       % mediante filtros butter
    %Componentes luz INFRARROJA
    Signals(i).IR_DC = filtfilt(B1, A1, Signals(i).IR);
    Signals(i).IR_AC = filtfilt(Bpb, Apb, Signals(i).IR);
    
    %Componentes luz ROJA
    Signals(i).RED_DC = filtfilt(B1, A1, Signals(i).RED);
    Signals(i).RED_AC = filtfilt(Bpb, Apb, Signals(i).RED);
    
    %Componentes luz VERDE
    Signals(i).GREEN_DC = filtfilt(B1, A1, Signals(i).GREEN);
    Signals(i).GREEN_AC = filtfilt(Bpb, Apb, Signals(i).GREEN);
end

L=120*fs;
NFFT = 2^nextpow2(L); 
for i=1:6       % mediante la FFT
    %Componentes luz INFRARROJA
    Y = fft(Signals(i).IR,NFFT)/L;
    Signals(i).IR_dc = Y(1);
    Signals(i).IR_ac = Y(2:end);
    
    %Componentes luz ROJA
    Y = fft(Signals(i).RED,NFFT)/L;
    Signals(i).RED_dc = Y(1);
    Signals(i).RED_ac = Y(2:end);
    
    %Componentes luz VERDE
    Y = fft(Signals(i).GREEN,NFFT)/L;
    Signals(i).GREEN_dc = Y(1);
    Signals(i).GREEN_ac = Y(2:end);
end


%% ========== Graficas ==========
for i=1:6
    figure
    ax1=subplot(331); plot(t,Signals(i).IR,'b'); title('IR, cruda')
    ax2=subplot(334); plot(t,Signals(i).IR_DC,'b'); title('IR, DC')
    ax3=subplot(337); plot(t,Signals(i).IR_AC,'b'); title('IR, AC')

    ax4=subplot(332); plot(t,Signals(i).RED,'r'); title('RED, cruda')
    ax5=subplot(335); plot(t,Signals(i).RED_DC,'r'); title('RED, DC')
    ax6=subplot(338); plot(t,Signals(i).RED_AC,'r'); title('RED, AC')
    
    ax7=subplot(333); plot(t,Signals(i).GREEN,'g'); title('GREEN, cruda')
    ax8=subplot(336); plot(t,Signals(i).GREEN_DC,'g'); title('GREEN, DC')
    ax9=subplot(339); plot(t,Signals(i).GREEN_AC,'g'); title('GREEN, AC')

    %linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');    linkaxes([ax7,ax8,ax9],'x');   
    linkaxes([ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8,ax9],'x');
    xlim([ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8,ax9],[0 120]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ========== Filtrado de las señales de PPG Normalizadas ==========

for i=1:6       % señales normalizadas con media 0 y varianza 1
    SNormalize(i).IR = (Signals(i).IR - mean(Signals(i).IR)) / std(Signals(i).IR);
    SNormalize(i).RED = (Signals(i).RED - mean(Signals(i).RED)) / std(Signals(i).RED);
    SNormalize(i).GREEN = (Signals(i).GREEN - mean(Signals(i).GREEN)) / std(Signals(i).GREEN);
    
    figure
    plot(t,SNormalize(i).IR,'b',t,SNormalize(i).RED,'r',t,SNormalize(i).GREEN,'g')
    title('Señales')
    legend('IR','RED','GREEN')
end

for i=1:6       % mediante filtros butter
    %Componentes luz INFRARROJA
    SNormalize(i).IR_DC = filtfilt(B1, A1, SNormalize(i).IR);
    SNormalize(i).IR_AC = filtfilt(Bpb, Apb, SNormalize(i).IR);
    
    %Componentes luz ROJA
    SNormalize(i).RED_DC = filtfilt(B1, A1, SNormalize(i).RED);
    SNormalize(i).RED_AC = filtfilt(Bpb, Apb, SNormalize(i).RED);
    
    %Componentes luz VERDE
    SNormalize(i).GREEN_DC = filtfilt(B1, A1, SNormalize(i).GREEN);
    SNormalize(i).GREEN_AC = filtfilt(Bpb, Apb, SNormalize(i).GREEN);
end

L=120*fs;
NFFT = 2^nextpow2(L); 
for i=1:6       % mediante la FFT
    %Componentes luz INFRARROJA
    Y = fft(SNormalize(i).IR,NFFT)/L;
    SNormalize(i).IR_dc = Y(1);
    SNormalize(i).IR_ac = Y(2:end);
    
    %Componentes luz ROJA
    Y = fft(Signals(i).RED,NFFT)/L;
    SNormalize(i).RED_dc = Y(1);
    SNormalize(i).RED_ac = Y(2:end);
    
    %Componentes luz VERDE
    Y = fft(Signals(i).GREEN,NFFT)/L;
    SNormalize(i).GREEN_dc = Y(1);
    SNormalize(i).GREEN_ac = Y(2:end);
end

%% ========== Graficas ==========
for i=1:6
    figure
    ax1=subplot(331); plot(t,SNormalize(i).IR,'b'); title('IR, cruda')
    ax2=subplot(334); plot(t,SNormalize(i).IR_DC,'b'); title('IR, DC')
    ax3=subplot(337); plot(t,SNormalize(i).IR_AC,'b'); title('IR, AC')

    ax4=subplot(332); plot(t,SNormalize(i).RED,'r'); title('RED, cruda')
    ax5=subplot(335); plot(t,SNormalize(i).RED_DC,'r'); title('RED, DC')
    ax6=subplot(338); plot(t,SNormalize(i).RED_AC,'r'); title('RED, AC')
    
    ax7=subplot(333); plot(t,SNormalize(i).GREEN,'g'); title('GREEN, cruda')
    ax8=subplot(336); plot(t,SNormalize(i).GREEN_DC,'g'); title('GREEN, DC')
    ax9=subplot(339); plot(t,SNormalize(i).GREEN_AC,'g'); title('GREEN, AC')

    %linkaxes([ax1,ax2,ax3],'x');    linkaxes([ax4,ax5,ax6],'x');    linkaxes([ax7,ax8,ax9],'x');   
    linkaxes([ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8,ax9],'x');
    xlim([ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8,ax9],[0 120]);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ========== Densidad Espectral de Potencia =========
% (De las señales que no estan normalizadas)
OrdPol = 5; 
for i=1:6
    [PSD(i).pIR,PSD(i).fIR] = PSDwelch(Signals(i).IR,OrdPol,t',fs);
    [PSD(i).pRED,PSD(i).fRED] = PSDwelch(Signals(i).RED,OrdPol,t',fs);
    [PSD(i).pGREEN,PSD(i).fGREEN] = PSDwelch(Signals(i).GREEN,OrdPol,t',fs);
    
    figure
    plot(PSD(i).fIR,20*log10(abs(PSD(i).pIR)),'b');   hold on;
    plot(PSD(i).fRED,20*log10(abs(PSD(i).pRED)),'r'); 
    plot(PSD(i).fGREEN,20*log10(abs(PSD(i).pGREEN)),'g');
    ylabel('Power/frequency (dB/Hz)');  xlabel('Frequency (Hz)');   title('Power Spectrum')
    legend('IR','RED','GREEN'); grid on;
end
    
%% ==========  =========