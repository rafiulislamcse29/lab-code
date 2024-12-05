clc;
close all;

% Custom range for nx and nh
nx = -25:25;   % Range for input signal
nh = -7:7;     % Range for impulse response

% Define custom input signal x[n] (example: step function)
x = (nx >= 0);  % Custom input: unit step function for nx >= 0

% Define custom impulse response h[n] (example: Gaussian)
h = exp(-0.1*nh.^2);  % Custom impulse response: Gaussian function

% Perform convolution
y = conv(h, x);

% Compute the range for the output signal
nyb = nx(1) + nh(1);
nye = nx(end) + nh(end);
ny = nyb:nye;

% Plot the input signal, impulse response, and output signal
figure;
plot(nx, x, '-r', 'LineWidth', 1.5);
hold on;
plot(nh, h, '-g', 'LineWidth', 1.5);
plot(ny, y, '--b', 'LineWidth', 1.5);
title('Plot of input X[n], impulse response h[n], and the convolution Y[n]');
xlabel('Variable n');
ylabel('Signal amplitude');
legend('Input X[n]', 'Impulse Response h[n]', 'Convolution Y[n]');
grid on;
