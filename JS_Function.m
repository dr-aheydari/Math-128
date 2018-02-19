% Julia Set 
% Part i

%phi = inline('z^2 - 1.25')
phi = inline('z^2')
fx1 = (1+ sqrt(6))/2 ;
%fx1 =  -1;
%fx2 =  1 ;
fx2 = (1- sqrt(6))/2 ;

colormap([0 0 0 ; 1 0 1]);

zk = Julia(phi,fx1,fx2);

disp(zk);


function [zk] = Julia(phi,fx1,fx2)
M = 2 * ones (141,361);

    for j = 1:141
        y = -.7 + (j-1) * 0.01;
        
        for i = 1:361
        x = -1.8 + (i-1) * 0.01;
        z = x + 1i * y;
        % return
        zk = z;
        iflag1 = 0;
        iflag2 = 0;
        count = 0;
        
        while count < 100 & abs(zk) < 2 & iflag1 < 5 & iflag2 < 5
            
            count = count + 1;
            zk = phi(zk);
            
            error1 = abs(zk - fx1);
            
                if error1 < 1.e-6
                    iflag1 = iflag1 + 1;
                else
                    iflag1 = 0;
                end
                
                error2 = abs(zk - fx2);
                if error2 < 1.e-6
                    iflag2 = iflag2 + 1;
                    
                else 
                    iflag2 = 0;
                end
        end
        
            if iflag1 >= 5 || iflag2 >= 5 || count >= 100
            
                M(j,i) = 1;
            end
        
        end
        
    end
    
    image([-3 3], [-3 3], M);
    
    axis xy;
end
                    

