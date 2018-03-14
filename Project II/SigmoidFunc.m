% Sigmoid function 
function neuron = logsig(net)

neuron = (1 + exp(-1 * net)).^-1;

end
