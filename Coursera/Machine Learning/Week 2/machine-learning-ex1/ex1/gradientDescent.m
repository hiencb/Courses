function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
% disp(theta)
% X1 = X(:, 1);
% X2 = X(:, 2);
for iter = 1:num_iters
    %xj = X(iter, 2);
    cost = (X * theta - y);
    theta = theta - X' * cost * (alpha / m);
    %theta(1) = theta(1) - sum(cost .* X1) * (alpha / m);
    %theta(2) = theta(2) - sum(cost .* X2) * (alpha / m);
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %






%     disp(computeCost(X, y, theta));
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
