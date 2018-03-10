% Tests a handwritten digit against the average digits stored in T to
% determine which it is closest to, in the sense of minimizing the norm
% of the difference between the vectors (as in Exercise 17b ).

function guess = testDigit(digit,T)
d = double(digit);
guess = 0;
norm_guess = norm(T(1,:) - d);
for i=2:10
    norm_test = norm(T(i,:) - d);
    if norm_test < norm_guess
        norm_guess = norm_test;
        guess = i-1;
    end
end