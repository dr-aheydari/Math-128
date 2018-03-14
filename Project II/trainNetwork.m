% Training the Neural Network

function training = trainNetwork(trainset,num_layers,weight,target)

[m,n] = size(trainset);
% for each row
    for i=1:m    
        
           input = double(trainset(i,:));
           outputs = Network(num_layers,input,weight);
           error = abs(target - outputs{length(outputs)});
           weight = backpropogate(outputs, weight, error); 
           
    end

training = error;

end
