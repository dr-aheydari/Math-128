% neuronsInLayer will be input
neuronsInLayer = [784 30 20 20 10 10];

% To initialize the weight matrices with random numbers in [-1,1]:
layers = size(neuronsInLayer,2);
weights = cell(1,layers-1);
for i=1:layers-1
    weights{i} = -1 + 2*rand(neuronsInLayer(i),neuronsInLayer(i+1));
end

% To visualize the storage of the data:
disp(weights)

% To access each weight matrix:
disp(weights{5})

% To access an individual element in a weight matrix:
disp(weights{5}(4,5))
