vid = videoinput('winvideo','QuickCam for Notebooks Deluxe');

% Create the webcam object.
% cam = webcam(1);

% Capture one frame to get its size.
% videoFrame = snapshot(cam);
% frameSize = size(videoFrame);

% Create the video player object.
% vid = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

% Set the properties of the video object
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb');
vid.FrameGrabInterval = 5;

%start the video aquisition here
triggerconfig(vid, 'manual');
start(vid)
preview(vid);
drowsyFrames=0;
frame=0;
BB=zeros(4);
I=zeros(50);

while(vid.FramesAcquired<=50)
EyeDetect = vision.CascadeObjectDetector('EyePairBig');    
I = getsnapshot(vid);
imshow(I);
tic;
pause(2);
toc;
frame=frame+1;
% Eyes_gray=rgb2gray(I);
% [Eyes_gray, X]=rgb2ind(I,32);
BB=step(EyeDetect,I);
a=size(BB);
disp(a);
figure(2);
rectangle('Position',BB,'LineWidth',4,'LineStyle','-','EdgeColor','b');
title('Eyes Detection');
Eyes=imcrop(I,BB);
level=graythresh(Eyes);

Eyes_BW=im2bw(Eyes,level);
figure(1);
imshow(Eyes_BW);
se=strel('square',1);
Eyes_Dilated=imdilate(Eyes_BW,se);
figure(1);
imshow(Eyes_Dilated),title('Dilated');
sumc1=sum(sum(Eyes_Dilated));
if sumc1<(20)
    disp('eye is closed')
    % Increment the number of frames where the eye is closed.
    drowsyFrames = drowsyFrames +1;
    % Check to see if it's been closed for the past 5 frames.
    if drowsyFrames >= 5
        disp('drowsy')
        %[y,Fs]=audioread('C:\Users\Home\Desktop\47434^BUZZER.wav');
        %sound(y,Fs);
    else
        % It's been closed less than 5 frames, so this is a normal eye blink.
         disp('normal')
    end
else
    disp('eye is open')
    drowsyFrames = 0; % Reset counter when the eye is open.
end
    hold off
end
% Both the loops end here.

% Clean up.
% clear cam;
% release(vid);
% release(EyeDetect);

% Stop the video aquisition.
stop(vid);
delete(vid);
release(vid);