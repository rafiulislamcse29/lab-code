clc;
close all;
nx = -25:25;
nh = -7:7;
x = cos(2*pi*nx/.3).*(nx>=0);
h = (cos(pi*nh/.3)+(sin(pi*nh/3)/sqrt(3))).*(nh>=0);
y = conv(h,x);

nyb = nx(1)+nh(1);
nye = nx(end)+ nh(end);
ny = nyb:nye;

plot(nx,x,'-r');
hold on

plot(nh,h,'-g');
%hold on

plot(ny,y,'--b');
title ('Plot of input X[n], impulse response h[n] and the convolution of the two Y[n]')
xlabel ('Variable n');
ylabel ('Signal amplitude')