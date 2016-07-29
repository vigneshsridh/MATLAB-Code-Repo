function A=b2d(x1)
sum=0;
for i=1:8
    if x1(i)==1
        sum=sum+(2^(8-i));
    end
end
A=sum;