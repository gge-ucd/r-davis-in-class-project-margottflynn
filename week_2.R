# creating a vector
number_vector = c(3, 6, 9)

# calling out a place in a vector
number_vector[2]

# re-ordering a vector
number_vector[c(3, 2, 1)]

# create a vector with strings (can be letters, symbols, numbers, all in quotations)
string_vector = c("dog", "cat", "mouse")

# create a data frame
#     lengths of vectors must match
data.frame(string_vector)

data.frame(column_1 = number_vector, column_2 = string_vector)

# create a list
test_list = list('first string entry into list')
test_list[1][[1]]

# add another item to the list
test_list = list('first string entry into list', 'second string entry')

# add data frame to list
test_df = data.frame(letters, letters)
test_list[[3]] <- test_df
test_list
test_list[2]
