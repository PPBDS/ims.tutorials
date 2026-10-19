redundant_adjectives.csv

The production data from the redundant-adjective study used in the case study
of Chapter 23 ("Applications: Infer") of Introduction to Modern Statistics (2e).
The file is a byte-for-byte copy of the book's own data file, renamed to drop
the spaces in its name:
https://raw.githubusercontent.com/OpenIntroStat/ims/main/data/ENGLISH-SPANISH%20PRODUCTION.csv

The authors made the data available on the Open Science Framework at
https://osf.io/9hw68/ (Production data). The study is

  Rubio-Fernandez, P., Mollica, F., and Jara-Ettinger, J. (2021). Speakers and
  listeners exploit word order for communicative efficiency: A cross-linguistic
  investigation. Journal of Experimental Psychology: General, 150(3), 583-594.
  https://doi.org/10.1037/xge0000963

880 rows, one per answer: 22 native English speakers and 22 native Spanish
speakers each described the circled item in 20 displays. Columns Language
(English or Spanish), Subject (1 to 22, numbered separately within each
language, so Subject 1 is two different people), Question (1 to 20), and
Color Response (1 if the speaker used a redundant color adjective, "the blue
triangle", 0 if not, "the triangle"). The file does not record the display
size; following the chapter's code (itself based on the authors' script
AnalyzeProduction.R), questions 1 to 10 used 4-item displays and questions 11
to 20 used 16-item displays. The file starts with a byte-order mark and uses
Windows line endings, as the original does.

An identical copy lives in inst/extdata/redundant_adjectives.csv, the stable
URL students download from.
