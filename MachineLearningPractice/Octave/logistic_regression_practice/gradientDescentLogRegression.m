function [theta, J_history] = gradientDescentLogRegression(theta, X, y, alpha, num_iters, lambda)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

    % made them global, because the fminunc only accepts
    % a costFunc with one param
J_history = zeros(num_iters, 1);
m = length(y);
w = waitbar(0, 'Calculating gradientDescent...');
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    waitbar(iter/num_iters, w, 'Calculating gradientDescent...');
    z = X * theta;
    h = sigmoid(z);
    J_derivative_term = 1/m * X' * (h - y);
    % theta_reg = theta;
    % theta_reg(1) = 0; % remove theta0 from regularization, by convention
    % regularization_term = lambda/m * theta_reg; % For regularization
    theta = theta - alpha * (J_derivative_term); % + regularization_term);
    % ============================================================

    % Save the cost J in every iteration
    [J_history(iter) gradient]= costFunctionLogRegression(theta, X, y);

end

close(w)

end
