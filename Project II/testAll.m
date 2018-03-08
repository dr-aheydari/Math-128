% Outputs the accuracy of the testDigit method for all handwritten digits
% in set. Tests against the average digit num in T.

function accuracy = testAll(set,num,T)
n = size(set,1);
numCorrect = 0;
for i=1:n
    if testDigit(set(i,:),T) == num
        numCorrect = numCorrect + 1;
    end
end
accuracy = numCorrect / n;