function A1=pboxinv(im2)
d=17;
f=0;
m=263167;
l1(1)=1;
[row col]=size(im2);
cn=1;
len=row*col;
for i=2:m
    l1(i)=mod((d*l1(i-1)+f),m);
    if l1(i)<=row*col
    l(cn)=l1(i);
    cn=cn+1;
    end
    end
count=1;
coun=1;
for i=1:row
    for j=1:col
        im4(count)=im2(i,j);
        count=count+1;
    end
end
for i=1:row*col
    if l(i)>row*col
        decryp(i)=im4(i);
    coun=coun+1;
    else
        tmp1=l(i);
        decryp(i)=im4(tmp1);
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
