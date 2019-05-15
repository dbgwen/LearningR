mydf <- read.csv(path2csv, stringsAsFactors = FALSE)
cran <- tbl_df(mydf)
rm("mydf") ##remove dataframe from workspace
select(cran, ip_id, package, country) ##select columns
select(cran, r_arch:country) ##select columns from r_arch to country
select(cran, -time) ##select columns except time
select(cran, -(X:size))
filter(cran, package =="swirl") ##select all rows with swirl variable
filter(cran, r_version == "3.1.1", country == "US") ##return rows that meet these specs
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country== "IN")
filter(cran, !is.na(r_version)) ##return rows without missing data
cran2 <- select(cran, size:ip_id) ## take a subset of dataset
arrange(cran2, desc(ip_id)) ## arrange in descending order
arrange(cran2, ip_id) ## arrange in ascending order
arrange(cran2, package, ip_id) ## arrange data by multiple variables
arrange(cran2, country, desc(r_version), ip_id)
mutate(cran3, size_mb = size / 2^20) ## create new variable with old variable
summarize(cran, avg_bytes = mean(size)) ##collapses dataset to a single row
                                        ## summarize can give you a value for each group in the dataset

## Grouping Data
group_by()
cran <- tbl_df(mydf)
by_package <- group_by(cran, package)
summarize(by_package, mean(size)) ##mean for each group

pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

## The 'count' column, created with n(), contains the total number of rows (i.e.
## downloads) for each package. The 'unique' column, created with n_distinct(ip_id),
## gives the total number of unique downloads for each package, as measured by the
## number of distinct ip_id's. The 'countries' column, created with
## n_distinct(country), provides the number of countries in which each package was
## downloaded. And finally, the 'avg_bytes' column, created with mean(size), contains
## the mean download size (in bytes) for each package.

quantile(pack_sum$count, probs =0.99)
top_counts <- filter(pack_sum, count > 679)
top_counts_sorted <- arrange(top_counts, desc(count))
quantile(pack_sum$unique, probs = 0.99)
top_unique <- filter(pack_sum, unique > 465)
top_unique_sorted <- arrange(top_unique, desc(unique))

## chaining or piping: Chaining allows you to string together multiple function 
## calls in a way that is compact and readable

by_package <- group_by(cran, package)
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

# Here's the new bit, but using the same approach we've
# been using this whole time.

top_countries <- filter(pack_sum, countries > 60)
result1 <- arrange(top_countries, desc(countries), avg_bytes)

# Print the results to the console.
print(result1)

# confusing, you're absolutely right!

result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)

# Read the code below, but don't change anything. As
# you read it, you can pronounce the %>% operator as
# the word 'then'.
#
# Type submit() when you think you understand
# everything here.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)


cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  # Your call to arrange() goes here
  arrange(desc(size_mb))





