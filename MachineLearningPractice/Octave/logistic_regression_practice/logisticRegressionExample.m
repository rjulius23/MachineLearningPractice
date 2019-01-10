
%% Initialization
clear ; close all; clc

fprintf('Plotting Data ...\n')
% data = load('log_reg_ex_data.txt');
data = load('simple_data_and.txt');
X = data(:, [1, 2]);
y = data(:, 3);
m = length(y); % number of training examples
% Plot Data
% Note: You have to complete the code in plotData.m
% it only forks for 2 features for now
plotData(X, y);

fprintf('Program paused. Press enter to continue.\n');
pause;

iterations = 1500
alpha = 3

X = [ones(m, 1), data(:, [1, 2])]; % Add a column of ones to x
theta = zeros(3, 1); % initialize fitting parameters

fprintf('\nTesting the cost function ...\n')

% Use gradient descent
fprintf('\nRunning Gradient Descent ...\n')
% run gradient descent
[theta_grad, J_hist] = gradientDescentLogRegression(theta, X, y, alpha, iterations);

fprintf('\nTheta calculated with gradient descent:')
theta_grad

% Grid over which we will calculate J
theta0_vals = linspace(-10, 1, 20);
theta1_vals = linspace(-10, 1, 20);



% % initialize J_vals to a matrix of 0's
% J_vals = ...
% zeros(length(theta0_vals), length(theta1_vals), length(theta1_vals));
%
% % Fill out J_vals
% for i = 1:length(theta0_vals)
%     for j = 1:length(theta1_vals)
%         for k = 1:length(theta2_vals)
% 	  t = [theta0_vals(i); theta1_vals(j); theta2_vals(k);];
% 	  [ J_vals(i,j,k), gradient ] = ...
%         costFunctionLogRegression(t);
%     end
% end

% Because of the way meshgrids work in the surf command, we need to
% transpose J_vals before calling surf, or else the axes will be flipped
% J_vals = J_vals';
% % Surface plot
% figure;
% surf(theta0_vals, theta1_vals, J_vals)
% xlabel('\theta_0'); ylabel('\theta_1');

theta = zeros(3, 1); % initialize fitting parameters

%Use optimized scripts
options = optimset('GradObj', 'on', 'MaxIter', '100');
[ optTheta, functionVal, exitFlag ] = ...
        fminunc(@(theta)costFunctionLogRegression(theta, X, y), theta, options)

