clc; % Clear command line
clear all; % Clear variables
close all; % Close all figures

% Given a continuous signal x = 12 * sin(2 * pi * 5 * t)
% Sample the signal with Nyquist Rate, over-sampling, and under-sampling

% Given sinewave
f = 5; % Frequency = 5 Hz
a = 12; % Amplitude = 12
t = 0:0.005:1; % Continuous time (sampling period for continuous signal)
analogSignal = a * sin(2 * pi * f * t);

subplot(2,2,1);
plot(t, analogSignal);
title('Analog Sinewave');
xlabel('Time (s)');
ylabel('Amplitude');

% Sampling with Nyquist Rate (2*f)
fs = 2 * f; % Sampling frequency (Nyquist rate)
n = 0:1/fs:1; % Sampled time (discrete time points)
sampledSignal = a * sin(2 * pi * f * n);

subplot(2,2,2);
stem(n, sampledSignal, '.');
title('Sampled with Nyquist Rate');
xlabel('Time (s)');
ylabel('Amplitude');

% Under Sampling (Sampling frequency under 2*f)
fs = 1.5 * f; % Sampling frequency less than Nyquist rate
n = 0:1/fs:1; % Sampled time (discrete time points)
sampledSignal = a * sin(2 * pi * f * n);

subplot(2,2,3);
stem(n, sampledSignal, '.');
title('Under Sampling');
xlabel('Time (s)');
ylabel('Amplitude');

% Over Sampling (Sampling frequency over 2*f)
fs = 7 * f; % Sampling frequency greater than Nyquist rate
n = 0:1/fs:1; % Sampled time (discrete time points)
sampledSignal = a * sin(2 * pi * f * n);

subplot(2,2,4);
stem(n, sampledSignal, '.');
title('Over Sampling');
xlabel('Time (s)');
ylabel('Amplitude');
