FROM dealii/full-deps:fulldepscandi

MAINTAINER rene.gassmoeller@mailbox.org

# get deal.II repo 
ARG VER=master
ARG BUILD_TYPE=Debug

RUN git clone https://github.com/dealii/dealii.git dealii-$VER-src && \
    cd dealii-$VER-src && \
    git checkout $VER && \
    mkdir build && cd build && \
    cmake -DDEAL_II_COMPONENT_EXAMPLES=OFF \
          -DCMAKE_INSTALL_PREFIX=~/dealii-$VER \
          -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
	  -GNinja \
          ../ && \
    ninja install && \
    ninja test && \
    cp summary.log ~/dealii-$VER/summary.log && \
    cd .. && rm -rf build .git
ENV DEAL_II_DIR ~/dealii-$VER 

USER root
ADD script.sh script.sh

RUN chown $USER:$USER *.sh
USER $USER

RUN chmod u+x *.sh
CMD ./script.sh
