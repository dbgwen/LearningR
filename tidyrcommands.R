library(tidyr)

## Tidy data is formatted in a standard way that facilitates exploration and analysis
## and works seamlessly with other tidy data tools. Specifically, tidy data satisfies
## three conditions:
    ## 1) Each variable forms a column
    ## 2) Each observation forms a row
    ## 3) Each type of observational unit forms a table

gather(students, sex, count, -grade) ## tidy data into three columns

res <- gather(students2, sex_class, count, -grade)
separate(data=res, col=sex_class, into = c("sex", "class"))

# The main idea is that the result to the left of %>%
# takes the place of the first argument of the function to
# the right. Therefore, you OMIT THE FIRST ARGUMENT to each
# function.
students2 %>%
  gather(sex_class, count, -grade) %>%
  separate(sex_class, into = c("sex", "class")) %>%
  print

# This script builds on the previous one by appending
# a call to spread(), which will allow us to turn the
# values of the test column, midterm and final, into
# column headers (i.e. variables).
students3 %>%
  gather( class,grade,class1:class5, na.rm= TRUE) %>%
  print

# We want the values in the class columns to be
# 1, 2, ..., 5 and not class1, class2, ..., class5.
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class=parse_number(class)) %>%
  print

# Complete the chained command below so that we are
# selecting the id, name, and sex column from students4
# and storing the result in student_info.
#
student_info <- students4 %>%
  select(id,name,sex ) %>%
  print

## merge two tables
## Create new column for both tables
passed <- passed %>% mutate( status = "passed")
failed <- failed %>% mutate( status = "failed")
bind_rows(passed, failed)


# 1. select() all columns that do NOT contain the word "total",
# since if we have the male and female data, we can always
# recreate the total count in a separate column, if we want it.
# Hint: Use the contains() function, which you'll
# find detailed in 'Special functions' section of ?select.
#
# 2. gather() all columns EXCEPT score_range, using
# key = part_sex and value = count.
#
# 3. separate() part_sex into two separate variables (columns),
# called "part" and "sex", respectively. You may need to check
# the 'Examples' section of ?separate to remember how the 'into'
# argument should be phrased.
#
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, value = count, -score_range) %>%
  separate(part_sex, c("part","sex" ))> %>%
  print