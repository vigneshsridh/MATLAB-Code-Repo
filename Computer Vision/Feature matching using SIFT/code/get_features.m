% Local Feature Stencil Co de
% CS 4495 / 6476: Computer Vision, Georgia Tech
% Written by James Hays

% Returns a set of feature descriptors for a given set of interest points. 

% 'image' can be grayscale or color, your choice.
% 'x' and 'y' are nx1 vectors of x and y coordinates of interest points.
%   The local features should be centered at x and y.
% 'feature_width', in pixels, is the local feature width. You can assume
%   that feature_width will be a multiple of 4 (i.e. every cell of your
%   local SIFT-like feature will have an integer width and height).
% If you want to detect and describe features at multiple scales or
% particular orientations you can add input arguments.

% 'features' is the array of computed features. It should have the
%   following size: [length(x) x feature dimensionality] (e.g. 128 for
%   standard SIFT)

function [features] = get_features(image, x, y, feature_width)
features=zeros(size(x,1),128);
for l=1:size(x,1)
if((((y(l)-7)>0)&&((y(l)+8)<size(image,1)))&&(((x(l)-7)>0)&&((x(l)+8)<size(image,2))))
subimage=image(y(l)-7:y(l)+8,x(l)-7:x(l)+8);%subimage of size 16x16 
f=[];
[Gx,Gy]=gradient(subimage);%computing gradient of subimage
Gdir=atan2(Gy,Gx)+pi;%gradient direction
Gmag=sqrt(Gx.^2+Gy.^2);%gradient magnitude       
    for i=1:16
    v=zeros(1,8);
    jupper=(i-floor((i-1)/4)*4)*4;
        for j=(jupper-3):jupper
        kupper=((floor((i-1)/4)+1)*4);
            for k=(kupper-3):kupper
            q=floor(Gdir(k,j)./(pi/4));
            if(q<=0)
            q=0;
            end
            if(q>=7)
            q=7;
            end
            v(q+1)=v(q+1)+Gmag(k,j);%histogram calculation    
            end
         end 
      v=v/(sum(v));%normalization
      f=[f v];
      end
     features(l,:)= f;%computing features
    end
end
end           
%now you need to put these values in 4*4 bins. each 4*4 bin will have 16
%gradient vectors. these 16 are in different directions. put these in
%histbins from 0 to2pi. therefore, u get 8 hist vectors pointing in 8 diff
%directions. similarly, do for all pixels!!!
% that ll give u features!!

% To start with, you might want to simply use normalized patches as your
% local feature. This is very simple to code and works OK. However, to get
% full credit you will need to implement the more effective SIFT descriptor
% (See Szeliski 4.1.2 or the original publications at
% http://www.cs.ubc.ca/~lowe/keypoints/)

% Your implementation does not need to exactly match the SIFT reference.
% Here are the key properties your (baseline) descriptor should have:
%  (1) a 4x4 grid of cells, each feature_width/4.
%  (2) each cell should have a histogram of the local distribution of
%    gradients in 8 orientations. Appending these histograms together will
%    give you 4x4 x 8 = 128 dimensions.
%  (3) Each feature should be normalized to unit length
%
% You do not need to perform the interpolation in which each gradient
% measurement contributes to multiple orientation bins in multiple cells
% As described in Szeliski, a single gradient measurement creates a
% weighted contribution to the 4 nearest cells and the 2 nearest
% orientation bins within each cell, for 8 total contributions. This type
% of interpolation probably will help, though.

% You do not have to explicitly compute the gradient orientation at each
% pixel (although you are free to do so). You can instead filter with
% oriented filters (e.g. a filter that responds to edges with a specific
% orientation). All of your SIFT-like feature can be constructed entirely
% from filtering fairly quickly in this way.

% You do not need to do the normalize -> threshold -> normalize again
% operation as detailed in Szeliski and the SIFT paper. It can help, though.

% Another simple trick which can help is to raise each element of the final
% feature vector to some power that is less than one.

% Placeholder that you can delete. Empty features.
%features = zeros(size(x,1), 128);
