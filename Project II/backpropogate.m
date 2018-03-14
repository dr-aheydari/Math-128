function weight = backpropogate(outputs, weight, error)
    % Given delta formula 
    delta{length(weight)} = outputs{length(outputs)} .* ...
        (1 - outputs{length(outputs)}) .* error;
    % Update the weights of output layer
    update_weights{length(weight)} = 0.01 .* outputs{length(outputs) - 1}' * ...
        delta{length(weight)} ;

    % Update the weights of hidden layers
    for i = length(weight):-1:2
        
           delta{i - 1} = delta{i} * weight{i}' .* (outputs{i} .* ...
               (1 - outputs{i}));
           
           update_weights{i - 1} = 0.01 .* outputs{i-1}' * delta{i-1};
    end

    % to store the changes from backpropogation
    for i = 1:length(weight)
        
          weight{i} = weight{i} + update_weights{i};
            
    end

end