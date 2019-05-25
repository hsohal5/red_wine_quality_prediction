# Red wine quality prediction

## Problem Description:
Forecasted the quality of red wine depending upon the physicochemical
properties using neural network. Most of the wines become better with age and their value and cost
increased depending on the features that changes over time. In wine producing countries like Italy,
France etc, most of the economy depends on wine production, wine certification and assessment is
required to determine the quality of wine and to avoid adulteration. So, this model can be used by
certification bodies to determine the quality and value of the wine. 
The data set is taken from https://www.kaggle.com/uciml/red-wine-quality-cortez-et-al-2009.

## Process Used:
Data pre-processing:
1) Uploaded the data and converted it to matrix form as the data should be in matrix form before
feeding it to the neural network.
2) Removed the default names of the columns so as the data fits the matrix form.
3) The next step is to normalise the data to get it on the same scale. Normalising data is
important in deep learning because if the scales of different data is widely different it will
reduce the ability of the model to learn.
4) Distributed the data into train and test set in 80:20 ratio.
5) As the output of my dataset (train and test) is categorical I used one hot encoder to change it
to the form which ML can easily understand.
Model Training:
1) Decided the appropriate model after tuning which had the lowest validation loss and more
accuracy.
2) Fed the training data to the model ie. Train set and trainLabels.
3) Predicted the test data on the model and plotted the confusion matrix to check the predicted
values of quality of wine.
Evaluation:
The model is evaluated on the test data and accuracy of the model was taken. Then confusion matrix
of the predicted data was plotted. Confusion matrix is a table used to describe the performance of
classification model.
