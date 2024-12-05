% Define the signal values and time indices
x = [1, 2, 3, 4]; % Signal values
m = [0, 1, 2, 3]; % Time indices
k = 2;            % Shift amount (right shift by 2 units)

% Shift the time indices by k units
n = m + k;

% Signal values remain unchanged
y = x;

% Display results
disp('Shifted Signal Values:');
disp(y);
disp('Shifted Time Indices:');
disp(n);

% Plot the original and shifted signals
figure;

% Original signal
subplot(2, 1, 1);
stem(m, x, 'b', 'LineWidth', 1.5);
title('Original Signal');
xlabel('n');
ylabel('x[n]');
grid on;

% Shifted signal
subplot(2, 1, 2);
stem(n, y, 'r', 'LineWidth', 1.5);
title(['Shifted Signal by ', num2str(k), ' units']);
xlabel('n');
ylabel('y[n]');
grid on;
