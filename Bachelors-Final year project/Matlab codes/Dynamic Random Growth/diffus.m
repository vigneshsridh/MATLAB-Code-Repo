function f=diffus(im,seed)
[row,col]=size(im);
count=1;
for i=1:row
    for j=1:col
        im1(count)=im(i,j);
        count=count+1;
    end
end
len=length(im1);
for i=1:len
    if i==1
        tmp=bitxor(seed,im1(i));
        im2(i)=tmp;
    else
        tmp=bitxor(im1(i),im2(i-1));
        im2(i)=tmp;
    end
end
j=1;l=1;
for i=1:len
    if mod(i,col)==0&i~=len
        j=j+1;l=1;
    im3(j,l)=im2(i);
    else 
        im3(j,l)=im2(i);
        l=l+1;
    end
end
f=im3;