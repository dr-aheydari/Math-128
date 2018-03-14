% Output the final answer
function [] = output(training)

% I will change this later to what Derek Wants
for i = 1:10
    
    if training(i) < .1
        
        fprintf('Your input digit is %i \n', i-1);
        break;
        
    end
end
end