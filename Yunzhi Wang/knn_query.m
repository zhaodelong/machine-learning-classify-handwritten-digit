function query_order = knn_query(training_image,query_image)
%given training set and query image, return the order of training set
%according to the similarity with the query image
    dif = [];
    for i = 1:size(training_image,3)
        dif(i) = sqrt(sum(sum((training_image(:,:,i) - query_image).^2)));
    end
    [rr,query_order] = sort(dif);
end