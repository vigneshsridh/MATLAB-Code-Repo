function a2=graytobin(a1)
[row,col]=size(a1);
for i=1:row
    for j=1:col
        tm=a1(i,j);
        tm1=d2b(double(tm));
        t(1)=tm1(1);
        t(2)=bitxor(tm1(1),tm1(2));
        t(3)=bitxor(t(2),tm1(3));
        t(4)=bitxor(t(3),tm1(4));
        tm2=[t(1) t(2) t(3) t(4) tm1(5) tm1(6) tm1(7) tm1(8)];
        tm3=b2d(tm2);
        a2(i,j)=tm3;
    end
end