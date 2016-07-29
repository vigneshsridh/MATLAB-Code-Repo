function f=diffus(im,seed)
[row,col]=size(im);
im1=onedconv(im);
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
im3=twodconv(im2,row,col);
f=im3;