clear variables;
close all;
clc;

%% variables et calculs
Bande = 100;
Fs = 1000;
m3 = 3;
sigma3 = 2;
M = 20;

gaussienne = @(sigma, mu, x)1/(sigma*sqrt(2*pi))*exp(-(x-mu).^2/(2*sigma^2));

%Theorique
x1_out_th = -3:0.01:3;
ddp1_th = gaussienne(1, 0, x1_out_th);

N = 16;

for i=1:8
    
[x1,x2,x3,A,B] = syntheseSignauxAleatoires(N,Bande,m3,sigma3);
[x1out, ddp1] = calculHistogramme(x1,M);

%Encadrement
deltaX = (x1out(2)-x1out(1));
B_sup = ddp1_th+sqrt((ddp1_th/N).*((1/deltaX)-ddp1_th));


%% Affichage
figure(1);
    subplot(2,4,i);
    hold on;
    stem(ddp1,x1out); 
    plot(x1_out_th,ddp1_th,'r','LineWidth',3); %Theorique
    xline(-(std(x1_out_th)),'b','LineWidth',3); %Precision th
    xline((std(x1_out_th)),'b','LineWidth',3); %Precision th
    title("Densité de probabilité du bruit Gaussien, N= "+int2str(N));
    xlabel("Amplitude");
    ylabel("Densité de probabilité");
    legend("ddp Empirique","ddp Théorique");
    
    N=N*2;
end

