# Jenkins + PowerShell  + .NET Core Dockerfile

To make it easy to start PowerShell scripting in Jenkins Pipeline.

Based on matt9ucci's Jenkin's + PowerShell docker image, which itself is based on:
Based on [Jenkins official image](https://hub.docker.com/r/jenkins/jenkins/).
Installed [PowerShell](https://github.com/PowerShell/PowerShell) from Microsoft’s repository.
Installed .NET Core

## Background

On July 2017, Microsoft PowerShell support for Jenkins Pipeline was [announced](https://jenkins.io/blog/2017/07/26/powershell-pipeline/).
However, Jenkins official image does not contain PowerShell.

## Usage

### Build
LTS
```
docker build --tag jenkins-powershell:lts .
```
Specific Version
```
docker build --tag jenkins-powershell:2.73.2 --build-arg jenkins_tag=2.73.2 .
```

### Run
LTS, ephemeral
```
docker run -d -p 8080:8080 -p 50000:50000 --rm matt9ucci/jenkins-powershell:lts
```

LTS with volume
```
docker run -d -p 8080:8080 -p 50000:50000 --name jenkins-ps -v jenkins_home:/var/jenkins_home matt9ucci/jenkins-powershell:lts
```

Jenkins version
```
docker run --rm matt9ucci/jenkins-powershell:lts --version
```

### Take advantage of the features of base imagae

All the features available in the Jenkins official image is also available in this image.

The following example runs an LTS ephemeral container passing `JAVA_OPTS` for skipping the initial setup wizard:
```
docker run -d -p 8080:8080 -p 50000:50000 --rm --env JAVA_OPTS=-Djenkins.install.runSetupWizard=false matt9ucci/jenkins-powershell:lts
```

For more information, see the following documents:
* [Official Jenkins Docker image README](https://github.com/jenkinsci/docker/blob/master/README.md)
* [Jenkins Features Controlled with System Properties](https://www.jenkins.io/doc/book/managing/system-properties/)
