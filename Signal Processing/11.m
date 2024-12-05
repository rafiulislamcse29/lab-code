% CALCULATION OF FOURIER SERIES COEFFICIENTS
clear all;
echo on;

% Sampling Frequency and Time Interval
Fs = 100e3;               % Sampling frequency (100 kHz)
dt = 1 / Fs;              % Time interval

% Generating the Rectangular Pulse Train
T = 1e-3;                 % Period of the pulse train (1 ms)
D = 0.1;                  % Duty cycle (10%)
PW = D * T;               % Pulse width
f = 1 / T;                % Analog frequency
t = -T / 2 : dt : T / 2;  % Time interval for a period
n = t / dt;               % Index for data points in a period
L = PW / dt;              % Data points in the high time

% Initialize a single rectangular pulse
x = zeros(1, length(t));  % Initialize signal as zero
x(find(abs(n) <= L / 2)) = 1.1;  % Generate a rectangular pulse

% Plot the continuous and discrete signals
figure(1);
subplot(2, 1, 1);
plot(t, x);
xlabel('Time (Seconds)');
ylabel('x(t)');
title('Continuous signal');

subplot(2, 1, 2);
stem(n, x);
xlabel('n');
ylabel('x(n)');
title('Discrete signal');

% Total number of data points in a period
N = length(x);
Nc = N;  % Total number of coefficients

% Determine the k values based on whether N is even or odd
if mod(Nc, 2) == 0
    k = -(Nc / 2) : (Nc / 2) - 1;
else
    k = -(Nc - 1) / 2 : (Nc - 1) / 2;
end

% Initialize Fourier coefficients
c = zeros(1, length(k));

% Calculate the Fourier series coefficients
for i1 = 1 : length(k)
    for i2 = 1 : length(x)
        c(i1) = c(i1) + 1 / N * x(i2) * exp(-i * 2 * pi * k(i1) * n(i2) / N);
    end
end

% Plot the magnitude and phase of the Fourier series coefficients
figure(2);
subplot(2, 1, 1);
stem(k, abs(c));
xlabel('k');
ylabel('|c_k|');
title('Fourier series coefficients c_k');

subplot(2, 1, 2);
stem(k, angle(c) * 130 / pi);
xlabel('k');
ylabel('angle(c_k)');

% START OF RECONSTRUCTION OF SIGNAL

t_remax = T / 2;
t_re = -t_remax : dt : t_remax;  % Time interval for reconstruction
n_re = t_re / dt;                % Index for reconstruction
x_re = zeros(1, length(n_re));   % Initialize reconstructed signal

% Reconstruct the signal from Fourier coefficients
for i1 = 1 : length(k)
    for i2 = 1 : length(x_re)
        x_re(i2) = x_re(i2) + c(i1) * exp(i * 2 * pi * k(i1) * n_re(i2) / N);
    end
end

% END OF RECONSTRUCTION OF SIGNAL

% Plot the reconstructed signal
figure(3);
subplot(2, 1, 1);
stem(n_re, x_re);
xlabel('n');
ylabel('x_{reconstructed}');
title('Reconstructed signal');

subplot(2, 1, 2);
plot(t_re, x_re);
xlabel('t');
ylabel('x_{reconstructed}');
title('Reconstructed signal');
