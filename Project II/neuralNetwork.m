%neuronsInLayer = [49 7 10];
%for i=1:size(neuronsInLayer)
%    W = rand(
%    for j=1:neuronsInLayer(i)
        % some matrix (w_ij) with index i corresponding to the leaving
        % neuron and index j corresponding to the entering neuron, and w_ij
        % is the weight of each connection.
        
neuronOuts = zeros(784,1);
for i=1:784
neuronOuts(i) = neuron(1,train0(1,i),-1 + 2*rand(1));
end
%disp(neuronOuts)
neuronOuts_2 = zeros(10,1);
for i=1:10
neuronOuts_2(i) = neuron(784,neuronOuts,-1 + 2*rand(784,1));
end
disp(neuronOuts_2)
