% project 1 part 7

% Below is adjusted code of part 1 to implement Newton's method

% function definition
phi = @(z) z^3+1;  
% the derivative of defined function
phi_prime = @(z) 3*z^2;


point1 = -1;                   
point2 = exp(1i*pi/3);
point3 = exp(-1i*5*pi/3);

% define orbit zero
orb = 0;
% colormap : black, white, pink
colormap([1 1 1; 0 0 0; 1 0 1]);  

% initialize array M of point colors to 2                                        
M = 2*ones(141,361);                    

for j=1:141            
  y = -0.7 + (j-1)*.01;    % imaginary parts btw -.7 and .7
  
  for i=1:361              % real parts btw -1.8 & 8 
    x = -1.8 + (i-1)*.01; 
    z = x + 1i*y;
    orb = z;
    
    flag1 = 0;     % iflag1 and iflag2 count the number of     
    flag2 = 0;     % iterations when the root is within 1.e-6     
    flag3 = 0;     
    count = 0;     % total number of iterations

    while count < 100 && flag1 < 5 && flag2 < 5 && flag3 < 5
      
      count = count + 1;
      
      % Newton's method formula
      orb = orb - phi(orb)/phi_prime(orb);    
      % convergence of point1
      err1 = abs(orb  - point1);
      if err1 < 1.e-6      
         flag1 = flag1 + 1;
      else
         flag1 = 0;
      end
      % convergence of point2
      err2 = abs(orb-point2);
      if err2 < 1.e-6
         flag2 = flag2 + 1;
      else
         flag2 = 0;
      end
      
      %onvergence of point3
      err3=abs(orb-point3);
      if err3 < 1.e-6
         flag3 = flag3 + 1;
      else
         flag3 = 0;
      end
      
    end

    % assign colores for bounded orbit
    if flag1 >= 5
        M(j,i) = 1;
    end
    
    if flag2 >= 5
        M(j,i) = 2; 
    end
    
    if flag3 >= 5
        M(j,i) = 3;
    end   

  end
end
% plot the results
xlimxlim
image([-1 1],[-1 1], M),  
% invert the axis 
axis xy  