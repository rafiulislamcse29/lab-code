clc;
close all;
%echo on;
N = input('Input Length = ' );
L = input('UpSampling Factor = ');
f0 = input('Input Signal Frequency = ');
%Generate the input sinusoidal sequence
n = 0: N-1;
x = sin(2*pi*f0*n);
%Generate Up sampled signal y
y = zeros(1, L*length(x));
y([1:L:length(y)]) = x;
y= interp(x,L);
subplot(211);
stem(n,x);
subplot(212)
stem(y);