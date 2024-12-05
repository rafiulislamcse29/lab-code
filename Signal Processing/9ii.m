
h = [1 2 3 4];
x = [2 1 2];

z = [];
for i = 1:length(x)
  xh = h.*x(i);
  z = [z; xh];
end

[r c] = size(z); 
ans = zeros(1,r+c-1);

for i = 1:r
  for j = 1:c
    ans(i+j-1) = ans(i+j-1)+z(i,j);
  end
end

z1 = 2; 
z2 = 3;
index = (z1+z2-1); 
n = -(index-1):length(ans)-index; 
ans = conv(x,h);
disp(ans);
stem(n, ans,'.'