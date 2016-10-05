
FROM  java:8

ENV VERSION 0.1

RUN echo '***** Update packages *****' \
    && apt-get -y update

RUN echo '***** Install packages REQUIRED for creating this image *****' \
    && apt-get -y install apt-utils curl makepasswd gcc make

RUN echo '***** Install packages required by YesWorkflow and noWorkflow *****' \
    && apt-get -y install graphviz python3 python3-pip swi-prolog expect

RUN echo '***** Install packages NOT required to run yesworkflow *****' \
    && apt-get -y install sudo man less file tree vim emacs

RUN echo '***** Install noWorkflow *****' \
   && pip3 install noworkflow[all]

RUN echo '***** Create the yw user *****' \
    && useradd yw --gid sudo \
                 --shell /bin/bash \
                 --create-home \
    && echo "yw ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/yw \
    && chmod 0440 /etc/sudoers.d/yw

# perform remaining commands as the user and within the user's home directory
ENV HOME /home/yw
USER  yw
WORKDIR $HOME

# specify name, version, and location of YW jar to be used
ENV YW_MAVEN_URL http://repo1.maven.org/maven2/org/yesworkflow
ENV YW_VERSION 0.2.1
ENV YW_JAR_IN_MAVEN yesworkflow-$YW_VERSION-jar-with-dependencies.jar
ENV YW_JAR $HOME/bin/yesworkflow-$YW_VERSION.jar

RUN echo '***** Download yw-prototypes executable jar, expand examples, and create alias *****' \
    && mkdir $HOME/bin  \
    && echo $YW_MAVEN_URL/yesworkflow/$YW_VERSION/$YW_JAR_IN_MAVEN \
    && curl -o $YW_JAR $YW_MAVEN_URL/yesworkflow/$YW_VERSION/$YW_JAR_IN_MAVEN \
    && echo "alias yw='java -jar $YW_JAR'"  >> $HOME/.bash_aliases

RUN echo '***** Download and build XSB 3.6 *****'  \
    && svn checkout svn://svn.code.sf.net/p/xsb/src/trunk/XSB xsb-3.6 \
    && cd xsb-3.6/build \
    && ./configure \
    && ./makexsb \
    && cd $HOME \
    && echo 'export PATH="/home/yw/xsb-3.6/bin:$PATH"' >> .bashrc

RUN echo '***** Clone provenance-demo *****' \
   && git clone https://github.com/idaks/dataone-ahm-2016-poster.git \
   && export PATH=/home/yw/xsb-3.6/bin:$PATH \
   && cd dataone-ahm-2016-poster/ \



# start an interactive bash login shell when the image is run
CMD  /bin/bash -il
