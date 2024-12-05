clc;
close all;

% Define parameters for the continuous signal
f = 60; % Frequency in Hz
tmin = -0.05;
tmax = 0.05;
np = 40000;
t = linspace(tmin, tmax, np); % Generates np points, spacing between points is (tmax - tmin) / np - 1

% Continuous time sin signal
x_c = sin(2 * pi * f * t);
plot(t, x_c);
xlabel('t [s]');
title('Continuous Time Signal');

% Sample x_c with a sampling frequency of 1200 Hz
F = 1200;  % Sampling frequency in Hz
T = 1 / F; % Sampling period
nmin = ceil(tmin / T); % Minimum sample index
nmax = ceil(tmax / T); % Maximum sample index
n = nmin:nmax; % Sample indices
x1 = sin(2 * pi * f * n * T); % Sampled signal
hold on;
plot(n * T, x1, 'ro'); % Plot the sampled signal as red circles

% Sample x_c with a lower sampling frequency of 70 Hz (for aliasing effect)
F = 70;  % Sampling frequency in Hz
T = 1 / F; % Sampling period
x_c = sin(2 * pi * 10 * t); % Continuous signal with a lower frequency

nmin = ceil(tmin / T); % Minimum sample index
nmax = ceil(tmax / T); % Maximum sample index
n = nmin:nmax; % Sample indices
x1 = sin(2 * pi * f * n * T); % Sampled signal

% Plot continuous signal and sampled signal
plot(t, x_c, 'v'); % Plot the continuous signal as downward triangles
hold on;

plot(n * T, x1, 'ob'); % Plot the sampled signal as blue circles
hold off;
title('Aliased Signal with Sampling Frequency of 70 Hz');
xlabel('t [s]');
ylabel('x[n]');
grid on;
