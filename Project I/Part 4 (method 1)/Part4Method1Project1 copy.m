% Alina Gataullina
% 128B Project 
% Part vi. - Dimension 

% Differentialble box counting method

image = imread('Fractal2.png');   % read the image
image = rgb2gray(image);          % change to greyscale 
image = image>190;                % black and white

scale = zeros(1,9);  % scaling factor (2,4,8,16... 512)
boxes = zeros(1,9);   % number of boxes 

% set image parameters to 512x512 pixels for even piece cutting
width = 512;
height = 512;
cols = 1;

% set the limit to 2^9=512
for i=1:9
   
   scale_factor = 2^i;
   pieces = scale_factor^2; % set # of pieces
   piece_width = width/scale_factor; % set piece width 
   piece_height = height/scale_factor; % set piece height
   
   % initialize # of black pieces
   black_pieces=0;
   
   % count how many pieces contain black pixels, store in matrix
   for j = 0:pieces-1
       
       % get xy-coordinates of a piece
       row = idivide(int32(j), int32(scale_factor));
       col = rem(j,scale_factor);
       x_min = (col * piece_width) + 1;
       x_max = (x_min + piece_width) - 1;
       y_min = (row * piece_height) + 1;
       y_max = (y_min + piece_height) - 1;
       
       % store in a matrix
       one_piece = image(y_min:y_max,x_min:x_max);

       % check # of black pixels
       if (min(min(one_piece))== 0)
           black_pieces=black_pieces+1;
       end
   end
   
   scale(1,i) = scale_factor;
   boxes(1,i) = black_pieces;
   
end

% fractal dimension using the ployfit function
polyfit(log(scale),log(boxes),1)
