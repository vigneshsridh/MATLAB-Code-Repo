grey1=(imread('res512.jpg'));
grey2=rgb2gray(imread('fractal2.jpg'));
y=bitxor(grey1,grey2);
[row,col]=size(y);
y1=zeros(512,512);
l1=zeros(1,263167);
l=zeros(1,262144);
im4=zeros(1,262144);
im3=zeros(1,262144);
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
% con1=1;
% for i=1:row
%     for j=1:col
%         if con1==1
%             q1=d2b((e(i,j)));
%             q2=[q1(5) q1(6) q1(7) q1(8) q1(1) q1(2) q1(3) q1(4)];
%             e1(i,j)=b2d(q2);
%             con1=con1+1;
%         else
%             q1=d2b((e(i,j)));
%             q2=[q1(4) q1(8) q1(3) q1(7) q1(2) q1(6) q1(1) q1(5)];
%             e1(i,j)=b2d(q2);
%             con1=con1-1;
%         end
%     end
% end
% 
% 


% coun=1;
% for i=1:row*col
%     if l(i)>row*col
%         decryp(i)=im3(i);
%     coun=coun+1;s
%     else
%         tmp1=l(i);
%         decryp(i)=im3(tmp1);
%     end
% end
% j=1;p=1;
% for i=1:len
%     if mod(i,col)==0&i~=len
%         j=j+1;p=1;
%     A1(j,p)=decryp(i);
%     else 
%         A1(j,p)=decryp(i);
%         p=p+1;
%     end
% end
% 
% 
% x=1;
% for i=1:row
%     for j=1:col
%      if A(i,j)==A1(i,j)
%          x=x+1;
%      end
%     end
% end
% c1=0;
% c2=0;
% c3=0;
% for i=1:row
%     for j=1:col
%         if  ((i~=row)&(j~=col) | ((i==row)&(j~=col)))
%         decryp1(i,j)=A1(i,j+1);
%         c1=c1+1;
%         elseif((i~=row)&(j==col))
%             decryp1(i,j)=A1(i+1,1);
%         c2=c2+1;
%         else
%             decryp1(i,j)=A1(1,1);
%             c3=c3+1;
%         end
%     end
% end
% cp=1;
% for i=1:row
%     for j=1:col
%      if y(i,j)==decryp1(i,j)
%          cp=cp+1;
%      end
%     end
% end
% decryp2=bitxor(uint8(decryp1),grey2);
                