% Ali Heydari 
% Julia Set 
% Part iii

% given
 c = 0.36 + 0.1i;
% c = -0.123 - 0.745i;    
% place holder
array = [];   
w = inv_it(array,c);


function [w] = inv_it(array,c)
                                
for i = 1:100
    % same as the first part 
    y = -1 + (i-1)*.01; 
   
    for j = 1:100               
        x = -1 + (j-1)*.01;    
        z = x + 1i * y;       
        count = 0;              
        
    % again same as part i without error check
    while count < 100 & abs(z) < 2 
           
        count = count + 1;
        psi = z - c;
        zx = real(psi);        
        zy = imag(psi);
        % given
        r = sqrt((zx^2+zy^2));           
        % to find the values in all 4 quadrants ( hence arctan2)
        theta = atan2(zy,zx);
        % the given formula for z from De Moivre's
        z = sqrt(r)*(cos(theta/2)+1i*sin(theta/2));
           

        % heads and tail for +- z
       
        x = round(rand(2,1));
        
         if x(1) == 1;   
                z = -z;       
         else
                z = z;
         end
    end 
    
        % storing into an array
         array= [array,z] ;  
        end
       

    end
    
plot(array,'x')
%title(' for c = -0.123 - 0.745i');
title(' for c = 0.36 + 0.1i');

end
% axis xy