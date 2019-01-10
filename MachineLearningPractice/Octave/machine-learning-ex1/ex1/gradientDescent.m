function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    % Important note, that the lot of transposing is because how the data is
    % stored in the matrixes, needs a few rotation, but dimension check should
    % always help so if we know what we expect 2x1 column vector then we need
    % to get a 2x1 column vector like here: 2x97 x 97x1 ... etc.

    error_func = theta' * X' - y';
    J_derivative_term = 1/m * (error_func*X)';
    theta = theta - alpha * J_derivative_term;

    % ============================================================

    % Save the cost J in every iteration
    J_history(iter) = computeCost(X, y, theta);

end

end
