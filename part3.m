% Project 2
% Part (iii)



function OUT = neuron(n, O, w)
% n = number of connections
% O = input vectors O_1, O_2, ..., O_n
% w = input weights w_1, w_2, ..., w_n

net = eye(n);

for i = 1:n
    net(:,i) = O(:,i)*w(:,i); % The given value NET = sum(O_i * w_i)
end
NET = sum(net);

F_NET = 1/(1+exp(-NET)); % The given sigmoidal function F(NET)
OUT = F_NET;            % Output 

end
