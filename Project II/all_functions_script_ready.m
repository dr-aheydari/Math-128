% loading the stupid data
load('mnist_all.mat');

% Derek's way of Neurons
num_neurons = [784 10 9 7 5 3 10];

% for now
num_layers = 5;



testSet = cell(1,10);
trainSet = cell(1,10);
for i=1:10
testSet{i} = eval(['test' num2str(i-1)]);
trainSet{i} = eval(['train' num2str(i-1)]);
end

weight_all = cell(1,10);

counter = 0;

for i = 1:9
    
    weight = Weight(num_neurons,num_layers);
    weight_all{i} = weight;
    
    digit = i;
%     fprintf('Training the network for digit %i\n',digit); 
    % the rest of the inputs
    
    training_set = trainSet{i};
    set2 = training_set;
    input = double(set2(i,:));
    
    target = Target(digit);
    
    training = trainNetwork(training_set,num_layers,weight_all{i},target);
    outputs = Network(num_layers,input,weight_all{i});
    
    digit = 4;
% fprintf("Testing the network for input digit . . .", digit);
% training = trainNetwork(training_set,num_layers,weight,target)
[m n] = size(test4);

for i = 1:m

input = double(test4(i,:));
outputs_test = Network(num_layers,input,weight);

% outputting digit
 counter = output(training,digit,counter);
 
end


    

end

fprintf(" Running the test set for digit 4 ... \n");

success_rate = (counter) / m * 100;

fprintf("Success recognition rate is %i",success_rate);
% 
% 
% digit = 4;
% % fprintf("Testing the network for input digit . . .", digit);
% % training = trainNetwork(training_set,num_layers,weight,target)
% [m n] = size(test4);
% 
% for i = 1:m
% 
% input = double(test4(i,:));
% outputs_test = Network(num_layers,input,weight);
% 
% % outputting digit
%  counter = output(training,digit);
%  
% end


 

function weight = Weight(num_neurons,num_layers)

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

end



function success = output(training,digit,counter)

% I will change this later to what Derek Wants
% change this to be the index of the minimum

for i = 1:10
    
        
    if training(i) < .12
        
        if digit == i
%              disp('lol');
        
        counter = counter + 1;
        
        end
     
        
    end
end

success = counter;
end



function target = Target(digit)
% initialize
target = zeros(1,10);

% here we need a digit between 0 and 9
target(digit + 1) = 1;
% output results
% fprintf("the target set is: \n");
% disp(target);

end

function training = trainNetwork(trainset,num_layers,weight,target)

[m,n] = size(trainset);
% for each row
    for i=1:m    
           
%            trainset = trainSet{i};
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

    change{length(weight)} = 0.1 .* outputs{length(outputs) - 1}' * ...
        delta{length(weight)} ;

    % now to compute for the whike
    for i = length(weight):-1:2
        
           delta{i - 1} = delta{i} * weight{i}' .* (outputs{i} .* ...
               (1 - outputs{i}));
           
           change{i - 1} = 0.1 .* outputs{i-1}' * delta{i-1};
    end

    % to store the changes from backpropogation
    for i = 1:length(weight)
        
          weight{i} = weight{i} + change{i};
         
          
    end

end


