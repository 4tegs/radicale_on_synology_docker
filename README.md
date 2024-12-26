# radicale_on_synology_docker
Install and run radicale in Synology using a Docker container.

## What is radicicale?
Radicale is a very lightweight but powerful CalDAV (calendars, to-do lists) and CardDAV (contacts) server you can host yourself.

Here's the official homepage: <a href="https://radicale.org/" title="radicale.org" target="_blank" rel="nofollow">https://radicale.org</a>

## Purpose of this Github repository
* define the prereqisites
* setting up your environment in your Synology
* explain how to build your own docker container
* explain how to use the docker container
* run radicale

## Prerequisites

* A Synology NAS of the <a href="https://www.synology.com/en-us/products?product_line=ds_plus" title="Synology Plus Series" target="_blank" rel="nofollow">Plus Series</a>, as those are enabled for virtualizing environments with their more powerful central processing units (CPUs). These are easily identified by the name DSxxxx+.
* Some understanding of DNS, Network, Ports and Proxies to make sense of and secure things.
* Understanding of IP handling and Port forwarding for your Router.
* Understanding of the Synology Disk Station (DS) and the Disk Station Manager (DSM).
* Having Administrator Account access for DSM.
* A registered Domain which forwards (e.g. via DynDNS) to your Router/Server (Synology DS) and/or a Subdomain with according CNAME entry.
* On your Synology Docker is installed and running.
* SSH can be enabled and you know how to operate on command line with rrot access.

## Setting up the development area

To start, one needs a development area on the Synology. It is used to keep all needed files together that are needed to ramp up a Docker Image and in further steps the container and its necessary configuration files. This step is needed, regardless if you want to build your own image or if you simply publish the container.

* Use Synology’s desktop: **Control Panel-> Shared Folder-> Create**<br/>
* For later examples I called mine **dock_dev**.<br/>
* In dock_dev you create a folder called **radicale**.<br/>
* So the full path should sound **/volume1/dock_dev/radicale**<br/>
* copy the files provided by this repository to the new development folder on your Synology.
* Make sure you are able to SSH into your Synology. I will not explain how to do that. If you need help, ask Google.

The next step depends on what you want to achieve. If you simply want to use the given DockerHub Image and deploy your container skip the next steps and move to [Deploy the Docker Container](#deploy-the-docker-container-in-your-synology)

## Building the Docker image

This section covers how to develop your own radicale image an push it to DockerHub. If you aren’t going to develop an own container [>jump this section<](#deploy-the-docker-container-in-your-synology)!
* SSH into Synology
* sudo -i
* cd to your development area in your Synology.
Based on previous steps, you should find a file named **Dockerfile**.<br/>
In this example:
    * cd /volume1/dock_dev/radicale
    
* To build the image run command: **docker build -t 4tegs/radicale .** <br/>
Don't forget the "." at the end of the line!
* You should name your container based on your DockerHub ID ( 4tegs) and project name (radicale). If you don’t do so, you need to „re“tag you image later for the DockerHub push.
Have a look at Synology -> Docker, you should find the image there.
![docker image](images/01_radicale.jpg)

### Push image to DockerHub
* Command: **docker login** (provide your accounts credentials)
* **docker push 4tegs/radicale:latest**

## Deploy the Docker Container in your Synology
To deploy a Radical WebDav/CalDav Service throug a Docker container on Synology follow the next steps. The listed [prereqisites](#prereqisites) must be fullfilled.

### The Data Area Folder
When Docker was installed, Synology has set up a shared folder /volume1/docker. This folder can be used to host your containers configuration files and production data.

Let’s set up the radicale folder space for our container.

* SSH into Synology
* sudo -i
* command: **mkdir /volume1/docker/radicale**

### Install configuration files
From this repository movere the follow 4 files to **/volume1/docker/radicale**:

![docker image](images/add_docker_image_11.jpg)
