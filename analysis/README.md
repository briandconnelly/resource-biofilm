# Analysis Scripts

This directory contains analysis and plotting scripts.

## Software Requirements

- [R](https://www.r-project.org) (version 3.3.2 used)
- [cowplot](https://cran.r-project.org/package=cowplot) (version 0.7.0 used)
- [tidyverse](https://cran.r-project.org/package=tidyverse) (version 1.0.0 used)
- [ggplot2bdc](https://github.com/briandconnelly/ggplot2bdc/) (version 0.3.0 used)
- [png](https://cran.r-project.org/package=png) (version 0.1-7 used)
- [grid](https://cran.r-project.org/package=grid) (version 3.3.2 used)
- [scales](https://cran.r-project.org/package=scales) (version 0.4.1 used)

These packages can be installed using the following commands in R:

```r
install.packages(c("cowplot", "tidyverse", "png", "grid", "scales", "devtools"))
devtools::install_github("briandconnelly/ggplot2bdc")
```

Figures were cropped prior to publication with [pdfcrop](http://www.ctan.org/pkg/pdfcrop).


## License

These scripts are released under the [MIT license](https://opensource.org/licenses/MIT).
