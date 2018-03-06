% Alina GAtaullina 
% Julia Set 
% Part ii - 


% function definitions
phi1 = inline('z^2 + 0.36 + 0.1*i');
phi2 = inline('z^2 - 0.123 - 0.745*i');

% fixed points: 
fx1 = (1+ sqrt(6))/2 ;
fx2 = (1- sqrt(6))/2 ;


% points inside are colored black, points outside are colored pink 
colormap([0 0 0 ; 1 0 1]);

% call the function Julia that computes the filled Julia set
zk = Julia(phi2,fx1,fx2);

% Display the last value of zk
disp(zk);

% function's input: function phi, two fixed points - fx1 & fx2
function [zk] = Julia(phi,fx1,fx2)

% an array M of cored points initialized to 2
M = 2 * ones (141,361);

    for j = 1:141           % imaginary parts btw -.7 and .7
        y = -.7 + (j-1) * 0.01;
        
        for i = 1:361          % real parts btw -1.8 & 8
        x = -1.8 + (i-1) * 0.01;
        z = x + 1i * y; 
        zk = z;
        iflag1 = 0; % iflag1 and iflag2 count the number of  
        iflag2 = 0; % iterations when the root is within 1.e-6 
        count = 0;  % total number of iterations
        
        while count < 100 && abs(zk) < 2 && iflag1 < 5 && iflag2 < 5
            
            count = count + 1;
            zk = phi(zk);       % fixed point iteration
            
            error1 = abs(zk - fx1); % convergence to fx1
            
                if error1 < 1.e-6
                    iflag1 = iflag1 + 1;
                else
                    iflag1 = 0;
                end
                
            error2 = abs(zk - fx2); % convergence to fx2
            
                if error2 < 1.e-6
                    iflag2 = iflag2 + 1;
                    
                else 
                    iflag2 = 0;
                end
        end
        
            if iflag1 >= 5 || iflag2 >= 5 || count >= 100
            
                M(j,i) = 1; % if orbit is bounded we set 
                            % the point color to 1
            end
        
        end
        
    end
    
    % plot the results. 
    image([-10 10], [-10 10], M);
    axis xy; % invert axis
end
                    