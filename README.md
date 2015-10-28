# IReS-Platform
Intelligent, Multi-Engine Resource Scheduler for Big
Data Analytics Workflows

<h4>Links</h4>
<ul>
<li>IReS Paper: http://www.cslab.ntua.gr/~dtsouma/index_files/modde764.pdf </li>
<li>ASAP Project Official Page: http://www.asap-fp7.eu/</li>
</ul>
<h4>Using IReS-Platform</h4>
Usage of IRes-Platform requires 3 steps

<ol>
<li><bold>Clone</bold> IReS-Platform to the server. For a quick reference of how to use git, click here <a href="https://rogerdudler.github.io/git-guide/" target="_blank">Git - the simple guide</a>
<li><bold>Update</bold> configuration files appropriately.</li>
<li><bold>Build</bold> IReS-Platform project using maven. A tutorial about maven can be found here <a href="https://maven.apache.org/guides/getting-started/" target="_blank">Maven Getting Started Guide</a>.</li>
</ol>

<h5>Clone</h5>
Open a terminal (Linux) or a cmd (Windows) and navigate to a desired directory (create it if does not exist) where IReS-Platform files will be cloned e.g. asap. If asap directory has not have any git repository, create an empty one by executing

<code>git init</code>

In the github page of the IReS-Platform, https://github.com/project-asap/IReS-Platform, at the right sidebar, under the label "HTTPS clone URL" the clone url can be found. Copy this url and from inside the terminal execute the command

<code>git clone clone_url</code>
<h5>Update</h5>

For demostration reasons a Linux operating system like Ubuntu it is assumed in this step. In Windows or other Linux distributions the equivalents should be done.


The local home directory of the IReS-Platform project is

<code>IRES_HOME=/home/$USER/asap/IReS-Platform</code>

NOTE: 

<ul>
<li>the "$USER" part of the IRES_HOME corresponds to the currently logged in user</li>
<li>it is assumed that the project has been cloned into the directory /home/$USER/asap</li>
<li>to refer to the value of IRES_HOME the <a href="http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-5.html" target="_blank">bash script variable</a> notation is used i.e. $IRES_HOME
</ul>

The files that should be updated are

<ol>
<li>$IRES_HOME/asap/IReS-Platform/asap-platform/asap-server/src/main/scripts/asap-server</li>
<li>$IRES_HOME/asap/IReS-Platform/panic/panic-core/pom.xml</li>
</ol>

<h6>asap-server</h6>
In this file the variable "ASAP_SERVER_HOME" should be assigned the path of the folder "IReS-Platform/asap-platform/asap-server/target" and thus the line

<code>[ -z "$ASAP_SERVER_HOME" ] && ASAP_SERVER_HOME=""</code>

must reflect this. In our case, this line should be

<code>[ -z "$ASAP_SERVER_HOME" ] && ASAP_SERVER_HOME="$IRES_HOME/asap/IReS-Platform/asap-platform/asap-server/target"</code>

<h6>panic-core/pom.xml</h6>


<h5>Build</h5>
To build the project use version 3 of maven because the previous version has bugs with jetty and jersey packages. In Ubuntu just execute

<code>sudo apt-get install maven</code>

and confirm the maven version by running

<code>mvn -v</code>.

In each of the directories below

<ol>
<li>$IRES_HOME/asap-platform</li>
<li>$IRES_HOME/cloudera-kitten</li>
<li>$IRES_HOME/panic</li>
</ol>

run the command

<code>mvn clean install</code>

to build IReS-Platform project. In the end of each build you should see a "BUILD SUCCESS" message. If the build process fails by showing a message "BUILD FAILURE" then try to rebuild the unbuilt directories by using sudo i.e.

<code>sudo mvn clean install</code>
