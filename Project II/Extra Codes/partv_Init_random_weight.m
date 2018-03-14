% Ali Heydari
% part v : Initializing random Weight to the matric




function [ weight, range ] = random_initialize_weight( input, output )
% this functun will assign uniformly random weights 

range = sqrt(6/(input + output));

weight = unifrnd(-range,range,input,output);

end