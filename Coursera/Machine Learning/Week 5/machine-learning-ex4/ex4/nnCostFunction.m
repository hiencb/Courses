function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
% J = 0;
% Theta1_grad = zeros(size(Theta1));
% Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
% disp(size(X)); % 5000 x 400
% disp(size(y)); % 5000 x 1
% disp(size(Theta1)); % 25 x 401
% disp(size(Theta2)); % 10 x 26
% disp(size(lambda)); % 1 x 1

a1 = X;
x1 = [ones(m, 1) X];
% disp(size(a1)); % 5000 x 401
z2 = x1 * Theta1';
a2 = sigmoid(z2);
% disp(size(x2)); % 5000 x 25
x2 = [ones(m, 1) a2];
z3 = x2 * Theta2';
a3 = sigmoid(z3);
% disp(size(h)); % 5000 x 10

totalCost = zeros(1, num_labels);
delta1 = zeros(size(Theta1));
delta2 = zeros(size(Theta2));

for i = 1:m
    ym = zeros(1, num_labels);
    ym(1, y(i,1)) = 1;
    a = a3(i,:);
    cost = (-ym .* log(a)) - ((1 - ym) .* log(1 - a));
    totalCost = totalCost + cost;
    
    z2m = [1 z2(i,:)];
%     disp(z2m);
    d3 = a - ym;
%     disp(d3);
%     disp(size(d3));
%     disp(size(Theta2));
%     disp(size(z2m));
    d2 = (d3 * Theta2) .* sigmoidGradient(z2m);
    
    d2x = d2(2 : end);
    a_1 = x1(i, :);
%     disp(size(delta1));
%     disp(size(d2x));
%     disp(size(a_1));
    
    delta1 = delta1 + d2x' * a_1;
    
    a_2 = x2(i, :);
    
    disp(size(delta2));
    disp(size(d3));
    disp(size(a_2));
    delta2 = delta2 + d3' * a_2;
end

squaredTheta1 = Theta1 .* Theta1;
squaredTheta2 = Theta2 .* Theta2;
sum1 = sum(sum(squaredTheta1(1:end, 2:end)));
sum2 = sum(sum(squaredTheta2(1:end, 2:end)));

cost = sum(totalCost) / m;
disp(cost);
J = cost + (lambda / (2 * m)) * (sum1 + sum2);



Theta1x = Theta1;
Theta1x(:,1) = zeros(size(Theta1,1),1);
Theta2x = Theta2;
Theta2x(:,1) = zeros(size(Theta2,1),1);

Theta1_grad = delta1 / m + Theta1x * (lambda/m);
Theta2_grad = delta2 / m + Theta2x * (lambda/m);
grad = [Theta1_grad(:); Theta2_grad(:)];

% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.


% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
