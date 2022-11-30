clear variables;
close all;
clc;

%% variables et calculs
N = 1000;
Bande = 100;
Fs = 1000;

m3 = 3;
sigma3 = 2;

[x1,x2,x3,A,B] = syntheseSignauxAleatoires(N,Bande,m3,sigma3);
[H, f] = freqz(B,A,N/2,Fs);

[x1out, ddp1] = calculHistogramme(x1);    
[x2out, ddp2] = calculHistogramme(x2);
[x3out, ddp3] = calculHistogramme(x3);

sigma1 = std(x1)
m1 = mean(x1);
m2 = mean(x2);
sigma2 = std(x2)
m3 = mean(x3);
sigma3 = std(x3)

%Theorique

gaussienne = @(sigma, mu, x)1/(sigma*sqrt(2*pi))*exp(-(x-mu).^2/(2*sigma^2));

x1_out_th = -3:0.01:3;
x2_out_th = -2:0.01:2;
x3_out_th = -4:0.01:9;

ddp1_th = gaussienne(1, 0, x1_out_th);
ddp2_th = gaussienne(sigma2,m2,x2_out_th);
ddp3_th = gaussienne(sigma3,m3,x3_out_th);

%% Affichage
figure(1);

subplot(2, 4 ,1);
plot((1:N)/Fs,x1,'k');
title("Bruit Gaussien de moyenne 0 et d'écart type 1");
xlabel("Temps (en s)");
ylabel("Amplitude du signal");

subplot(2, 4, 2);
plot((1:N)/Fs,x2,'k');
title("Bruit Gaussien filtré par un Passe-Bas");
xlabel("Temps (en s)");
ylabel("Amplitude du signal");

subplot(2, 4, 3);
plot((1:N)/Fs,x3,'k');
title("Bruit Gaussien de moyenne "+int2str(m3)+" et d'écart type "+int2str(sigma3));
xlabel("Temps (en s)");
ylabel("Amplitude du signal");

subplot(2,4,4);
plot(f,abs(H),'k','LineWidth',3);
title("Module du Gain Complexe du filtre Passe-Bas");
xlabel("Fréquence (en Hz)");
ylabel("Module du Gain");

subplot(2,4,5);
hold on;
bar(ddp1,x1out,0.5,'k');
plot(x1_out_th,ddp1_th,'r','LineWidth',3);
title("Densité de probabilité du bruit Gaussien");
xlabel("Amplitude");
ylabel("Densité de probabilité");
legend("ddp Empirique","ddp Théorique");

subplot(2,4,6);
hold on;
bar(ddp2,x2out,0.5,'k');
plot(x2_out_th,ddp2_th,'r','LineWidth',3);
title("Densité de probabilité du bruit Gaussien filtré");
xlabel("Amplitude");
ylabel("Densité de probabilité");
legend("ddp Empirique","ddp Théorique");

subplot(2,4,7);
hold on;
bar(ddp3,x3out,0.5,'k');
plot(x3_out_th,ddp3_th,'r','LineWidth',3);
title("Densité de probabilité du bruit Gaussien filtré et décalé");
xlabel("Amplitude");
ylabel("Densité de probabilité");
legend("ddp Empirique","ddp Théorique");