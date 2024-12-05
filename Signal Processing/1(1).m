% Define the input sequences and their indices
x1 = [1, 2, 3, 4]; % First signal
n1 = [0, 1, 2, 3]; % Indices of the first signal
x2 = [3, 4, 5];    % Second signal
n2 = [2, 3, 4];    % Indices of the second signal

% Find the range of the output sequence
n = min(min(n1), min(n2)):max(max(n1), max(n2));

% Initialize signals with zeros over the output range
y1 = zeros(1, length(n));
y2 = zeros(1, length(n));

% Map the first input sequence to the output range
y1(n >= min(n1) & n <= max(n1)) = x1;

% Map the second input sequence to the output range
y2(n >= min(n2) & n <= max(n2)) = x2;

% Perform signal addition
y = y1 + y2;

% Plot the results
figure;

% Plot the first signal
subplot(3, 1, 1);
stem(n, y1, 'b', 'LineWidth', 1.5);
title('Signal 1');
xlabel('n');
ylabel('x1[n]');
grid on;

% Plot the second signal
subplot(3, 1, 2);
stem(n, y2, 'r', 'LineWidth', 1.5);
title('Signal 2');
xlabel('n');
ylabel('x2[n]');
grid on;

% Plot the added signal
subplot(3, 1, 3);
stem(n, y, 'k', 'LineWidth', 1.5);
title('Added Signal');
xlabel('n');
ylabel('y[n] = x1[n] + x2[n]');
grid on;
