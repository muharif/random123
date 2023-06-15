#Today we are going to learn on the basics of R.
#We are going to learn about the arithmatic and logical operations, syntax, data type, and ultimately making our own functions

#Try to understand the meaning of each lines/commands. You'll have to use it in the exercises.
#######################
###SIMPLE OPERATIONS###
#######################

#defining variables
a <- 5
b <- 20
c <- 17


#arithmatic calculations
a + b
sum(a,b)
b - c
a * c
b / a
c %% a #modulo
c %/% a

d <- abs(a-b)

#logical operations (results are only TRUE or FALSE)

a == b
(a+d) == b
a >= b
b < c
b > a
(b > a) & (d > c)
(b > a) & (d <= c)

(b > a) == TRUE
(d > c) == TRUE

############
#DATA TYPES#
############

e <- 'My name is Bond'
f <- '007'
g <- 80.3
h <- c(12,17,1)
i <- '12'

class(a)
class(e)
class(f)
class(g)
class(h)
class(i)

h-a
e-a
i-a #Why error?
as.numeric(i)-a #Why works?

e == f

#####################
#STRING MANIPULATION#
#####################
j <- 'James Bond'

paste(e,j,sep=', ')
paste('My codename is',f)
paste('My weight is',g,'kg') #check the difference between paste and paste0

k=paste('My codename is',f)
k
strsplit(k,' ')



###################
#VECTOR AND MATRIX#
###################


#We'll not use this much today but it's good to know. We'll explore it again tomorrow
vector1<-c(1,2,3,7,8)
class(vector1)

vector1*a
vector1+a

vector2<-c(3,2,1,-3,-9)
vector1+vector2

## What happen here?
vector3<-c(3,2,1,-3)
vector1+vector3

#Matrix
airspeed <- matrix(c(10,15,7,10),2,2)
colnames(airspeed)
colnames(airspeed) <- c("laden","unladen") 
colnames(airspeed)[1]
colnames(airspeed)[2] <- "Maria"

A<-matrix(c(1,2,8,3,2,1),3,2)
A
B<-matrix(c(3,6,1,9,2,7),2,3)
B
C<-matrix(c(1:6),2,3)
C

A%*%B
A*B #why error?
B%*%A # why is it different with A%*%B?

B*C 
B%*%C #why error?



a<-2
A*a
A+a

Matrix1<-matrix(1,2,2)
Matrix1[1,1] <- 1
Matrix1[1,2] <- 3
Matrix1[2,1] <- 2
Matrix1[2,2] <- -2
Matrix1

Matrix2<-matrix(c(1,2,3,-2),2,2)
Matrix2
rownames(Matrix2) <- c("Row1","Gordon")
Matrix2[1,1] 
Matrix2["Gordon",1] 


#######
#LISTS#
#######

l <- list(1, 2, 3)
str(l) #what is this?

vec1 <- letters
vec2 <- 1:4
mat1 <- matrix(1:100, nrow = 5)
df1 <- as.data.frame(cbind(10:1, 91:100))
u.2 <- list(vec1, vec2, mat1, df1, l)
str(u.2)

u.2[1]
str(u.2[1])

u.2[[1]]
str(u.2[[1]])

u.2[[4]][,2]


####################
#BUILDING FUNCTIONS#
####################

calculate_age <- function(birthyear, thisyear=2023){
  #selection, to check if birthyear is valid
  if(birthyear > thisyear){
    print('ERROR: Invalid birth year')
  } else {
    return(thisyear-birthyear)
  }
}

print_information <- function(name, age, city){
  temp1=paste('Full Name:',name)
  temp2=paste('Age:',age)
  temp3=paste('Place of Birth:',city)
  
  #repetition
  for(i in c(temp1,temp2,temp3)){
    print(i)
  }

}

age=calculate_age(2021) #check the global environment pane, now we have age variable (righthand side)
age

age=calculate_age(1988)
age

print_information('Arsene Wenger', calculate_age(1949), 'Strasbourg')

#observe the difference between return and print in a function

############
#Excercises#
############

#In this exercises, try to complete the functions with your code to get TRUE in all use cases given.
#Fill the functions with your code where it is marked with "#WRITE YOUR CODE HERE"
#Don't change anything else.

#Example:
valid_birthyear <- function(birthyear, thisyear=2023){
  #WRITE YOUR CODE HERE
  if(birthyear > thisyear){
    return(FALSE)
  } else {
    return(TRUE)
  }
}

#use cases
valid_birthyear(1988) == TRUE
valid_birthyear(2088) == FALSE
#######################################################################

## Scoring System
## Solving 1-3 questions: 1
## Solving 3-5 questions: 2
## Solving 5-7 questions: 3
## Solving 7-9 questions: 4
## Solving all: 5

#Question 1
#Create a function to convert a temperature from fahrenheit to celcius.

fahrenheit_to_celsius <- function(temp_F) {
  #WRITE YOUR CODE HERE
  temp_C = (temp_F - 32)*5/9 # this is a comment
  return(temp_C)
}

fahrenheit_to_celsius(32) == 0
fahrenheit_to_celsius(86) == 30

fahrenheit_to_celsius(75)

#Question 2
#find a temperature where it is (numerically) double in fahrenheit compared to its celcius scale. (limitation of scale from 1 to 400 F)
#The answer is 320 (320 F = 160 C)
#Create a function with loop and incorporate your function from Q1

fahrenheit_double_celcius <- function(){
  for(temp_F in 1:400){
    #WRITE YOUR CODE HERE
    #hint: use the function from Question 1
    temp_C = fahrenheit_to_celsius(temp_F)
    if(2*temp_C == temp_F){
      return(temp_F)
    }
  }
}


## Trial
# for(temp_F in 1:400){
#   #WRITE YOUR CODE HERE
#   #hint: use the function from Question 1
#   temp_C = fahrenheit_to_celsius(temp_F)
#   print(temp_C == temp_F/2)
#   
# }

fahrenheit_double_celcius()
fahrenheit_double_celcius() == 320

#Question 3
#Make a function to check if a year is leap year.

check_leap_year <- function(year){
  #WRITE YOUR CODE HERE
  
  #Option 1: Round function
  #isleap = ((year/4) == round((year/4)))
  
  #Modulo
  isleap = ((year %% 4) == 0)
  
  
  return(isleap)
}

100 %% 6

16*6 = 96

(3*33) + 1

check_leap_year(1990) == FALSE
check_leap_year(1988) == TRUE
check_leap_year(2000) == TRUE

#Question 4
#Create a function to wrap a text with a given wrapper.

text_wrapper <- function(text, wrapper){
  #WRITE YOUR CODE HERE
  
  #option 1: paste0
  #result = paste0(wrapper, text, wrapper)
  
  #option 2: paste
  result = paste(wrapper, text, wrapper, sep = '')
  
  return(result)
}

c('text1', 'text2')

text_wrapper('I love asterisks','****')

text_wrapper('I love asterisks','****') == '****I love asterisks****'
text_wrapper('Start and close with percent','%') == '%Start and close with percent%'

#Question 5
#Make a function to count the occurance of a number in a sentence

count_numbers <- function(sentence){
  #WRITE YOUR CODE HERE
  #hint: use as.numeric function from R. Split strings and iterate.
  
  sent_split = strsplit(sentence, ' ')[[1]]
  
  result = 0
  for(word in sent_split){
    if(is.na(as.numeric(word)) == FALSE){ # The function finds a number
      result = result + 1
    }
  }
  
  
  
  return(result)
}

#Solution from Jason Moody
count_numbers <- function(sentence) {
  words <- unlist(strsplit(sentence, " "))
  numbers <- suppressWarnings(as.numeric(words))
  count <- sum(!is.na(numbers))
  
  return(count)
}

strsplit('We need to add 1 teaspoon of sugar and 200 ml of water', ' ')[[1]]

is.na(as.numeric('We'))

count_numbers('We need to add 1 teaspoon of sugar and 200 ml of water then 20 ml of milk.We need to add 1 teaspoon of sugar and 200 ml of water then 20 ml of milk.We need to add 1 teaspoon of sugar and 200 ml of water then 20 ml of milk')

count_numbers('We need to add 1 teaspoon of sugar and 200 ml of water') == 2
count_numbers('Arsenal scored 3 goals in Anfield, 2 from Auba and 1 from Laca') == 3

#Question 6
#We need at least 8 hours of sleep per day, but not more than 10 hours.
#Make a function to check if a number of hour is within normal sleeping time range.

enough_sleep <- function(hours){
  #WRITE YOUR CODE HERE
  
  ## Long version
  
  # if(hours >= 8){
  #   eight = TRUE
  # } else {
  #   eight = FALSE
  # }
  # 
  # if(hours <= 10){
  #   ten = TRUE
  # } else {
  #   ten = FALSE
  # }
  # 
  # result = (eight & ten)
  
  ## Shorter Version
  
  # if ((hours >= 8) & (hours <=10)){
  #   result = TRUE
  # } else {
  #   result = FALSE
  # }
  
  ## Shortest Version
  
  result = (hours >= 8) & (hours <= 10)
  
  return(result)
}

enough_sleep(11)

enough_sleep(11) == FALSE
enough_sleep(8) == TRUE
enough_sleep(8.5) == TRUE
enough_sleep(6) == FALSE

#Question 7
#Make a function to check whether a word is inside a sentence. Remember that it is case sensitive.

check_word <- function(word, sentence){
  #WRITE YOUR CODE HERE
  #hint: check grep function
  
  ## Longer version, thanks to Alex
  # if (grepl(word, sentence)){
  #   return(TRUE)
  # }
  # else{
  #   return(FALSE) 
  # }
  # 
  
  # "!" == NOT aka Negation
  
  result = (grepl(word, sentence))
  return(result)
}

check_word('WHO', 'Who let the dogs out?')

check_word('Martinelli', 'Martinelli is the best player in the world') == TRUE
check_word('WHO', 'Who let the dogs out?') == FALSE

#Question 8
#Make a function to check whether a number is a prime number or not.

own_is_prime <- function(number){
  #WRITE YOUR CODE HERE
  #don't use any built-in functions to check for prime numbers

  if(number > 1){
    
    if (number %in% c(2,3,5,7)){
      result = TRUE
    } else {
      if((number %% 2 == 0) | (number %% 3 == 0) | (number %% 5 == 0) | (number %% 7 == 0)){
        result = FALSE
      } else {
        result = TRUE
      }
    }

  } else{
    result == FALSE
  }
  
  return(result)
}

own_is_prime <- function(number){
  #WRITE YOUR CODE HERE
  #don't use any built-in functions to check for prime numbers
  
  if(number > 1){
    
    if (number %in% c(2,3,5,7)){
      result = TRUE
    }else{
      if(((number %% 2 == 0) | (number %% 3 == 0) | (number %% 5 == 0) | (number %% 7 == 0) )){
        result = FALSE
      }else {
        result = TRUE
      }
    } 
  }else{
    result = FALSE
  }
  
  return(result)
}

own_is_prime(3)

own_is_prime(7) == TRUE
own_is_prime(9719) == TRUE
own_is_prime(8370) == FALSE

#Question 9
#Make a function to count the prime numbers within a given range
#Hint: Use the function from Question 8

how_many_prime_between <- function(start,end){
  #WRITE YOUR CODE HERE
  #hint: use function from previous question to check prime numbers. construct a vector called "results" with all the prime numbers in the range.
  #hint: find a way to append new members to vector
  #hint: loop
  result = c()
  for(i in start:end){
    if(own_is_prime(i)){
      result=c(result, i)
    }
  }
  
  #Observe: the output of the function is the length of vector "results".
  return(length(result))
}

how_many_prime_between(1,10) == 4
how_many_prime_between(20,100) == 17
how_many_prime_between(1000,4000) == 685

#Question 10
#Make functions to print the sum of prime numbers between 2 numbers. Test it with any range that you want.

sum_prime <- function(start,end){
  #WRITE YOUR CODE HERE
  
  #Option 1:
  # result = c()
  # for(i in start:end){
  #   if(own_is_prime(i)){
  #     result=c(result, i)
  #   }
  # }
  # 
  # result = sum(result)
  
  #Option 2:
  result = 0
  for(i in start:end){
    if(own_is_prime(i)){
      result=result + i
    }
  }
  
  return(result)
}

sum_prime(1,10)
