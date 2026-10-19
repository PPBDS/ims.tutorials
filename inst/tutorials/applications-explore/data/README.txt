brexit.csv

Results of a YouGov poll of 1,643 adults in Great Britain, 2-3 September 2019,
asked "How well or badly do you think the government are doing at handling
Britain's exit from the European Union?", by region. The counts are copied from
the code of Chapter 6 of Introduction to Modern Statistics (2e), which builds
the same table by hand:
https://github.com/OpenIntroStat/ims/blob/main/explore-applications.qmd

One row per region and opinion; columns region, opinion, n. The chapter's text
says 1,639 respondents, but its own counts sum to 1,643.

An identical copy lives in inst/extdata/brexit.csv, the stable URL students
download from; tests/testthat/test-downloads.R checks the two match.

expenses.csv

The costs of a manufacturing company, as percents of the total, in five
categories, from the "Keep it simple" section of Chapter 6. The numbers are
copied from the chapter's code, which types them in as proportions (0.03, 0.22,
0.31, 0.27, 0.17); we store them as percents. Columns category, percent.

An identical copy lives in inst/extdata/expenses.csv, the stable URL students
download from.

duke_hires_2010.csv

The number of people Duke University hired in each month of 2010, from the
"Tell a story" section of Chapter 6. The numbers are the 2010 column of the
book's own data file:
https://raw.githubusercontent.com/OpenIntroStat/ims/main/data/duke-hires.csv
That file's columns for 2011 to 2015 are empty; the chapter's code fills them
with simulated numbers, which we do not use. Columns month (1 to 12), hires.

An identical copy lives in inst/extdata/duke_hires_2010.csv, the stable URL
students download from.
