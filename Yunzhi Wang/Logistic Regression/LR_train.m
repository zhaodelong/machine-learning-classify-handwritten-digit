function [train_weights,error_rate] = LR_train(training_image, training_label, n_in, n_out, learning_rate, max_iter)
% train the logistic regresion model for digit classification
W = rand([n_out, n_in+1])*0.0001;%initilize weights randomly
training_data = [ones(1,60000);reshape(training_image,[28*28,60000])];%reshape image data to a one-dimension feature vector
error_rate = [];
for i = 1:max_iter
    update = zeros(n_out, n_in+1);
    for j = 1:size(training_data,2)
        training_case = training_data(:,j);
        training_case_label = training_label(j);
        prob = exp(W*training_case);
        prob = prob./sum(prob);%softmax for output layer
        for k = 1:10
            if k-1 ~= training_case_label
                update(k,:) = update(k,:) + (-prob(k))*training_case';%log-likelihood loss
            else
                update(k,:) = update(k,:) + (1-prob(k))*training_case';
            end
        end
    end
    update = update./size(training_data,2);
    W = W + learning_rate*update;
    pred = W*training_data;
    [dummy, predict] = max(pred);
    iter = i
    rate = mean(predict-1~=training_label)
    error_rate = [error_rate,rate];
end
plot(error_rate)
train_weights = W;