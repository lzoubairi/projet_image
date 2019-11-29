clc
clear all
close all

A=imread('../images/lena.bmp');
imshow(uint8(A));

%% Choix de 4 points avec curseur:

pts_dep = ginput(4); %choix de 4 pts avec le curseur
pts_dep = fix(pts_dep);

pts_arr = [1 1;1 80;120 1;120 80];

%% Estimation de la matrice d'homographie:

H = estim_homo(pts_dep,pts_arr);

% x = pts_dep(:,1);
% y = pts_dep(:,2);
% 
% bw = roipoly(A, x, y);
% imshow(bw);

%% Projection du polygone dans le rectangle:

im_arr = zeros(120,80);
Hi = inv(H);
for (i=1:120)
    for (j=1:80)
        M2 = [i j 1];
        M1 = Hi*(M2');
        im_arr(i,j) = A(M1(2)/M1(3),M1(1)/M1(3) );
    end
end

