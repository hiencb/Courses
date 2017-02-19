function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
% J = 0;
% grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
% disp(X);        disp(size(X));      % 12 x 2
% disp(theta);    disp(size(theta));  % 2 x 1
% disp(y);        disp(size(y));      % 12 x 1
diff = X * theta - y;
theta1 = theta;
theta1(1,:) = 0;
% disp(error);    disp(size(error));  % 12 x 1
% disp(theta1);   disp(size(theta1)); % 2 x 1
squaredError = diff .* diff;
squaredTheta = theta1 .* theta1;

J = (sum(squaredError(:)) + lambda * sum(squaredTheta(:))) / (2 * m);
grad = (X' * diff + lambda * theta1)/m;








% =========================================================================

grad = grad(:);

end
