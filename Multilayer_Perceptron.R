library(keras)
data <- read.csv("C:/Users/seera/Desktop/data analytics/winequality-red.csv")
str(data)
data <- as.matrix(data) #change the data to matrix from
str(data)
dimnames(data) <- NULL #giving null values to dimension names
data[,1:11] <- normalize(data[,1:11]) #normalise the data
data[,12] <- as.numeric(data[,12])
summary(data)
sample <- sample.int(n=nrow(data), size = floor(0.2*nrow(data))) #dividing the data
train <- data[-sample,1:11] #taking out train data from data set
trainingTarget <- data[-sample,12] #taking out the result(output) of the train data
test <- data[sample,1:11] #taking out test data from data set
testTarget <- data[sample, 12] #taking out the result(output) of the test data
#one hot encoding
trainLabels <- to_categorical(trainingTarget) #changed the train data output to categorical form
testLables <- to_categorical(testTarget) #changed the test data output to categorical form
print(testLables)
#creating sequential model
model <- keras_model_sequential()
model %>% #creating the model, defining the number of layers, number of neurons, optimizer, epochs
layer_dense(units = 60, input_shape = c(11)) %>%
layer_dense(units = 40, activation = 'relu') %>%
#layer_dropout(rate = 0.3) %>%
layer_dense(units = 30, activation = 'relu') %>%
#layer_dropout(rate = 0.2) %>%
layer_dense(units = 15, activation = 'relu') %>%
layer_dense(units = 9, activation = 'softmax')
summary(model)
optimizer_adam(lr = 0.001, beta_1 = 0.9, beta_2 = 0.999) #defining the learning rate of the optimizer
#used
model %>%
compile(loss = 'categorical_crossentropy', optimizer = 'adam', metrics='accuracy')
modelFit <- model %>% #fitting the model on train set
fit(train, trainLabels, epoch = 200, batch_size = 32, validation_split = 0.2)
plot(modelFit)
model1 <- model %>% #finding the accuracy of the model on the test set
evaluate(test,testLables)
prob <- model %>%
predict_proba(test) #taking out the probability of the model on test set
pred <- model %>%
predict_classes(test) #taking out the predicted output values of the test set
table(Predicted = pred , Acutal = testTarget) #plotting the confusion matrix
sqrt(mean((testTarget - pred)^2)) #finding the RMSE of the model on test set
