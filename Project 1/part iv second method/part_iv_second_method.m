% Ali Heydari
% Project 1 part 4
% Cell Counting Method

% Reading the image
image = imread('fractal1.jpg'); 

% Converting to greyscale

gs = graythresh(image); 

% Converting to black and white
image=im2bw(image,gs);

% Initalize the variables
im_size = 512; %size(image,1)
cell = im_size;
x = 1;
N(x) = 0; 
L(x) = 0; 

% going through the loop -> while a cell is bigger than a pixel
while cell > 1                         
    cell2 = 0;
    for i = 2:99 
        
        if mod(cell,i) == 0
            L(x) = cell/i;
            cell=L(x);
            break
        end
        
    end
   
    for j=1:(im_size/L(x))  
        
        for k=1:(im_size/L(x))
            
            % Locate the grid on the image
            grid = image([L(x)*(j-1)+(1:L(x)), L(x)*(k-1)+(1:L(x))]);
            
            if max(grid(1:end)) == 1                                 
                cell2 = cell2+1;
            end
        end
    end
    N(x) = cell2;
    x = x+1;
end

% Fractal dimension using the ployfit function
p = polyfit(log(L),log(N),1);
fractal_dimension = -p(1)