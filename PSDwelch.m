function [pxx,f]=PSDwelch(signal,OrdPol,t,fs2)

%Quitando tendencia lineal
signald = detrend(signal);
p = polyfit(t,signald,OrdPol);
f = polyval(p,t);
signaltend = signald - f;

%Remuestreo
timenew = [t(1):(1/fs2):t(end)]'; %vector de tiempo nuevo de la señal 
signalnew = spline(t,signaltend,timenew);

%PSD por el metodo de welch
[pxx,f] = pwelch(signalnew,[],[],[],fs2);

% L=length(signal);
% NFFT = 2^nextpow2(L); 
% %PSD por el metodo del periodograma
% [pxx,f] = periodogram(signalnew,[],NFFT,fs2);