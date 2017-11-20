clc;
close all;
faceDetector = vision.CascadeObjectDetector();
[fname path]=uigetfile('.jpg','Enter Lost person photo');
fname=strcat(path,fname);
im=imread(fname);
bbox=step(faceDetector,im);
im1 = imcrop(im,bbox);
im2 = rgb2gray(im1);
imshow(im2);

title('Input Image');
Ftest=FeatureStatistical(im2);
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
dist(i,:)=sum( abs(Ftrain(i,:)-Ftest));
end
m=find(dist==min(dist),1);
det_class=Ctrain(m);
msgbox(strcat('detected class=',num2str(det_class)));