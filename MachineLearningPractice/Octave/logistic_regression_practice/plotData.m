function plotData(X, y)
%PLOTDATA Plots the data points x and y into a new figure
%   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
%   population and profit.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the training data into a figure using the
%               "figure" and "plot" commands. Set the axes labels using
%               the "xlabel" and "ylabel" commands. Assume the
%               population and revenue data have been passed in
%               as the x and y arguments of this function.
%
% Hint: You can use the 'rx' option with plot to have the markers
%       appear as red crosses. Furthermore, you can make the
%       markers larger by using plot(..., 'rx', 'MarkerSize', 10);

pos_class = find(y==1); % find the indices where y == 1
neg_class = find(y==0); % find the indices where y == 0

% Plot the X1,X2 values according to the pos and neg indices
plot(X(pos_class, 1), X(pos_class, 2), 'k+','LineWidth', 2, ...
'MarkerSize', 7);
plot(X(neg_class, 1), X(neg_class, 2), 'ko', 'MarkerFaceColor', 'y', ...
'MarkerSize', 7);

% =========================================================================


hold off;

end
