function e=psbox(r1)
grey1=r1;
grey2=rgb2gray(imread('fractal2.jpg'));
y=bitxor(double(grey1),double(grey2));
[row,col]=size(y);
y1=zeros(512,512);
l1=zeros(1,263167);
l=zeros(1,262144);
im4=zeros(1,262144);
im3=zeros(1,262144);
%Delay function
for i=1:row
    for j=1:col
        if (i==1 && j==1)
        y1(i,j)=y(row,col);
        elseif(j==1)
        y1(i,j)=y(i-1,col);
        elseif(j~=1)
                y1(i,j)=y(i,j-1);
        end
    end
end
%LCG 
d=29;
f=0;
m=263167;
l1(1)=1;
[row,col]=size(y);
cn=1;
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
for i=1:row
    for j=1:col
        im4(count)=y1(i,j);
        count=count+1;
    end
end
counter=1;
for i=1:row*col
            temp=l(i);
            im3(temp)=im4(i);        
end
j=1;p=1;
A=zeros(512,512);
len=row*col;
for i=1:len
    if (mod(i,col)==0&&i~=len)
        j=j+1;p=1;
    A(j,p)=im3(i);
    else 
        A(j,p)=im3(i);
        p=p+1;
    end
end
con=1;
for i=1:row
    for j=1:col
if con==1
    w1=d2b(double(A(i,j)));
    w2=[w1(5) w1(6) w1(7) w1(8) w1(1) w1(2) w1(3) w1(4)];
    e(i,j)=b2d(w2);
    con=con+1;
else
    w1=d2b(double(A(i,j)));
    w2=[w1(7) w1(5) w1(3) w1(1) w1(8) w1(6) w1(4) w1(2)];
    e(i,j)=b2d(w2);
    con=con-1;
end
    end
end
