% n1=0:6;
n1=-2:1:6;
%x1=[1 1 1 1 1 1 0];
x1=[1:5,4:-1:1];
n2=-fliplr(n1);

% Find the range of the output sequence
n = min(min(n1), min(n2)):max(max(n1), max(n2));

y1=zeros(1,length(n));

% Map the first input sequence to the output range
y1(n >= min(n1) & n <= max(n1)) = x1;
x=y1;

xe = 0.5 * (x + fliplr(x));
xo = 0.5 * (x - fliplr(x));


% Plot the first signal
subplot(3, 1, 1);
stem(n, x, 'b', 'LineWidth', 1.5);
title(' Input Signal');
grid on;

% Plot the second signal
subplot(3, 1, 2);
stem(n, xe, 'r', 'LineWidth', 1.5);
title('Even Signal');

grid on;
% Plot the added signal
subplot(3, 1, 3);
stem(n, xo, 'k', 'LineWidth', 1.5);
title('Odd Signal');
grid on;

%xeo=xe+xo;
%stem(n, xeo, 'g', 'LineWidth', 1.5);
%title('Odd Signal');
%grid on;