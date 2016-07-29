im=rgb2gray(imread('res512.jpg'));
p=4;
q=8;
N=512;
a=3.9789;
x1=0.3678;
im1=im;
for i=1:203
    x1(i+1)=a*(x1(i)-x1(i)*x1(i));
end
for i=1:4
    d=floor(x1(i+200)*(10^14));
    d1=mod(d,N/8);
    d2=(N/2)+((i-1)*(N/8));
    low(i)=d1+d2;
end
per=[1 p;q (1+p*q)];
hy1=1;
for x=1:low(1)
    for y=1:low(1)
        tm=[x y]*per;
        t=mod(tm,low(1));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        co1(hy1)=t(1);
        co1(hy1+1)=t(2);
        hy1=hy1+2;
        im1(t(1),t(2))=im(x,y);
    end
end
im2=im1;
hy2=1;
for x=1:low(2)
    for y=1:low(2)
        tm=[x y]*per;
        t=mod(tm,low(2));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        co2(hy2)=t(1);
        co2(hy2+1)=t(2);
        hy2=hy2+2;
        im2(t(1),t(2))=im1(x,y);
    end
end
im3=im2;
hy3=1
for x=1:low(3)
    for y=1:low(3)
        tm=[x y]*per;
        t=mod(tm,low(3));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        co3(hy3)=t(1);
        co3(hy3+1)=t(2);
        hy3=hy3+2;
        im3(t(1),t(2))=im2(x,y);
    end
end
im4=im3;
hy4=1;
for x=1:low(4)
    for y=1:low(4)
        tm=[x y]*per;
        t=mod(tm,low(4));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        co4(hy4)=t(1);
        co4(hy4+1)=t(2);
        hy4=hy4+2;
        im4(t(1),t(2))=im3(x,y);
    end
end
en1=im4;
% en1=pboxlcg(im4);
% for x=1:N
%     for y=1:N
%         tm=[x y]*per;
%         t=mod(tm,N);
%         if t(1)==0
%             t(1)=1;
%         end
%         if t(2)==0
%             t(2)=1;
%         end
%         ent(t(1),t(2))=im4(x,y);
%     end
% end
% en1=ent;
% for x=1:N
%     for y=1:N
%         tm=[x y]*per;
%         t=mod(tm,N);
%         if t(1)==0
%             t(1)=1;
%         end
%         if t(2)==0
%             t(2)=1;
%         end
%         en1(t(1),t(2))=ent(x,y);
%     end
% end
s1=en1(1:N/2,1:N/2);
s2=en1(1:N/2,(N/2+1):N);
s3=en1((N/2+1):N,1:N/2);   
s4=en1((N/2+1):N,(N/2+1):N);
g=0.6781;
b=3.98997;
for i=1:300
    g(i+1)=b*(g(i)-g(i)*g(i));
end
con=149;
count=1;
w=g(con);
for i=1:40
    r(i)=mod(floor(g(con)*(10^13)),4)+1;
    con=con+1;
    if count==0
        break;
    end
    if i>=4 
        if (r(i-3)~=r(i-2) & r(i-3)~=r(i-1) & r(i-3)~=r(i) & r(i-2)~=r(i-1) & r(i-2)~=r(i) & r(i-3)~=r(i))
            count=0;
            break;
        end
    end
end
r1=r(i-3);
r2=r(i-2);
r3=r(i-1);
r4=r(i);
switch(r1)
    case 1
        w1=s1;
    case 2
        w1=s2;
    case 3
        w1=s3;
    case 4
        w1=s4;
end
switch(r2)
    case 1
        w2=s1;
    case 2
        w2=s2;
    case 3
        w2=s3;
    case 4
        w2=s4;
end
switch(r3)
    case 1
        w3=s1;
    case 2
        w3=s2;
    case 3
        w3=s3;
    case 4
        w3=s4;
end

switch(r4)
    case 1
        w4=s1;
    case 2
        w4=s2;
    case 3
        w4=s3;
    case 4
        w4=s4;
end
sum=0;
for i=1:(N/2)
    for j=1:(N/2)
      tme=double(w4(i,j));
      tme1=tme/255;
      sum=sum+tme1;
    end
end
sm=(4*sum)/(N*N);
yo=sm;
o1=onedconv(w1);
o2=onedconv(w2);
o3=onedconv(w3);
o4=onedconv(w4);
len=length(o4);
for i=1:(len)
    yo(i+1)=a*(yo(i)-yo(i)*yo(i));
end
yo=yo(2:len+1);
u=0.35;
tnt=u;
z=0.5678;
for i=1:len-1
    if tnt(i)<z&tnt(i)>0
    tnt(i+1)=tnt(i)/z;
    end
    if tnt(i)>z&tnt(i)<1
        tnt(i+1)=(1-tnt(i))/(1-z);
    end
end
h1=233;
for i=1:len
    er1=bitxor(h1(i),o1(i));
    er2=bitxor(mod(floor(yo(i)*(10^14)),255),mod(floor(tnt(i)*(10^14)),255));
    h1(i+1)=bitxor(er1,er2);
end
h1=h1(2:len+1);
h2=h1(len);
for i=1:len
    er1=bitxor(h2(i),o2(i));
    er2=bitxor(mod(floor(yo(i)*(10^14)),255),mod(floor(tnt(i)*(10^14)),255));
    h2(i+1)=bitxor(er1,er2);
end
h2=h2(2:len+1);
h3=h2(len);
for i=1:len
    er1=bitxor(h3(i),o3(i));
    er2=bitxor(mod(floor(yo(i)*(10^14)),255),mod(floor(tnt(i)*(10^14)),255));
    h3(i+1)=bitxor(er1,er2);
end
h3=h3(2:len+1);
h4=h3(len);
for i=1:len
    er1=bitxor(h4(i),o4(i));
    er2=(mod(floor(tnt(i)*(10^14)),255));
    h4(i+1)=bitxor(er1,er2);
end
h4=h4(2:len+1);
h5=twodconv(h1,256,256);
h6=twodconv(h2,256,256);
h7=twodconv(h3,256,256);
h8=twodconv(h4,256,256);
lo1=flipdim(h5,2);
lo2=flipdim(h7,2);
h=[lo1 h6;lo2 h8];
% io=cyclshift(h,512,512);
% app1=[h(1,2:511); io];
% app2=[h(512,2:511); app1];
% app3=[h(1:512,1) app2];
% app4=[h(1:512,512) app3];
% io2=cyclshift1(io,510,510);
% app5=[h(1,2:511); io2];
% app6=[app5; h(512,2:511)];
% app7=[h(1:512,1) app6];
% app8=[app7 h(1:512,512)];

key1=233;
for i=1:len
    if i==1
    er1=bitxor(key1,h1(i));
    else
        er1=bitxor(h1(i),h1(i-1));
    end
    er2=bitxor(mod(floor(yo(i)*(10^14)),255),mod(floor(tnt(i)*(10^14)),255));
    v1(i+1)=bitxor(er1,er2);
end
v1=v1(2:len+1);
key2=v1(len);
for i=1:len
    if i==1
    er1=bitxor(key2,h2(i));
    else
        er1=bitxor(h2(i-1),h2(i));
    end
    er2=bitxor(mod(floor(yo(i)*(10^14)),255),mod(floor(tnt(i)*(10^14)),255));
    v2(i+1)=bitxor(er1,er2);
end
v2=v2(2:len+1);
key3=v2(len);
for i=1:len
    if i==1
    er1=bitxor(key3,h3(i));
    else
        er1=bitxor(h3(i-1),h3(i));
    end
    er2=bitxor(mod(floor(yo(i)*(10^14)),255),mod(floor(tnt(i)*(10^14)),255));
    v3(i+1)=bitxor(er1,er2);
end
v3=v3(2:len+1);
key4=v3(len);

for i=1:len
    if i==1
    er1=bitxor(key4,h4(i));
    else
        er1=bitxor(h4(i-1),h4(i));
    end
    er2=(mod(floor(tnt(i)*(10^14)),255));
    v4(i+1)=bitxor(er1,er2);
end
v4=v4(2:len+1);
v5=twodconv(v1,256,256);
v6=twodconv(v2,256,256);
v7=twodconv(v3,256,256);
v8=twodconv(v4,256,256);
e1=[v6 v7 ;v8 v5];
%  de1=en1;
% for x=1:N
%     for y=1:N
%         tm=[x y]*per;
%         t=mod(tm,N);
%         if t(1)==0
%             t(1)=1;
%         end
%         if t(2)==0
%             t(2)=1;
%         end
%         de1(x,y)=en1(t(1),t(2));
%     end
% end
% de2=de1;
% for x=1:N
%     for y=1:N
%         tm=[x y]*per;
%         t=mod(tm,N);
%         if t(1)==0
%             t(1)=1;
%         end
%         if t(2)==0
%             t(2)=1;
%         end
%         de2(x,y)=de1(t(1),t(2));
%     end
% end
im5=e1;
for x=1:low(4)
    for y=1:low(4)
        tm=[x y]*per;
        t=mod(tm,low(4));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        im5(x,y)=e1(t(1),t(2));
    end
end
im6=im5;
for x=1:low(3)
    for y=1:low(3)
        tm=[x y]*per;
        t=mod(tm,low(3));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        im6(x,y)=im5(t(1),t(2));
    end
end
im7=im6;
for x=1:low(2)
    for y=1:low(2)
        tm=[x y]*per;
        t=mod(tm,low(2));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        im7(x,y)=im6(t(1),t(2));
    end
end
im8=im7;
for x=1:low(1)
    for y=1:low(1)
        tm=[x y]*per;
        t=mod(tm,low(1));
        if t(1)==0
            t(1)=1;
        end
        if t(2)==0
            t(2)=1;
        end
        im8(x,y)=im7(t(1),t(2));
    end
end
