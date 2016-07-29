function im3=twodconv(im2,row,col)
j=1;l=1;
for i=1:row*col
    if mod(i,col)==0&i~=row*col
        j=j+1;l=1;
    im3(j,l)=im2(i);
    else 
        im3(j,l)=im2(i);
        l=l+1;
    end
end