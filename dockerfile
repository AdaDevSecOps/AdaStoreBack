#Base image
FROM gliderlabs/alpine:3.6

#update the image
RUN apt-get update

#install python
RUN apt install -y python3.8.7
RUN apt install -y python3-pip

#install robotframework and seleniumlibrary
RUN pip3 install robotframework
RUN pip3 install robotframework-selenium2library

#The followig are needed for Chrome and Chromedriver installation
RUN apt-get install -y xvfb 
RUN apt-get install -y zip 
RUN apt-get install -y wget 
RUN apt-get install ca-certificates 
RUN apt-get install -y libnss3-dev libasound2 libxss1 libappindicator3-1 libindicator7 gconf-service libgconf-2-4 libpango1.0-0 xdg-utils fonts-liberation
RUN wget -N https://chromedriver.storage.googleapis.com/index.html?path=105.0.5195.52/chromedriver_win32.zip
RUN unzip chromedriver_win32.zip
RUN chmod +x chromedriver
RUN cp /chromedriver /usr/local/bin
RUN rm chromedriver_win32.zip

#Robot Specific
RUN mkdir /robot
RUN mkdir /results
ENTRYPOINT ["robot"]
#
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

CMD ["run.sh"]
#