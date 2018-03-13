function OUT_LAYER = neuralNetwork(input,neuronsInLayer)
% Input Layer gets initialized to "input" with no weights, and first hidden
% layer gets the image of these values (weighted) as inputs.
neuronOuts = zeros(784,1);
for i=1:784
    % Using randomized weights for now
    neuronOuts(i) = neuron(1,input(i),-1 + 2*rand(1));
end

neuronsInLayer = [784 neuronsInLayer];

% Other Layers get output of previous layer as input, and output the
% weighted image of these values.
for j=2:size(neuronsInLayer,2)
    neuronIns = neuronOuts;
    newSize = neuronsInLayer(j);
    oldSize = neuronsInLayer(j-1);
    neuronOuts = zeros(newSize,1);
    for i=1:newSize
        % Using randomized weights for now
        neuronOuts(i) = neuron(oldSize,neuronIns,-1 + 2*rand(oldSize,1));
    end
    %disp(neuronOuts)
end
OUT_LAYER = neuronOuts;