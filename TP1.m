clear all
close all
clc

fe = 1e4;
te = 1/fe;
N = 5000; 

t = (0:N-1)*te; 

%% Repr�sentation temporelle et fr�quentielle

x = 1.2*cos(2*pi*440*t+1.2)+3*cos(2*pi*550*t)+0.6*cos(2*pi*2500*t);
figure;

% Question 1:


subplot(2,3,1)
plot(t,x,'.');
title('Le signal x(t)')


%Question 2:

%Step 1: cr�� le vecteur f qui correspond � l'�chantillonnage du signal 
%dans l'espace fr�quentiel
f =(0:N-1)*(fe/N); 
%Utilisation de la commande fft qui correspond a faire la transformee
%de fourier discret d'une mani�re rapide 
y = fft(x); 
%sans decalage
% On fait abs pour avoir le module  
subplot(2,3,2)
plot(f,abs(y));
%avec la commande fft on obtient un spectre qui n'est pas centr� sur 0
title("Le spectre d'amplitude")


%Question 3:

%Pour centr� le spectre on doit cr�er une autre variable dont on va tracer
%la fonction fftshift qui fait le d�calage
fshift = (-N/2:N/2-1)*(fe/N);
subplot(2,3,3)
%On multiplie par 2 pour avoir l'ampliture exact avant on obtient le module
%de Cn
plot(fshift,fftshift(2*abs(y)/N))
title("Le spectre d'amplitude centr�")


%Question 4:

%Introduction de bruit 
noise = 5*randn(size(x));
subplot(2,3,4)
plot(noise)
title("Le signal noise")


%Question 5:

%sound(noise)
xnoise = x+noise;
%sound(xnoise)


%Question 6:

ybruit = fft(xnoise);
subplot(2,3,5)
% plot(fshift,fftshift((abs(ybruit)).^2/N));
plot(fshift,fftshift((abs(ybruit)*2)/N));
title("Le signal noise ")


%Question 7:
figure;
noise2 = 20*randn(size(x));
xnoise2=x+noise2;
ybruit2 = fft(xnoise2);
plot(fshift,fftshift((abs(ybruit2))*2/N));
title("Le signal noise 2")

%Apr�s l'augementation de l'intensit� du signal bruit on remarque que le
%spectre de bruit est encombrer avec celui qui contient l'informatrion
%pertinante du coup �a sera tr�s difficile d'extrait et filtrer le signal
%xnoise2

%% Analyse fr�quentielle du chant du rorqual bleu

%Question 1:
[whale,fe]=audioread("bluewhale.au");

chant = whale(2.45e4:3.10e4);
%Question 2:

sound(chant,fe)

%Question 3:
N = length(chant);
te = 1/fe;
t = (0:N-1)*(10*te);
figure;
subplot(2,1,1)
plot(t,chant)
title('Le signal whant')
y = abs(fft(chant)).^2/N; 
f = (0:floor(N/2))*(fe/N)/10;
subplot(2,1,2)
plot(f,y(1:floor(N/2)+1));
title('Le signal densit� spectrale de puissance du signal')