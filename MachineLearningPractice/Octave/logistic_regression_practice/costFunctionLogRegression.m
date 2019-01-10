function [jVal, gradient] = costFunctionLogRegression(theta, X, y)
    % made them global, because the fminunc only accepts
    % a costFunc with one param

    m = length(y);
    z = X * theta; % helper to calculate theta' * X
    h = sigmoid(z); % calculate the hypothesis sigmoid

    jVal = 1/m * ((-1) * y' * log(h) - (1-y)' * log(1-h)); % calculate the J

    gradient = zeros(size(theta,1),1);
    gradient = 1/m * X' * (h - y);
end
