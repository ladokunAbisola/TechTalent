library(ggplot2)
library(readr)

data(mtcars)

cars <- data(mtcars)
print(cars)


ggplot(data=cars, aes(speed)) + 
  geom_histogram()

ggplot(data=cars, aes(speed)) + 
  geom_bar()


ggplot(cars, aes(x=speed, y=dist)) + geom_point()

ggplot(cars, aes(x=speed, y=dist)) + geom_line()

ggplot(cars, aes(x=speed, y=dist)) + geom_boxplot()
