clear
clc
close all

img_edges = imread('output/ps1-1-a-1.png');
rhoStep = 1;
D = size(img_edges);
rhomax = round(sqrt(D(1)^2 + D(2)^2), 0);
rhos = -rhomax:rhoStep:rhomax;
theta = linspace(-90, 89, 180);

H = zeros(length(rhos), length(theta));

for i = 1:D(1) %rows
        for j = 1:D(2) %columns
            if img_edges(i, j)==1
                for ang = 1:length(theta)
                rho = round(j*cosd(theta(ang)) + i*sind(theta(ang)), 0);
                temp = find(rhos==rho);
                H(ang, temp) = H(temp, ang) +1;
                end
            end
        end
end