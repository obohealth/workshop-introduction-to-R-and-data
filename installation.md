# Installation and troubleshooting guide

The workshop *Introduction to R & Data* makes use of R and Rstudio. 
Also, the R package `tidyverse` is used. This document shows how to install 
R and RStudio. 

Most workshops on R programming make use of an RStudio server. With an RStudio
server, the participant logs in onto the website and gets a web based RStudio
IDE. We prefer a local installation of RStudio for our workshop. We hope that 
this removes a barrier for users to start working with R themselves.

# Installation

## Install R and RStudio on a personal laptop.

I.e. a laptop *with* administrator rights.

1) Install R from https://cran.rstudio.com/

2) Install Rstudio from https://www.rstudio.com/products/rstudio/download/#download

## Install R and RStudio on a Utrecht University laptop. 

1) Open **Software Center**
2) Install **R for Windows**

Installing R packages on a Utrecht University laptop can be hard. This is because R packages are installed on a so-called 'mounted' drive. This causes problems with the performance. Check the installation 

3) Open **RStudio**
4) Write the following line of code in your console: `.libPaths()`
5) Notify us at the beginning of the workshop if this line of code starts with `//`. 

# Troubleshooting

## Installing Tidyverse takes ages

Your packages are being installed on a mounted drive. 

Solution:

- Create a folder `R-packages` on a local drive. 
- Copy the location to that drive. For example: `C:/Users/User/R-packages`.
- Run the following line of code: `file.edit(file.path("~", ".Rprofile"))`
- Paste `.libPaths("C:/Users/User/R-packages")` in the editor and save the file.
- Restart your R session
- Click on `Packages`>`Install`. Is `Install to library` pointing to `C:/Users/User/R-packages`?

## Virusscanner blocks installation

Do you get issues like this: 

```
> install.packages("tibble")
Installing package into ‘C:/Users/UserName/R’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.4/tibble_1.4.2.zip'
Content type 'application/zip' length 172649 bytes (168 KB)
downloaded 168 KB

package ‘tibble’ successfully unpacked and MD5 sums checked
Warning in install.packages :
  unable to move temporary installation ‘C:\Users\UserName\R\file18b813387562\tibble’ to ‘C:\Users\UserName\R\tibble’
The downloaded binary packages are in
C:\Users\UserName\AppData\Local\Temp\RtmpYh5ogU\downloaded_packages
```

Check for the line **unable to move temporary installation**.

The solution can be found here: https://code.adonline.id.au/unable-to-move-temporary-installation-r/

```
> trace(utils:::unpackPkgZip, edit=TRUE)
Tracing function "unpackPkgZip" in package "utils (not-exported)"
[1] "unpackPkgZip"
```

Change 0.5 in line 140 to 2.5 and install the package again.


