clear all
close all
clc

f1=500;

f2=400;

f3=50;
te=1/10000;
fe=1/te;
t=(0:4)*fe;


x=sin(2*pi*f1*t)+sin(2*pi*f2*test)+sin(2*pi*f3*t);

plot(t,x);