FROM centos:centos7
MAINTAINER ptim007@yahoo.com
RUN yum -y install rpm-build redhat-rpm-config make gcc git vi tar unzip rpmlint && yum clean all
RUN useradd rpmbuild -u 5002 -g users -p rpmbuild
# here I add everything I need to make the rpm: sources, the build script, etc...all of that was checkout from git by jenkins.
COPY build/build_rpm.bash /home/rpmbuild/build_rpm.bash
COPY build/mypackage.spec /home/rpmbuild/mypackage.spec
COPY version.txt /home/rpmbuild/versions.txt
COPY src /home/rpmbuild/src
USER rpmbuild
ENV HOME /home/rpmbuild
WORKDIR /home/rpmbuild
RUN mkdir -p /home/rpmbuild/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
RUN echo '%_topdir %{getenv:HOME}/rpmbuild' > /home/rpmbuild/.rpmmacros
