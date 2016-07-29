function[en,de]=greyc(im)
en1=pboxfeb27(im);
en2=binarytogray(en1);
en3=diffus(en2,45);
d=16807;
f=0;
m=2^31-1;
l(1)=1;
im1=rgb2gray(imread('res512.jpg'));
[row col]=size(im1);
for i=2:(row*col)
    l(i)=mod((d*l(i-1)+f),m);
end
mx=max(l);
a=(l./mx);
a1=(a.*128)+1
yo=100;
for i=1:(row*col-1)
    if i==1
      y(i+1)=((4/(128*128))*(yo*yo*yo))-((12/128)*yo*yo)+(9*yo)+1;
    
    elseif a1(i)==0 || a1(i)==192
            y(i+1)=((4/(128*128))*(a1(i)*a1(i)*a1(i)))-((12/128)*a1(i)*a1(i))+(9*a1(i))+1;
    elseif a1(i)==128
        y(i+1)=((4/(128*128))*(a1(i)*a1(i)*a1(i)))-((12/64)*a1(i)*a1(i))+(9*a1(i))-1;
    elseif (a1(i)>0 && a1(i)<128) || (a1(i)>128 &&a1(i)<192) || (a1(i)>192 && a1(i)<256)
        y(i+1)=((4/(128*128))*(a1(i)*a1(i)*a1(i)))-((12/128)*a1(i)*a1(i))+(9*a1(i));
    end
end
h=floor(y);
im2=double(im1);
lgc=sbox(im2);
lgcd=double(lgc);
c1=bitxor(lgcd,im2);
u(1)=1;
f1=7;
for i=2:(row*col)
    u(i)=mod((d*u(i-1)+f1),m);
end
mx=max(l);
b=(u./mx);
b1=(b.*64)+1;
j=1;l=1;
len=length(b1);
for i=1:len
    if mod(i,col)==0&i~=len
        j=j+1;l=1;
    b2(j,l)=b1(i);
    else
        b2(j,l)=b1(i);
        l=l+1;
    end
end
zk=double(floor(b2));
c2=bitxor(c1,zk);

en=bitxor(double(en3),c2);
de1=bitxor(double(en),c2);
de2=diffus1(de1,45);
de3=graytobin(de2);
de4=pboxinvfeb27(de3);
de=medfilt2(de4);