import pandas as pd
import sqlite3

con = sqlite3.connect(snakemake.input[0])
df = pd.read_sql("select * from mtcars", con)

import seaborn as sns
import matplotlib.pyplot as plt

g = sns.FacetGrid(df, col="cyl")
g.map(sns.scatterplot,"wt","mpg")
plt.savefig(snakemake.output[0])

con.close()

