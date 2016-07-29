function [enc,dec]=colencr(a)
[row,col,wid]=size(a);
for i=1:row
    for j=1:col
        r1(i,j)=a(i,j,1);
        g1(i,j)=a(i,j,2);
        b1(i,j)=a(i,j,3);
    end
end
x=psbox(r1);
y=psbox(g1);
z=psbox(b1);
for i=1:row
    for j=1:col
        enc(i,j,1)=x(i,j);
        enc(i,j,2)=y(i,j);
        enc(i,j,3)=z(i,j);
    end
end
decryp1=psboxinv(enc(:,:,1));
decryp2=psboxinv(enc(:,:,2));
decryp3=psboxinv(enc(:,:,3));
for i=1:row
    for j=1:col
        dec(i,j,1)=decryp1(i,j);
        dec(i,j,2)=decryp2(i,j);
        dec(i,j,3)=decryp3(i,j);
    end
end
