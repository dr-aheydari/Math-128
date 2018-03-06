T = zeros(10,784); % initialize T
for i=1:10
    % each row of T is the average of all the training sets for digit i-1
    T(i,:) = mean(eval(['train' num2str(i-1)]));
    
    % Plots the average digits 0-9 in a 2x5 array
    subplot(2,5,i); drawDigit(T(i,:));
end


% Usage: drawDigit(someset(somerow,:))
%        where someset is the training/test/average set, and somerow is
%        the row of the training data set you would like to use. One row
%        corresponds to one handwritten digit (or an average digit).
function drawDigit(digit)
digitImage = reshape(digit,28,28);
image(rot90(flipud(digitImage),-1)),
    colormap(gray(256)),
    axis square tight off;
end
