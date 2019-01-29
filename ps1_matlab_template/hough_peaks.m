function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    p = inputParser;
    addOptional(p, 'numpeaks', 1, @isnumeric);
    addParameter(p, 'Threshold', 0.5 * max(H(:)));
    addParameter(p, 'NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    parse(p, varargin{:});

    numpeaks = p.Results.numpeaks;
    threshold = p.Results.Threshold;
    nHoodSize = p.Results.NHoodSize;

    % TODO: Your code here
    D = size(H);
    peaks = [];
    
    hline = H(:);
    hline = sort(hline, 'descend');
    hline = hline(1:numpeaks);
    
    hlineu = unique(hline);
    hline = sort(hline, 'descend');
    for i = 1:length(hlineu)
        [trow, tcol] = find(H==hlineu(i));
        peaks( (end+1):(end+length(trow)), 1) = trow;
        peaks( (end+1-length(trow)):end, 2) = tcol;
    end
    
    peaks = peaks(1:numpeaks, :);
        
        
    
    
        
        
            
            
            
            
   % make the matrix 1 demension, sort it, take first Q entries, loop
   % through entries, use find function and a counter to find them in
   % original matrix
    
    
end
