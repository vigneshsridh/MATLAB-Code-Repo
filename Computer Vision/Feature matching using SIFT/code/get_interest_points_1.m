function [x, y] = get_interest_points_1(image,feature_width)
filter = fspecial('Gaussian', 8, 1);
image=imfilter(image,filter);
[GX,GY]=gradient(filter);
[M N]=size(image);
R=zeros(M,N);
IX=imfilter(image,GX);%computing X gradient of image
IY=imfilter(image,GY);%computing Y gradient of image
IXX=IX.*IX;
IYY=IY.*IY;
IXY=IX.*IY;
filter = fspecial('Gaussian', feature_width, 2); %designing a filter
IXX=imfilter(IXX, filter); %computing IXX, IXY and IYY
IYY=imfilter(IYY,filter);
IXY=imfilter(IXY,filter);
R=(IXX.*IYY-IXY.^2)-0.01*((IXX+IYY).^2);%computing Scalar interest measure               
Rmax=max(max(R));
R=R/Rmax;
x=[];
y=[];
R(R<0.001) = 0;                                           
Rmax = colfilt(R,[16 16],'sliding',@max);%non maximum suppression
T = R.*(R==Rmax);
T(find(T))=1;
[y,x] = find(T);
figure();
imshow(image);
hold on
scatter(x,y);
end