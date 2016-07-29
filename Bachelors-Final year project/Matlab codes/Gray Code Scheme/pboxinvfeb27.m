function A1=pboxinvfeb27(b1)
k=1;
k1=18921;k2=601;
[row,col]=size(b1);
d=row*col*8;
for i=1:row
    for j=1:col
    if k==1
    of(k)=mod(k2,d);
    else
    of(k)=mod(of(k-1)+k2,d);
    if of(k)>row*col
        of(k)=mod(of(k),row*col);
    end
    end
    k=k+1;
    end
end
count=1;     
for i=1:row
    for j=1:col
        im(count)=b1(i,j);
        count=count+1;
    end
end
con=1;
len=row*col;
for i=1:len
        im3(con)=im(of(i));
        con=con+1;
end
j=1;l=1;
len=row*col;
for i=1:len
    if mod(i,col)==0&i~=len
      j=j+1;l=1;
    A1(j,l)=im3(i);
    else 
        A1(j,l)=im3(i);
        l=l+1;
    end
end


