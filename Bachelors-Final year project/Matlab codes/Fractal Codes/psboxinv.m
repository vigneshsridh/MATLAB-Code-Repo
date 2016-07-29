function decryp2=psboxinv(e)
grey2=rgb2gray(imread('fractal2.jpg'));
con=1;
[row,col]=size(e);
cn=1;
d=29;
f=0;
m=263167;
l1(1)=1;
for i=2:m
    l1(i)=mod((d*l1(i-1)+f),m);
    if l1(i)<=row*col
    l(cn)=l1(i);
    cn=cn+1;
    end
end
count=1;
len=row*col;
t1=l(len-70);
t2=l(len);
l(len-70)=t2;
l(len)=t1;
con1=1;
for i=1:row
    for j=1:col
        if con1==1
            q1=d2b((e(i,j)));
            q2=[q1(5) q1(6) q1(7) q1(8) q1(1) q1(2) q1(3) q1(4)];
            e1(i,j)=b2d(q2);
            con1=con1+1;
        else
            q1=d2b((e(i,j)));
            q2=[q1(4) q1(8) q1(3) q1(7) q1(2) q1(6) q1(1) q1(5)];
            e1(i,j)=b2d(q2);
            con1=con1-1;
        end
    end
end
cons=1;
for i=1:row
    for j=1:col
        im3(cons)=e1(i,j);
        cons=cons+1;
    end
end
coun=1;
for i=1:row*col
    if l(i)>row*col
        decryp(i)=im3(i);
    coun=coun+1;
    else
        tmp1=l(i);
        decryp(i)=im3(tmp1);
    end
end
j=1;p=1;
for i=1:len
    if mod(i,col)==0&i~=len
        j=j+1;p=1;
    A1(j,p)=decryp(i);
    else 
        A1(j,p)=decryp(i);
        p=p+1;
    end
end
for i=1:row
    for j=1:col
        if  ((i~=row)&(j~=col) | ((i==row)&(j~=col)))
        decryp1(i,j)=A1(i,j+1);
        elseif((i~=row)&(j==col))
            decryp1(i,j)=A1(i+1,1);
        else
            decryp1(i,j)=A1(1,1);
        end
    end
end
decryp2=bitxor(uint8(decryp1),grey2);
