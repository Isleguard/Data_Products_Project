Data Products Presentation
========================================================
author: Gary Baggett
date:   November 16, 2015

Introduction to Central Limit Theorm Example Program
========================================================

The Central Limit Theorm basically states that the sampling distribution means approaches a normal distribution as the sampling size gets larger.  This is useful when;

- This product is a portable, network/cloud based example.
- It combines a Gaussian overlay with slider based sample group size.
- It shows the difference between the group variances getting smaller as the group size gets larger.

Central Limit Therom Sample Code
========================================================




```r
set.seed(08162015) # reproducibility
nosim <- 1000;nbin<-20 # default number
###############################
cfunc <- function(x, n) 2*sqrt(n)*(mean(x) - 0.5)
###############################
# Gaussian View
nobin<-50
data <- data.frame(
    x = apply(matrix(sample(0:1, (nosim*nbin), replace=TRUE), nosim), 1, cfunc, nbin),
    size = factor(rep(nbin, rep(nosim, 1))))
```

Note: This modified code is originally from the Coursera class: Statistical Inference.


Sample Plot of Gaussian data samples
========================================================

![plot of chunk unnamed-chunk-4](Data_Products_Presentation-figure/unnamed-chunk-4-1.png) 


Conclusions about the Web-based product
========================================================
* The CLT is shown to be a valid Statistical Theorm
* The Variance is shown to get smaller and approach the true variance.
* The product is a single web-based product therefore
    - It can go anywhere
    - It can be used anytime
    - It demonstates a valuable Statistical theory
