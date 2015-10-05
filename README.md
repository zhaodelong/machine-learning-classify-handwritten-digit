# machine-learning-classify-handwritten-digit
            Computer Science 4033/5033: Machine Learning
            
  Classify handwritten digits using machine learning techniques

                Yan Liang, Yunzhi Wang and Delong Zhao 

                              Fall 2015
  
  Project scope
  For our machine learning project, we propose to build several machine learning
classifiers that recognize handwritten digits. Handwritten digit recognition is a classic problem in
machine learning studies for many years. We plan to do several experiments using different
machine learning algorithms and compare the pattern recognition performance. We hope to
create a classifier that has same or better categorization accuracy than record performance from
previous studies. Yan will focus on neural network, Delong will focus on the random forests
methods, and Yunzhi will focus on SVMs and KNNs. We will also develop a final novel
classifier that combines the best models from our different experiments. We hypothesize that the
final classifier will archive a categorization accuracy of 0.99. This indicates that the classifier
correctly classified all the handwritten digits but 1% of the images.

  The goal of handwritten digit recognition is to determine what digit is from an image of a
single handwritten digit. It can be used to test pattern recognition theories and machine learning
algorithms. Preprocessed standard handwritten digit image database has been developed to
compare different digit recognizers. In our semester project, we will use modified National
Institute of Standards and Technology (MNIST) handwritten digit images dataset from kaggle
digit recognizer project. The Kaggle MNIST dataset is freely available and collected 28,000
training images and 42,000 test images. Each image is a preprocessed single black and white
digit image with 28 x 28 pixels. Each pixel is an integer value range from 0 to 255 which
represent the brightness of the pixel, the higher value meaning darker. Each image also has a
label which is the correct digit for the handwritten image. For each input handwritten image, our
model will output which digit we predict and evaluate with the correct label. We will use 28,000
training images to train our machine learning model and use 42,000 test images to test the
performance. Then we will calculate the percentage of the test images that are correctly
classified and compare the performance of different machine learning algorithms.
