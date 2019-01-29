function [H, theta, rho] = hough_lines_acc(BW, varargin)
    % Compute Hough accumulator array for finding lines.
    %
    % BW: Binary (black and white) image containing edge pixels
    % RhoResolution (optional): Difference between successive rho values, in pixels
    % Theta (optional): Vector of theta values to use, in degrees
    %
    % Please see the Matlab documentation for hough():
    % http://www.mathworks.com/help/images/ref/hough.html
    % Your code should imitate the Matlab implementation.
    %
    % Pay close attention to the coordinate system specified in the assignment.
    % Note: Rows of H should correspond to values of rho, columns those of theta.

    %% Parse input arguments
    p = inputParser();
    % rho is d in slides
    addParameter(p, 'RhoResolution', 1);
    addParameter(p, 'Theta', linspace(-90, 89, 180));
    parse(p, varargin{:});

    rhoStep = p.Results.RhoResolution;
    theta = p.Results.Theta;
    
    D = size(BW);
    rhomax = round(sqrt(D(1)^2 + D(2)^2), 0);
    rho = -rhomax:rhoStep:rhomax;
    
    H = zeros(length(rho), length(theta));

    for i = 1:D(1) %rows
        for j = 1:D(2) %columns
            if BW(i, j)==1
                for ang = 1:length(theta)
                rhoval = round(j*cosd(theta(ang)) + i*sind(theta(ang)), 0);
                temp = find(rho==rhoval);
                H(temp, ang) = H(temp, ang) +1;
                end
            end
        end
    end
    
    %H = rescale(H, 'Input
    
    %% TODO: Your code here
end
