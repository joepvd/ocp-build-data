# This is a base image for supporting a python app that runs on it.
# The same Dockerfile should serve for most versions of python.
FROM python
# rhscl/python-36-rhel7 from rh-python36-container(https://brewweb.engineering.redhat.com/brew/packageinfo?packageID=67385)
# ubi8/python-36 from python-36-container(https://brewweb.engineering.redhat.com/brew/packageinfo?packageID=69964)

USER root
RUN echo 'skip_missing_names_on_install=0' >> /etc/yum.conf \
 && yum update -y  \
 && yum clean all  \
 && sed -i -e 's/rhel-8-for-x86_64-baseos-rpms/rhel-8-for-x86_64-baseos-eus-rpms__8_DOT_2/g' -e 's/rhel-8-for-x86_64-appstream-rpms/rhel-8-for-x86_64-appstream-eus-rpms__8_DOT_2/' /root/buildinfo/content_manifests/*.json
USER 1001
