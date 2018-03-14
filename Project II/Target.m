
% Create an array of targets

function target = Target(digit)
% initialize
target = zeros(1,10);

% here we need a digit between 0 and 9
target(digit + 1) = 1;
% output results
fprintf("the target set is: \n");
disp(target);

end
