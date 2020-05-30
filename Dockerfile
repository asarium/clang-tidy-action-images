FROM ubuntu:20.04

ARG version=9

RUN apt-get update -yy && apt-get upgrade -yy
RUN apt-get install -yy ca-certificates wget lsb-release gnupg2 software-properties-common
RUN cd / && wget https://apt.llvm.org/llvm.sh && chmod +x /llvm.sh && /llvm.sh ${version} && rm /llvm.sh
RUN apt-get install -yy clang-tidy-${version} && ln -s /usr/bin/clang-tidy-${version} /clang-tidy

ENTRYPOINT [ "/clang-tidy" ]
