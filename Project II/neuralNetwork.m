% Neural Network

function outputs = Network(num_layers,input,weight)

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
