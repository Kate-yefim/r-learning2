```R
install.packages("DBI")
library(DBI)
install.packages("RSQLite")
library(RSQLite)
```

```R
conn <- dbConnect(RSQLite::SQLite(),"C:/Users/Katya/Desktop/database.sqlite")
res1 <- dbSendQuery(conn, "SELECT Title, EventType FROM Papers WHERE EventType='Spotlight'
                   ORDER BY Title")

df1 <- dbFetch(res1, 10)
df1

                                                                                          Title
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding
2                                    Accelerated Mirror Descent in Continuous and Discrete Time
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games
4                                                                      Adaptive Online Learning
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization
6                                                 Attention-Based Models for Speech Recognition
7                                                       Automatic Variational Inference in Stan
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception
   EventType
1  Spotlight
2  Spotlight
3  Spotlight
4  Spotlight
5  Spotlight
6  Spotlight
7  Spotlight
8  Spotlight
9  Spotlight
10 Spotlight

dbClearResult(res1)
dbDisconnect(conn)
```

```R
conn <- dbConnect(RSQLite::SQLite(),"C:/Users/Katya/Desktop/database.sqlite")

res2 <- dbSendQuery(conn, "SELECT Name, Title 
                  FROM Authors as a inner join PaperAuthors as pa on a.id= pa.Authorid
                  inner join Papers as p on p.id=pa.Paperid
                    
                  WHERE Name='Josh Tenenbaum'
                   ORDER BY Title")

df2 <- dbFetch(res2, 10)

df2

   Name
1 Josh Tenenbaum
2 Josh Tenenbaum
3 Josh Tenenbaum
4 Josh Tenenbaum
                                                                                              Title
1                                                       Deep Convolutional Inverse Graphics Network
2 Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning
3                                                Softstar: Heuristic-Guided Probabilistic Inference
4                                                        Unsupervised Learning by Program Synthesis

dbClearResult(res2)
dbDisconnect(conn)
```

```R
conn <- dbConnect(RSQLite::SQLite(),"C:/Users/Katya/Desktop/database.sqlite")

res3 <- dbSendQuery(conn, "SELECT Title FROM Papers WHERE Title LIKE '%statistical%' 
                    ORDER BY Title")
df3 <- dbFetch(res3, 10)

df3

                                                                                 Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective

dbClearResult(res3)
dbDisconnect(conn)
```

```R
conn <- dbConnect(RSQLite::SQLite(),"C:/Users/Katya/Desktop/database.sqlite")

res4 <- dbSendQuery(conn, "SELECT Name, count(Title) as NumPapers
                            FROM Authors as a inner join PaperAuthors as pa on a.id=pa.Authorid
                            inner join Papers as p on p.id=pa.Paperid
                            GROUP by Name ORDER BY NumPapers DESC")
df4 <- dbFetch(res4, 10)

df4

                   Name NumPapers
1  Pradeep K. Ravikumar         7
2        Lawrence Carin         6
3               Han Liu         6
4     Zoubin Ghahramani         5
5               Le Song         5
6   Inderjit S. Dhillon         5
7          Zhaoran Wang         4
8         Yoshua Bengio         4
9  Simon Lacoste-Julien         4
10          Shie Mannor         4

dbClearResult(res4)
dbDisconnect(conn)
```


