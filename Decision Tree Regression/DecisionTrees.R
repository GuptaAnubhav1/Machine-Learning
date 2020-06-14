dataset = read.csv("Position_Salaries.csv")
dataset = dataset[2:3]




library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

y_pred = predict(regressor, data.frame(Level = 6.5))


library(ggplot2)

ggplot()+
  geom_point(aes(x=dataset$Level, y =dataset$Salary),
             colour = "blue") +
  geom_line(aes(x=dataset$Level, y=predict(regressor, newdata = dataset)),
            colour = "red")+
  ggtitle("Decision Tree Regression")+
  xlab("Levels")+
  ylab("Salary")
  
x_grid = seq(min(dataset$Level), max(dataset$Level),0.01)
ggplot()+
  geom_point(aes(x=dataset$Level, y =dataset$Salary),
             colour = "blue") +
  geom_line(aes(x=x_grid, y=predict(regressor, newdata = data.frame(Level= x_grid))),
            colour = "red")+
  ggtitle("Decision Tree Regression")+
  xlab("Levels")+
  ylab("Salary")

