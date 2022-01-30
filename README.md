# STAT433
homework


## Problem fixed:
```{r}
read.csv(url("https://covid19.who.int/WHO-COVID-19-global-data.csv"))  #working
```

## <code>read.csv</code> versus <code>read_csv</code>
<code>read.csv</code> imports data as a dataframe, which is an old structure, and <code>read_csv</code> imports data as a tibble.

Not working
```{r}
read.csv('https://covid19.who.int/who-data/vaccination-data.csv')
```

Working
```{r}
library(readr)
read_csv('https://covid19.who.int/who-data/vaccination-data.csv')
```
