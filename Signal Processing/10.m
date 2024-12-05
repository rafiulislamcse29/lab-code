clc;
close all;

% Parameters
shft = 50;
s1 = rand(150, 1);              % Generate random signal s1
s2 = circshift(s1, [shft, 0]);  % Shift s1 circularly by 'shft' samples
s = [s1, s2];                   % Construct a matrix with two channels

% Plot s1 and s2 in subplots
subplot(2, 1, 1);
plot(s1);
title('s_1');

subplot(2, 1, 2);
plot(s2);
title('s_2');

% Compute the biased cross-covariance
[c, lg] = xcov(s, 'biased');
figure(2);
plot(lg, c);
legend('c_{s_1s_1}', 'c_{s_1s_2}', 'c_{s_2s_1}', 'c_{s_2s_2}');
title('Biased Cross-Covariance');

% Compute the normalized cross-covariance (unity at zero lag)
[c, lg] = xcov(s, 'coeff');
figure(3);

% Plot each cross-covariance sequence in its own subplot
for a = 1:2
    for b = 1:2
        nm = 2 * (a - 1) + b;  % Calculate subplot index
        subplot(2, 2, nm);
        plot(lg, c(:, nm));
        title(sprintf('c_{s_%ds_%d}', a, b));
        axis([-150 150 -0.2 1]);
    end
end
