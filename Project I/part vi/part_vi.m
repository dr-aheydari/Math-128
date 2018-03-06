% Ali Heydari 
% MAT 128B Project 1
% Part vi. - Coloring divergent orbits

% Image size
im_size = [1000 1000]; 
% limits (min x, max x, min y, max y)
limits = [-2 2 -2 2];  
% Fixed complex number where the orbit is divergent
c = 2 ;                 
iterations = 300;

% Calling the function
color = julia(c, iterations, im_size, limits);

I = imagesc(color);
colormap(summer)
title('For C = 2 (divergent), -2 <= x <= 2, -2 <= y <= 2')

function col = julia(c, iterations, im_size, limits)

imag_step = (limits(4) - limits(3)) / (im_size(2) - 1); 
real_step = (limits(2) - limits(1)) / (im_size(1) - 1);

% Real numbers
real_num = limits(1) : real_step : limits(2);   
% Imaginary numbers
imag_num = limits(3) : imag_step : limits(4);      
 % Complex coordinates
z = bsxfun(@plus, real_num(:), (imag_num(:) * 1i)'); 
 % Colour of Julia set
 col = inf(size(z)); 

    for i = 1:iterations
        index = isinf(z);  
        % if z< inft,  
        z(~index) = z(~index).^2 + c; 
        % pick colour based on # of iteraions to reach infty
        col(index & isinf(col)) = i;
    end

col = col'; 

end