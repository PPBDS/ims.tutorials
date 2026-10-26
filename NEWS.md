# ims.tutorials 0.0.0.9004

* Knowledge drops now show the book's own diagrams: 63 figures across 21 tutorials,
  such as the tree of variable types in Hello Data, the sampling pictures in Study
  Design, and the randomization and bootstrap schematics from Chapter 11 on. Plots
  of the chapters' data are never copied. Students build those.

* The tutorials copy the book's sentences as their own prose, without quotation
  marks, and credit the book once, in the last paragraph of each Summary. Each
  chapter's own summary paragraph is now plain text, not a block quote, with
  "chapter" changed to "tutorial", and trimmed where it described material the
  tutorial never covers (Chapters 4, 7, 18, and 19). The figures and sentences stay
  under the book's CC BY-SA 3.0 license, recorded in `inst/COPYRIGHTS`,
  `LICENSE.md`, and the DESCRIPTION `Copyright:` field.

* Help-page exercises (`?dataset`) are cut to one in each of the first three
  tutorials and none after. Caching exercises are gone from every tutorial: students
  learned caching earlier, and these tutorials teach statistics. Tutorials are about
  four exercises shorter as a result.

* Knowledge drops are shorter and plainer throughout. The Introduction no longer
  says "You may need to restart this tutorial after you do so," which learnr2 does
  not require.

* Fixed Summary answers that did not match the student's finished `analysis.qmd`,
  in several tutorials: a missing chunk, or a chunk the student had already
  replaced.

* New tests check that every image a tutorial references exists and is used, that
  every tutorial credits the book's license, and that no tutorial caches or has more
  help-page exercises than allowed.

* Tutorial directories no longer carry a chapter-number prefix (`hello-data`, not
  `01-hello-data`); each tutorial's place in the list is the `ordering:` field in its
  YAML header, read by learnr2 0.1.3. Chapter 7 is `linear-regression-single` and
  Chapter 8 `linear-regression-multiple`, keeping package paths under the 100-byte
  limit for portable tarballs.

* Code blocks follow learnr2's convention: commands are tagged with their language,
  expected output is tagged `{.output}`, and displayed chunks use `{verbatim}` blocks
  instead of `<pre><code>`.

* Each tutorial's Summary now quotes the chapter's own Summary paragraph, for the
  chapters that have one.

* Added six tutorials, the companions to Chapters 11 through 16: Hypothesis
  Testing with Randomization (`hypothesis-testing-randomization`), Confidence
  Intervals with Bootstrapping (`confidence-intervals-bootstrap`), Inference with
  Mathematical Models (`inference-mathematical-models`), Decision Errors
  (`decision-errors`), Applications: Foundations (`applications-foundations`), and
  Inference for a Single Proportion (`inference-for-a-single-proportion`).

* Added eleven tutorials, the companions to Chapters 17 through 27, so every
  chapter of the book now has one: Inference for Comparing Two Proportions, Inference
  for Two-Way Tables, Inference for a Single Mean, Inference for Comparing Two
  Independent Means, Inference for Comparing Paired Means, Inference for Comparing
  Many Means, Applications: Infer, Inference for Linear Regression with a Single
  Predictor, Inference for Linear Regression with Multiple Predictors, Inference for
  Logistic Regression, and Applications: Model and Infer.

* Added **cherryblossom** and **palmerpenguins** to `Suggests`, for `run17` in
  Chapter 19 and `penguins` in Chapter 25.

* Every tutorial now uses only its own chapter's data. Study Design replaces
  `malaria`, which Chapter 2 never uses, with the stent study it discusses, and
  Applications: Explore replaces `county` with Chapter 6's company expenses and its
  real 2010 Duke hiring counts. Chapters that give data only as counts ship them as
  CSVs in `inst/extdata/`, and `test-downloads.R` now checks every such file.

* Trimmed the knowledge drops that ran past two sentences.

* Added **infer** to `Suggests`, used by the simulation answer chunks from Chapter 11
  on.

# ims.tutorials 0.0.0.9002

* Tutorial directories drop their two-digit chapter prefix (`01-hello-data` is now
  `hello-data`); each tutorial's YAML header sets `learnr2: ordering:` to its chapter
  number instead, which fixes its place in the tutorial list.

* Added five tutorials, the companions to Chapters 6 through 10 of *Introduction to
  Modern Statistics*: Applications: Explore (`06-applications-explore`), Linear
  Regression with a Single Predictor (`07-linear-regression-single`),
  Linear Regression with Multiple Predictors
  (`08-linear-regression-multiple`), Logistic Regression
  (`09-logistic-regression`), and Applications: Model (`10-applications-model`).

* Applications: Explore has students download the chapter's Brexit poll from
  `inst/extdata/brexit.csv`. A new test checks that the URL works and that the
  tutorial's own copy matches it.

* Added **broom** and **scales** to `Suggests`, used by the new tutorials' answer
  chunks, and **httr2**, used by the download test.

* Every question now locks once submitted (`type = "reflection"`), and its text
  carries the whole instruction, such as running `show_file("analysis.qmd")` and
  pasting the result. This follows learnr2's "submit once, then locked" rule.
  Students must also submit each question before the next Continue button works.
  Only the minutes question stays editable.

* Removed the Histograms tutorial (`06-histograms`) merged in pull request #2. It
  duplicated Chapter 6's slot, which belongs to Applications: Explore, covered
  ground Exploring Numerical Data already covers, and used in-browser exercises
  and editable answers that this package does not. Its CLAUDE.md section, which
  said learnr2 has no `show_file()`, was dropped too. The tutorial remains in the
  git history.

* Renamed the package from `stat101.tutorials` to `ims.tutorials`, matching the
  GitHub repository.

* Added four tutorials, the companions to Chapters 2 through 5 of *Introduction to
  Modern Statistics*: Study Design (`02-study-design`), Applications: Data
  (`03-applications-data`), Exploring Categorical Data
  (`04-exploring-categorical-data`), and Exploring Numerical Data
  (`05-exploring-numerical-data`).

* Added **ggridges** and **maps** to `Suggests`, for the ridge plot in Exploring
  Categorical Data and the county intensity map in Exploring Numerical Data. The
  student devcontainer image already carries both, via `misc.tutorials`.

# stat101.tutorials 0.0.0.9000

* Initial package infrastructure, modeled on `vscode.tutorials` and built on learnr2.

* Added the first tutorial, Hello Data (`01-hello-data`), the companion to Chapter 1 of
  *Introduction to Modern Statistics*. It replaces an earlier Sampling example.
