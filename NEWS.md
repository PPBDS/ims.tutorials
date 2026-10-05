# ims.tutorials 0.0.0.9002

* Renamed the package from `stat101.tutorials` to `ims.tutorials`, matching the
  GitHub repository.

* Added four tutorials, the companions to Chapters 2 through 5 of *Introduction to
  Modern Statistics*: Study Design (`02-study-design`), Applications: Data
  (`03-applications-data`), Exploring Categorical Data
  (`04-exploring-categorical-data`), and Exploring Numerical Data
  (`05-exploring-numerical-data`).

* Added "Histograms" (`01-histograms`): reading and building histograms with
  ggplot2, with browser-run webr exercises, gated knowledge drops, and a final
  submission of the student's own repository URL.

* Added **ggridges** and **maps** to `Suggests`, for the ridge plot in Exploring
  Categorical Data and the county intensity map in Exploring Numerical Data. The
  student devcontainer image needs both before these tutorials will render there.

# stat101.tutorials 0.0.0.9000

* Initial package infrastructure, modeled on `vscode.tutorials` and built on learnr2.

* Added the first tutorial, Hello Data (`01-hello-data`), the companion to Chapter 1 of
  *Introduction to Modern Statistics*. It replaces an earlier Sampling example.
