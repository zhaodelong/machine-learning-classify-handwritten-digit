load('MNIST_data.mat')

training_data = reshape(training_image,[28*28,60000])./255;
[coeff,score,latent] = pca(training_data');
training_mean = mean(training_data');
kk = (training_data' - repmat(training_mean,60000,1))*coeff;

sum(latent(1:200))/sum(latent)
testing_data = reshape(testing_image,[28*28,10000])./255;
test_pca = (testing_data' - repmat(training_mean,10000,1))*coeff;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  MLP PCA 50  %%%%%%%%%%%%%%%%%%%%%%%%%
n_in = 200;n_hidden=300;n_out=10;learning_rate=0.05;max_iter=500;
training_pca = [ones(1,60000);score(:,1:n_in)'];
testing_pca = [ones(1,10000);test_pca(:,1:n_in)'];
training_pca_error = [];
testing_pca_error = [];
w12 = normrnd(0,1,[n_hidden, n_in+1])*0.1;
w23 = normrnd(0,1,[n_out, n_hidden+1])*0.01;
for i = 1:150
    for j = 1:60000
        train = training_pca(:,j);
        predict = zeros(10,1);
        predict(training_label(j)+1) = 1;
        a1 = w12*train;
        hidden_val = 1./(1+exp(-a1));
        a2 = w23*[1;hidden_val];
        pred = 1./(1+exp(-a2));
        delta2 = (predict - pred) .* (pred.*(1-pred));
        delta1 = hidden_val.*(1-hidden_val).*(w23(:,2:(n_hidden+1))'*delta2);
        w23 = 1*w23 + learning_rate.*([1;hidden_val]*delta2')';
        w12 = 1*w12 + learning_rate.*(train*delta1')';
    end
    a1 = w12*training_pca;
    hidden_val = 1./(1+exp(-a1));
    a2 = exp(-w23*[ones(1,60000);hidden_val]);
    pred = 1./(1+a2);
    [ff,aaa]=max(pred);
    training_pca_error(i) = mean(aaa==training_label+1);
    training_pca_error(i)
    
    a1 = w12*testing_pca;
    hidden_val = 1./(1+exp(-a1));
    a2 = exp(-w23*[ones(1,10000);hidden_val]);
    pred = 1./(1+a2);
    [ff,aaa]=max(pred);
    testing_pca_error(i) = mean(aaa==testing_label+1);
    testing_pca_error(i)
end
plot(100*(1-training_pca_error(1:150)),'-*')
hold on 
plot(100*(1-testing_pca_error(1:150)),'r-*')
grid on
xlabel('iteration')
ylabel('error rate %')
legend('training error','testing error')

figure(2)
for i = 1:3000
    switch training_label(i)
        case 0
            plot(score(i,1),score(i,2),'o')
        case 1
            plot(score(i,1),score(i,2),'*')
        case 2
            plot(score(i,1),score(i,2),'ro')
        case 3
            plot(score(i,1),score(i,2),'r*')
        case 4
            plot(score(i,1),score(i,2),'yo')
        case 5
            plot(score(i,1),score(i,2),'y*')
        case 6
            plot(score(i,1),score(i,2),'mo')
        case 7
            plot(score(i,1),score(i,2),'m*')
        case 8
            plot(score(i,1),score(i,2),'ko')
        case 9
            plot(score(i,1),score(i,2),'k*')
    end
    hold on
end
