function g = sigmoid(z)

    % calculate the sigmoid
    g = (1 + exp(-z)).^-1;

end
