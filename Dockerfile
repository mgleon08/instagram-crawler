FROM ruby:2.5.1

MAINTAINER leonji mgleon08@gmail.com

RUN gem install instagram-crawler

ENTRYPOINT ["instagram-crawler"]
