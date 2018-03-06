x= linspace(-2, 1, 1000);
y =linspace(-1, 1, 1000);
pic = zeros(1000, 1000);
MaxIter = 100;

for k = 1:1000
   for j = 1:1000
       z = 0;
       n = 0;
       c = x(k) + y(j)*1i;
       while (abs(z) < 2 && n < MaxIter)
           z = z*z + c;
           n = n + 1;
       end
       pic(j,k) = fix(log2(n));
   end
end
imagesc(pic)
colormap(hot)
      
       