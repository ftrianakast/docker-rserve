# It Builds an image to deploy a Rserve

# Dotcloud ubuntu image
FROM ubuntu:14.04
MAINTAINER Felipe Triana, ftrianakast@gmail.com

# Update
RUN apt-get update

# Install wget
RUN apt-get install -y wget

# Install latest R
RUN echo 'deb http://cran.rstudio.com/bin/linux/ubuntu trusty/' >> /etc/apt/sources.list
RUN gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E084DAB9
RUN gpg -a --export E084DAB9 | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y --force-yes r-base
RUN apt-get install -y r-base-dev
RUN R --version

# Important additional libraries
RUN apt-get install -y libcurl4-gnutls-dev
RUN apt-get install libxml2-dev
RUN apt-get install -y libmime-base64-urlsafe-perl libdigest-hmac-perl libdigest-sha-perl

# adding start R script: you can find the RScript on the docker github
ADD start.R start.R
ADD Rserv.conf /Rserv.conf
EXPOSE 6311
CMD Rscript start.R
