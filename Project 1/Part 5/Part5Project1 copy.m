% Alina Gataullina
% 128B Project 1
% Part v. - Connecivity of the Julia Set 

phi = inline('z^2 + c');

c = -0.7269+0.1889i; % chose parameter c
z = 0;      % initial point

Connectivity(phi,c,z); % calling the function

function Connectivity(phi,c,z)

% do 101 iterations
for i = 1: 101
    
    z = phi(z,c); % evaluate the function phi

end

% Assume divergence happens at |z|>100

if abs(z) > 100
    disp('Disconnected')
    
else
    disp('Connected')
end

end