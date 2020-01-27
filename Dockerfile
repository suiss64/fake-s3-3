FROM ubuntu:18.04
#FROM debian:jessie
#MAINTAINER Larry Howard <larry.howard@vanderbilt.edu>

#ENV DEBIAN_FRONTEND noninteractive
USER 0
# install Ruby
RUN apt-get update && apt-get install -yqq ruby rubygems-integration

# install fake-s3
RUN gem install fakes3 -v 0.2.5

# run fake-s3
RUN mkdir -p /fakes3_root
ENTRYPOINT ["/usr/local/bin/fakes3"]
CMD ["-r",  "/fakes3_root", "-p",  "4569", "--license", "2809169551"]
EXPOSE 4569
