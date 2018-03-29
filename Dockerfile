FROM martinjohn/x-template

USER root

WORKDIR /src

ADD sqldeveloper-17.4.1.054.0712-no-jre.zip .

RUN apt-get update \
 && apt-get install -y \
            --no-install-recommends \
            openjdk-8-jdk \
            unzip \
 && rm -rf /var/lib/apt/lists/* \
 && unzip sqldeveloper-17.4.1.054.0712-no-jre.zip \
 && rm sqldeveloper-17.4.1.054.0712-no-jre.zip \
 && chown -R ubuntu:ubuntu /src \
 && echo "SetSkipJ2SDKCheck true" >> /src/sqldeveloper/sqldeveloper/bin/sqldeveloper.conf

USER $user

CMD "/src/sqldeveloper/sqldeveloper.sh"


