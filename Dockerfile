FROM land007/ubuntu-unity-novnc:latest

MAINTAINER Yiqiu Jia <yiqiujia@hotmail.com>

# Install Java.
RUN \
  apt-get update && \
  apt-get -o Dpkg::Options::="--force-overwrite" install -y openjdk-9-jdk

# Define commonly used JAVA_HOME variable
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV JAVA_HOME /usr/lib/jvm/java-1.9.0-openjdk-amd64
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-1.9.0-openjdk-amd64' >> /etc/profile && echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile && echo 'export PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
# dbeaver
RUN cd /tmp && wget https://download.dbeaver.com/community/21.1.0/dbeaver-ce_21.1.0_amd64.deb && dpkg -i dbeaver-ce_21.1.0_amd64.deb && rm -f dbeaver-ce_21.1.0_amd64.deb

#CMD ["/bin/bash", "/home/ubuntu/startup.sh"]
CMD /check.sh /home/ubuntu/.config/google-chrome/Default ; /etc/init.d/ssh start ; nohup /home/ubuntu/startup.sh > /tmp/startup.out 2>&1 & sleep 2 ; cat /home/ubuntu/password.txt ; bash

#sudo docker exec $CONTAINER_ID cat /home/ubuntu/password.txt
#docker pull land007/ubuntu-dbeaver-novnc ; docker rm -f ubuntu-dbeaver-novnc ; docker run -it -p 5901:5901 -p 6080:6080 -p 4040:4040 --privileged --name ubuntu-dbeaver-novnc land007/ubuntu-dbeaver-novnc:latest
