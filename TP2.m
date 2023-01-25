clear all
close all
clc
%% Jeux de mots
%Question 1:

[x,fe]=audioread("C:\Users\pc\OneDrive\Bureau\traitement de signale tp\audio_yosri.ogg");

%Question 2:

%sound(x,fe)
plot(x)
title('phrase Rien ne sert a courir, il faut partir a point')
%Question 3:

%sound(x,fe*2)
%sound(x,fe/2)
%sound(x,fe)



%Question 4:

stem(x)
%Apr�s le tra�age de la fonction x on peut arriver a voir que le morceau 
%Rien ne sert de est contenue dans la partie de l'index 1025 j'usqu'� 2.05e05

%Question 5:


riennesertde=x(1025:(2.05e05));
%stem(riennesertde)
%sound(riennesertde,fe)

%Question 6:

courir=x((2.239e+05):(2.642e+05));
%sound(courir,fe)

ilfaut=x((2.987e+05):(3.81e+05));
%sound(ilfaut,fe)

partirapoint=x((4e+05):(5.28e+05));
%sound(partirapoint,fe)



%Question 7:
parole=[riennesertde ,partirapoint ,ilfaut,courir];
%sound(parole,fe)


%% Synth�se et analyse spectrale d�une gamme de musique

%Synth�se d�une gamme de musique

%Question 1:

fe=8192;
te=1/fe;
N=5000;
t=(0:N-1)*te;
do=10*cos(2*pi*262*t);
%sound(do,fe)
re=10*cos(2*pi*294*t);
%sound(re,fe)
mi=10*cos(2*pi*330*t);
%sound(mi,fe)
fa=10*cos(2*pi*349*t);
%sound(re,fa)
sol=10*cos(2*pi*392*t);
%sound(sol,fe)
la=10*cos(2*pi*440*t);
%sound(la,fe)
si=10*cos(2*pi*494*t);
%sound(si,fe)
do2=10*cos(2*pi*523*t);
%sound(do2,fe)
musique=[do,re,mi,fa,sol,la,si,do2];
sound(musique,fe)
 

%Spectre de la gamme de musique

%Question 2:

f=(0:N-1)*(fe/N);
spectre_musique=fft(musique);
signalAnalyzer(abs(fftshift(spectre_musique)));
