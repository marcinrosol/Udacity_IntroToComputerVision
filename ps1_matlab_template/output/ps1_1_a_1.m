clear
clc
close all

img = imread('input/ps1_input0.png');
figure
imshow(img)
img_edges = edge(img, 'Sobel');
figure
imshow(img_edges)
imwrite(img_edges,'output/ps1-1-a-1.png')

% created finction
[H, theta, rho] = hough_lines_acc(img_edges);

d=linspace(min(H(:)),max(H(:)),256);
Hnew=uint8(arrayfun(@(x) find(abs(d(:)-x)==min(abs(d(:)-x))),H));
imwrite(Hnew, 'output/ps1_2_a_1.png')

figure
imshow(Hnew)

figure
subplot(1,2,1)
surf(theta, rho', H)

% use built in matlab functions for sanity check
subplot(1,2,2)
[H2 theta2 rho2] = hough(img_edges);
surf(theta2, rho2', H2)

% created function
peaks = hough_peaks(H, 10)
figure
imshow(H,[],'XData',theta,'YData',rho,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
title('Created')
axis on, axis normal, hold on;
plot(theta2(peaks(:,2)),rho2(peaks(:,1)),'s','color','white');
saveas(gcf,'output/ps1_2_b_1.png ')

% use built in matlab functions for sanity check
peaks2 = houghpeaks(H2, 10)
figure
imshow(H2,[],'XData',theta2,'YData',rho2,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
title('Built-in')
axis on, axis normal, hold on;
plot(theta2(peaks2(:,2)),rho2(peaks2(:,1)),'s','color','white');