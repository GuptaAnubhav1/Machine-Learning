dataset = read.csv('Salary_Data.csv')

library(caTools)
set.seed(100)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset,split==FALSE)

regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)
install.packages("ggplot2")
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'blue') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'red') +
  ggtitle('Salary V/s Experience [Training_set]') +
  xlab('Years of Experience') +
  ylab('Salary')

library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'blue') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'red') +
  ggtitle('Salary V/s Experience [Test_set]') +
  xlab('Years of Experience') +
  ylab('Salary')

  
