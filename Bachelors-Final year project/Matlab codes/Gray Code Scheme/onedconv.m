function im1=onedconv(im)
count=1;
[row,col]=size(im);
for i=1:row
    for j=1:col
        im1(count)=im(i,j);
        count=count+1;
    end
end