```R
install.packages("BiocManager")
BiocManager::install("rhdf5")
library("rhdf5")
```
```R
link_to_file <-"https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5"
path_file <- 'C:/Users/Katya/Desktop/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5'
download.file(link_to_file, path_file, mode="wb")

h5ls(path_file)

                 group            name       otype  dclass      dim
0                    /            meta   H5I_GROUP                 
1                /meta     Description H5I_DATASET  STRING    ( 0 )
2                /meta  DescriptionURL H5I_DATASET  STRING    ( 0 )
3                /meta        Detector H5I_DATASET  STRING    ( 0 )
4                /meta        Duration H5I_DATASET INTEGER    ( 0 )
5                /meta        GPSstart H5I_DATASET INTEGER    ( 0 )
6                /meta     Observatory H5I_DATASET  STRING    ( 0 )
7                /meta            Type H5I_DATASET  STRING    ( 0 )
8                /meta        UTCstart H5I_DATASET  STRING    ( 0 )
9                    /         quality   H5I_GROUP                 
10            /quality          detail   H5I_GROUP                 
11            /quality      injections   H5I_GROUP                 
12 /quality/injections InjDescriptions H5I_DATASET  STRING        5
13 /quality/injections   InjShortnames H5I_DATASET  STRING        5
14 /quality/injections         Injmask H5I_DATASET INTEGER     4096
15            /quality          simple   H5I_GROUP                 
16     /quality/simple  DQDescriptions H5I_DATASET  STRING        7
17     /quality/simple    DQShortnames H5I_DATASET  STRING        7
18     /quality/simple          DQmask H5I_DATASET INTEGER     4096
19                   /          strain   H5I_GROUP                 
20             /strain          Strain H5I_DATASET   FLOAT 16777216
```

```R
strain <- h5read(path_file, "strain/Strain")
strain
[1] -2.391646e-18 -2.411660e-18 -2.427382e-18 -2.426351e-18 -2.427996e-18 -2.446291e-18
   [7] -2.462962e-18 -2.463456e-18 -2.464039e-18 -2.481933e-18 -2.499762e-18 -2.499653e-18
  [13] -2.499740e-18 -2.514827e-18 -2.534504e-18 -2.539017e-18 -2.534552e-18 -2.547276e-18
  [19] -2.567941e-18 -2.573345e-18 -2.569082e-18 -2.580038e-18 -2.601175e-18 -2.606781e-18
  [25] -2.602693e-18 -2.610871e-18 -2.633490e-18 -2.643470e-18 -2.636836e-18 -2.644074e-18
.....
.....
[979] -3.676057e-18 -3.699009e-18 -3.739058e-18 -3.737266e-18 -3.722160e-18 -3.741761e-18
 [985] -3.775167e-18 -3.786966e-18 -3.770152e-18 -3.777503e-18 -3.824569e-18 -3.835306e-18
 [991] -3.814705e-18 -3.825354e-18 -3.860983e-18 -3.880884e-18 -3.864703e-18 -3.860612e-18
 [997] -3.902815e-18 -3.925970e-18 -3.905986e-18 -3.907975e-18
 [ reached getOption("max.print") -- omitted 16776216 entries ]
 ```
 
 ```R
st <- h5readAttributes(path_file, "strain/Strain")$Xspacing
st

[1] 0.0002441406
```
 ```R
GPSstart <- h5read(path_file, "meta/GPSstart")
GPSstart
[1] 1187006834

Duration <-  h5read(path_file, "meta/Duration")
Duration

[1] 4096

gpsEnd <- GPSstart+Duration
gpsEnd 

[1] 1187010930
 ```
 

 ```R
myTime <- seq(GPSstart, gpsEnd, st)
myTime
   [1] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
   [9] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [17] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [25] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [33] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [41] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834


[961] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [969] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [977] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [985] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [993] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [ reached getOption("max.print") -- omitted 16776217 entries ]
 
tail(myTime)
[1] 1187010930 1187010930 1187010930 1187010930 1187010930 1187010930
 ```
 ```R
numSamples <-1000000

plot(myTime[0:numSamples],
     strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")
 ```
![Plot](https://github.com/Kate-yefim/r-learning2/blob/main/Screenshot_1.png)



