ARG jenkins_tag=latest
FROM jenkins/jenkins:${jenkins_tag}

# To run apt
USER root

# Install required packages
RUN apt-get update \
 && apt-get install -y curl gnupg apt-transport-https genisoimage xorrisofs \
 && rm -rf /var/lib/apt/lists/*

# Install PowerShell from Microsoft’s repository
# The jenkins:lts image is based on Debian 9 (Stretch)
# For information about how to install PowerShell in Debian 9, see the following link:
# https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6#debian-9
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
 #&& wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
 #&& dpkg -i packages-microsoft-prod.deb \
 ###
 #&& sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' \
 #&& apt-get update \
 #&& apt-get install -y aspnetcore-runtime-3.1 \
 && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb \
 # Register the Microsoft repository GPG keys
 && dpkg -i packages-microsoft-prod.deb \
 && apt-get update \
 && apt-get install -y powershell aspnetcore-runtime-3.1 \

 && rm -rf /var/lib/apt/lists/*

# Drop back to the jenkins user
USER jenkins
