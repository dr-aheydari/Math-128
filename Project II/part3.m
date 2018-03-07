% Project 2
% Part (iii)



function OUT = neuron(n, O, w)
% n = number of connections
% O = input vectors O_1, O_2, ..., O_n
% w = input weights w_1, w_2, ..., w_n

for i = 1:n
    NET(i) = O(i)*w(i); % The givan value NET = sum(O_i * w_i)
end
NET = sum(NET);

F_NET = 1/(1+e^(-NET)); % The given sigmoidal function F(NET)
OUT = F_NET;            % Output 

end
