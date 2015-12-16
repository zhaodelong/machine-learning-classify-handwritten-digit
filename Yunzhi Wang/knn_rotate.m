load('MNIST_data.mat')
tic
for i = 1:10000
    image_0 = testing_image(:,:,i);
    image_1 = imrotate(testing_image(:,:,i),15,'bilinear','crop');
    image_2 = imrotate(testing_image(:,:,i),-15,'bilinear','crop');
    query_0 = knn_query(training_image,image_0);
    query_1 = knn_query(training_image,image_1);
    query_2 = knn_query(training_image,image_2);
    query_order(1,:,i) = query_0(1:100);
    query_order(2,:,i) = query_1(1:100);
    query_order(3,:,i) = query_2(1:100);
    if mod(i,100)==0
        i
    end
end
toc
save knn_query.mat

k=2;
for i = 1:10000
    k_order = query_order(:,1:k,i);
    similar_label = training_label(k_order);
    n1 = sum(similar_label(1,:)==mode(similar_label(1,:)));
    n2 = sum(similar_label(2,:)==mode(similar_label(2,:)));
    n3 = sum(similar_label(3,:)==mode(similar_label(3,:)));
    %n1=100;
    if n1>=n2 && n1>=n3
        predict_label(i) = mode(similar_label(1,:));
    elseif n2>=n3
        predict_label(i) = mode(similar_label(2,:));
    else
        predict_label(i) = mode(similar_label(3,:));
    end
end
sum(predict_label~=testing_label)/10000
