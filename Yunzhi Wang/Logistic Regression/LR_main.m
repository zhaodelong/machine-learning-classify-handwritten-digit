tic
[W,error_rate] = LR_train(training_image, training_label, 28*28, 10, 0.000007, 400);

plot(error_rate,'linewidth',4)
xlabel('iteration','fontsize',15)
ylabel('error rate','fontsize',15)
title('Logsitic regression training curve','fontsize',17)
grid on

LR_exe_time = toc;
testing_data = [ones(1,10000);reshape(testing_image,[28*28,10000])];
pred = W*testing_data;
[dummy, predict] = max(pred);
rate = mean(predict-1~=testing_label)

for i = 1:10
    subplot(2,5,i)
    imshow(reshape(W(i,2:785),[28,28]),[])
    title(['Trained weights for label',num2str(i-1)],'fontsize',15)
end