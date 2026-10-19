Data for the "Inference for a Single Proportion" tutorial. Chapter 16 of
Introduction to Modern Statistics (2e) works only from published counts, so
each file rebuilds those counts as one row per case:
https://openintrostat.github.io/ims/inference-one-prop.html

medical_consultant.csv
  62 liver donor surgeries facilitated by one medical consultant, 3 of which
  had complications (Chapter 16, "Bootstrap test for a proportion"; first
  introduced in Chapter 12's medical consultant case study). Columns: client
  (1-62), complication (yes/no). Which clients had the complications is not
  known; the order is arbitrary. The same file serves the Chapter 12 tutorial.

payday_regulation.csv
  A simple random sample of 826 payday loan borrowers, 70% of whom supported
  new regulations on payday lenders (Chapter 16, "Variability of the sample
  proportion"). 70% of 826 is 578.2, so the file has 578 yes and 248 no, the
  counts the chapter itself uses. Columns: borrower (1-826), support (yes/no).

payday_credit_check.csv
  A random sample of 826 borrowers, 51% of whom supported a regulation that
  would require lenders to pull their credit report and evaluate their debt
  payments (Chapter 16, "Hypothesis test for a proportion"). 51% of 826 is
  421.26, so the file has 421 yes and 405 no (421 / 826 = 0.5097). Columns:
  borrower (1-826), support (yes/no). The chapter does not say whether these
  are the same 826 borrowers as payday_regulation.csv, so the two files are
  kept separate and not linked by borrower.

Identical copies live in inst/extdata/, the stable URLs students download from:
https://raw.githubusercontent.com/PPBDS/ims.tutorials/main/inst/extdata/<file>
