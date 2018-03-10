% Simple script to simultaneously test the recognition accuracy of all
% handwritten test digits against the average handwritten digits in T.

for i=1:10
    set = eval(['test' num2str(i-1)]);
    disp([i-1 testAll(set,i-1,T)]);
end