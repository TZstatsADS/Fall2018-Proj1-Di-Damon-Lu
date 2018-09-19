# Data Story: What Makes People Happy
#### Di Lu, dl3152

![image](figs/happy.jpg)

### Introduction

Happiness is tricky. Different people use different ways to express their happiness. Different people feel different kinds of happiness. So, what are the general things that make people happy? Does happiness related to people's gender, age, or even nationality?

This repo works on [HappyDB](https://rit-public.github.io/HappyDB/) dataset, "a corpus of 100,000+ crowd-sourced happy moments". To begin with, one can either view the [final result](doc/Data_Story.html) directly, or knit [the raw Rmd file](doc/Data_Story.Rmd) himself.

### prerequisites

The project is built on `R`. Also it needs [`Rstudio`](https://www.rstudio.com/) to knit the `Rmd` files.

Required packages are:
```
  1. tm
  2. tidyverse
  3. topicmodels
  4. DT
  5. ggplot2
```
 
To run the [`Preprocessing.Rmd`](doc/Preprocessing.Rmd), one also needs `tidytext`.

### Project Structure

The repo is orgarnized as follows.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
