# It Builds an image to deploy a Rserve

# Dotcloud ubuntu image
FROM ubuntu:13.10
MAINTAINER Felipe Triana, ftrianakast@gmail.com

# Update
RUN apt-get update

# Install wget
RUN apt-get install -y wget

# Install latest R
RUN echo 'deb http://www.laqee.unal.edu.co/CRAN/bin/linux/ubuntu saucy/' >> /etc/apt/sources.list
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