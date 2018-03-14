
load('mnist_all.mat');



% number of neurons?? or size?? not sure
n = 784;
v = train0(500,:);
% trivial wight vector
null = ones(1,n);
% [w] = rand_weight(v);


[m n] = size(v);

% just defining the function right here
weight_vec = zeros(1,n);

    for j = 1:n
    
        weight = rand;
        weight_vec(:,j) = weight;
        
    end

% disp(v(:,345));
% disp(input_vec(:,345));

% i'll explain later

    out = neuron(v,w);
    % bullshitting these numbers for now
    
    lay_num = 3;
    neron_num = 10;
    
    Out = Neu_net(lay_num, neron_num, v, weight);



    
    
    
    % 
%     figure(1) ;
%     j = v;
%     digitimage1 = reshape(j, 28, 28);
%     image(rot90(flipud(digitimage1),-1));
%     colormap(gray(256)), axis square tight off
%     
%     figure(2);
% mean_vec = mean(train0);
% 
% out_mean = neuron(784,mean_vec,null);
% 
% T(1,:) = mean(train0);
% j = T(1,:);
%     digitimage1 = reshape(j, 28, 28);
%     image(rot90(flipud(digitimage1),-1));
%     colormap(gray(256)), axis square tight off

    
    
    
    
    
    
    
    

function [weight_vec] = rand_weight(v)

% this function will take all the elements in a vector and multiply it but
% random weights

[m n] = size(v);

weight_vec = zeros(1,n);

    for j = 1:n
    
        weight = rand;
        weight_vec(:,j) = weight;
        
    end
    
end

% I'm gonna seperate what Alina has

function sigmoid = sig_func(net)

% basic sigmoidal function
sigmoid = 1 / (1 + exp( -1 * net ));

end

function neu = neuron(v, weight_vec)
% for now let's have it fixed
Net = zeros(1,784);
% get the 
Net = v * weight_vec';

neu = sig_func(Net);

end

% 
% % Alina's
% function OUT = neuron(n, O, w)
% % n = number of connections
% % O = input O_1, O_2, ..., O_n
% % w = input weights w_1, w_2, ..., w_n
% 
% net = eye(n);
% 
%     for i = 1:n
%         net(:,i) = O(:,i)*w(:,i); % The given value NET = sum(O_i * w_i)
%     end
% 
%         NET = sum(net);
% 
%         F_NET = 1./(1+exp(-NET)); % The given sigmoidal function F(NET)
%         OUT = F_NET;            % Output 
% 
% end



% I need to work on this more to get it to work
function [output] = Neu_net(layers, neu_num, input, weight_vec)

% initialize vector
output = zeros(1,neu_num);

% get n basically
[m, n] = size(input);

% I'm gonna use this in a bit
sig_input = 0;  % he calls this OUT? or NET??

    for i = 1:neu_num
          
          for j = 1:n
              
                   sig_input = sig_input + input(:,j) * weight_vec(:,j);
             
          end
          
          % get the output vector to be sent to target
          
             output(i,:) = sig_func(sig_input);
    end

           % for layers 2 to n-1
    for i = 1:(layers - 1)
         
        for j = 1:neu_num
        
            % repeat the process for more layers
            % this assumes each layer and it's neurons do the same stuff
            sig_input = 0;
            
            for k = 1:neu_num
            
               % same as for 1:neural num
                    sig_input = sig_input + output(k) * weight_vec(k)';
        
            end
            
            output(j) = sig_func(sig_input);
    
        end
        
    end

end

