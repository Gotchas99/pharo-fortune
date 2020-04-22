# pharo-fortune
FROM gotchas/pharo-teapot7
MAINTAINER Christer Assmundsson
EXPOSE 80

# Load prereqs from Github
ADD ./*.st ./scripts/
RUN ./pharo-run st --save --quit scripts/load_prereqs.st

# RUN ./pharo-run config http://www.smalltalkhub.com/mc/Gotchas/Jobb/main ConfigurationOfPDM --install=development

#temp:
CMD ["./pharo-run","--no-quit"]

# RUN chmod -R g+w Pharo* pharo* .config
