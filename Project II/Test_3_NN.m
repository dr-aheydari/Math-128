% loading the stupid data
load('mnist_all.mat');

% Derek's way of Neurons
num_neurons = [784 20 20 20 10];

% for now
num_layers = 3;

% Derek's suggestion of the cell (brilliant btw)

weight{1} = rand(num_neurons(1),num_neurons(2));
weight{2} = rand(num_neurons(2),num_neurons(3));

if num_layers > 1
    [a b] = size(num_neurons);
    
    for i = 3: b-1
%     weight{1} = rand(num_neurons(1),num_neurons(2));
%     weight{2} = rand(num_neurons(2),num_neurons(3));
    weight{i} = rand(num_neurons(i),num_neurons(i+1));
    end
    
end

% convert uint8 to double
input = double(test4(500,:));

outputs = Network(num_layers,input,weight);

% input digit
digit = 4;
fprintf('Training the network for digit %i\n',digit); 
% the rest of the inputs
target = Target(digit);
trainset = train4;
training = trainNetwork(trainset,num_layers,weight,target)

outs = Network(num_layers,input,weight);

% outputting digit
output(training);


function [] = output(training)

% I will change this later to what Derek Wants
for i = 1:10
    
    if training(i) < .1
        
        fprintf('Your input digit is %i \n', i-1);
        break;
        
    end
end
end



function target = Target(digit)
% initialize
target = zeros(1,10);

% here we need a digit between 0 and 9
target(digit + 1) = 1;
% output results
fprintf("the target set is: \n");
disp(target);

end

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



% Alina's function seperated
function neuron = logsig(net)

neuron = (1 + exp(-1 * net)).^-1;

end


function outputs = Network(num_layers,input,weight)

        % creating the first cell of the output
        outputs{1} = input;
        net = input * weight{1};
        outputs{2} = logsig(net);

        % last layer is just the output layer
        for i = 1:(num_layers - 1)
             net = outputs{i + 1} * weight{i + 1};
             outputs{i + 2} = logsig(net);
        end

        % the given NET and OUT from the project descrip.
        net = outputs{length(weight)} * weight{length(weight)};
        outputs{num_layers + 2} = logsig(net);


end


function weight = backpropogate(outputs, weight, error)
    % this is the given delta function
    delta{length(weight)} = outputs{length(outputs)} .* ...
        (1 - outputs{length(outputs)}) .* error;

    change{length(weight)} = 0.01 .* outputs{length(outputs) - 1}' * ...
        delta{length(weight)} ;

    % now to compute for the whike
    for i = length(weight):-1:2
        
           delta{i - 1} = delta{i} * weight{i}' .* (outputs{i} .* ...
               (1 - outputs{i}));
           
           change{i - 1} = 0.01 .* outputs{i-1}' * delta{i-1};
    end

    % to store the changes from backpropogation
    for i = 1:length(weight)
        
          weight{i} = weight{i} + change{i};
         
          
    end

end


