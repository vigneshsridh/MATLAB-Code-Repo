function a1=binarytogray(b)
[row,col]=size(b);
for i=1:row
    for j=1:col
        tmp=b(i,j);
        tmp1=d2b(double(tmp));
        t1(1)=tmp1(1);
        t1(2)=bitxor(tmp1(1),tmp1(2));
        t1(3)=bitxor(tmp1(2),tmp1(3));
        t1(4)=bitxor(tmp1(3),tmp1(4));
        tmp2=[t1(1) t1(2) t1(3) t1(4) tmp1(5) tmp1(6) tmp1(7) tmp1(8)];
        tmp3=b2d(tmp2);
        a1(i,j)=tmp3;
    end
end

