% Ali Heydari 
% Julia Set 
% Part i



% function definition
phi = inline('z^2');
%c = 0;
% fixed points: 
fx1 = (1+ sqrt(6))/2 ;
fx2 = (1- sqrt(6))/2 ;


% points inside are colored black, outside are pink 
colormap([0 0 0 ; 1 0 1]);

% call the function Julia that computes the filled Julia set
zk = Julia(phi,fx1,fx2);

% Display the last value of zk
disp(zk);

% function's input: function phi, two fixed points - fx1 & fx2

function [zk] = Julia(phi,fx1,fx2)

% an array M of cored points initialized to 2
M = 2 * ones (100,161);

    for j = 1:141     
        
          % imaginary parts btw -.7 and .7
        y = -.7 + (j-1) * 0.01;
          % real parts btw -1.8 & 8
        for i = 1:361         
        x = -1.8 + (i-1) * 0.01;
        z = x + 1i * y; 
        zk = z;
        % iflag1 and iflag2 count the number of 
        iflag1 = 0; 
        % iterations when the root is within 1.e-6 
        iflag2 = 0; 
        % total number of iterations
        count = 0;  
        
        while count < 100 & abs(zk) < 2 & iflag1 < 5 & iflag2 < 5
            
            count = count + 1;
            
            % fixed point iteration
            zk = phi(zk);       
            % convergence to fx1
            error1 = abs(zk - fx1); 
            
                if error1 < 1.e-6
                    iflag1 = iflag1 + 1;
                else
                    iflag1 = 0;
                end
                
            % convergence to fx2
            error2 = abs(zk - fx2);
            
                if error2 < 1.e-6
                    iflag2 = iflag2 + 1;
                    
                else 
                    iflag2 = 0;
                end
        end
        
            if iflag1 >= 5 || iflag2 >= 5 || count >= 100
                % if orbis bdd 
                M(j,i) = 1; 
                          
            end
        
        end
        
    end
    
    % plot 
    image([-3 3], [-3 3], M);
    % invert axis
    axis xy; 
end
