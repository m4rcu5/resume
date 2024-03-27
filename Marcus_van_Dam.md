---
Title:      Resume of Marcus van Dam  
Author:     Marcus van Dam  
Date:       March 27, 2024  
CSS:        css/custom.css  
---

Marcus van Dam ![mugshot][]
===========================

|:-----------------------------|-----------------------------:|
|\<REDACTED\>                  |   marcus (at) marcusvandam.nl|
|2041 BS Zandvoort             |       GPG: 0xB44C673E920EE3A4|
|Netherlands                   |                     [Keybase]|
|+31 6 28 553 497              |                      [Github]|
|[LinkedIn]                    |                     [Website]|



## Summary ##

+ DevOps/SecOps engineer and system/network architect with experience in Unix, Linux, Windows and VMWare environments. Deployment and design on bare metal and cloud platforms.
+ Problem seeker, loves finding a solution, but rather fixes the problem before it manifests itself.
+ Programming and maintenance experience in Perl (main language), Ruby (Chef), PHP, Python and Shell scripting.
+ Only limited frontend skill.
+ 15 years of experience in the field of hosting services.
+ Network operator of the AS9017 network.
+ If there is another way, would not accept the half, quick and dirty solution.
+ Turning hobbies into work. Combining experience with hosting, photo, video, audio and network if possible.


## Experience ##

**Leaseweb** ![leaseweb][]
:   *Senior Security Engineer* (2019 to current)

    With the lateral move as architect at the product engineering department to the internal security department, I was able to apply much of the same principals of standardization and automation to Leaseweb's internal office network. The internal network suffered from the rapid growth of the company and felt like the right challenge.

    **Highlights:**

    + Redesign and standardization of the office network. Which involved segmenting the network into zones applicable to all DC and office locations. Splitting the network into a hub and spoke layout. Ensuring reliable backhaul communications between the sites, using BGP as dynamic routing protocol. Additionally providing all sites with a out-of-band solution for remote management.

    + Automating the firewall deployment and address space calculations using Ansible. During the before mentioned redesign, 20+ sites had to be deployed or reconfigured. To be able to reliable deploy a baseline configuration and do all the IP subnet calculations, the deployment was automated with Ansible. This would provide the base for all future firewalls.

    + Mergers and acquisitions provide unique challenges on how to interconnect the newly acquired companies with the current office network. Doing so while keeping the same level of security, separation, and sticking to the design standards. Being involved in the due diligence phase, and taking the role of project/team lead in the migration phase.

    + Setting up a central logging platform based on the ELK stack, to ingest, enrich, store, and alert, based on various log sources. Including the Palo Alto firewalls, Windows logs, antivirus software, and more. For several sources, custom parsers had to be written, and alerts defined. This also provided a great way to troubleshoot network issues, or correlate events across the various firewalls.

    + Auditing and certifications. Aside from the infrastructure, I've been involved in the internal auditing and certifications of our offices and datacenter locations.

    + Redesign of internal PKI infrastructure, providing a migration path using cross-signing, eventually separating out the various departments and roles.

    **Keywords:** Palo Alto, NGN Firewalling, VPN, User-ID, Ansible, Automation, SecOps, ISO/SOC, PKI

:   *Infrastructure Architect* (2016 to 2019)

    The role of Infrastructure Architect is one with focus on technical expertise. Your responsibilities include defining the systems architecture vision, strategy and technical solutions for all product engineering teams and integrate with the development roadmap. Align all the teams on the existing architecture and defined the new standards. Focus on automation and scalability. Coordinate incidents across departments. Function as the last line escalation point for all teams and help train the engineers.

    **Keywords:** Design, Scalability, Training, Operations

:   *Hosting Operations Engineer* (2011 to 2015)

    As a Hosting Operations Engineer (formerly known as Technical Support) you are responsible for all customer facing hosting platforms (DNS, Email, Web) and its infrastructure. In this role my focus is at the design and security of the existing setups and new designs. In the last 6 months of this position Leaseweb as an organization moved to an agile way of working. Merging the former Hosting Engineers with with the Software Developers, forming the Product Engineering team. Together you are operationally responsible for the applications and platforms in order to make sure that Leaseweb’s products and services are available to our customers. Test, deploy, administer, monitor and maintain the infrastructure.

    **Highlights:**

    + Redesign and live-migration of the CL2000 webhosting platform. Leaseweb's webhosting platform used to be based on stand-alone servers running the Plesk management panel. The new design allowed for on demand scaling in a clustered setup. Being build upon NFS storage, separate MySQL servers and Plesk interface machines. Using HAProxy as loadbalancers in HA setup.

    + Chef
    This has now become Leaseweb's main configuration management system. I have started with the initial PoC of Chef within Leaseweb's infrastructure and supported fellow engineers in the implementation of Chef in their infrastructure. This also paved the way for automated deployments of application code. 

    + Remote Management
    Together with a bare metal focused development team we designed and implemented a remote management platform for our dedicated servers. Using FreeBSD for VPN access and concentrator servers. Using the internal PF subsystem to grant and deny access on a per client basis.

    + Monitoring
    Designing, planning and rolling out a monitoring platform based on Opsview. This was a project growing over time, when the amount of point per server we continued to monitor increased. The fact that Nagios is largely Perl based, made development of custom plugins easy.

    **Keywords:** HAProxy, Apache, NginX, FreeBSD, CARP, Debian, Ubuntu, Plesk, MySQL, MSSQL, Windows Server, JunOS, IOS, (Open)VPN, SSL, Network (layer 2-7).

:   *Provisioning Engineer* (2009 to 2011)

    As a provisioning engineer at Leaseweb, your main focus is at the delivery of Bare Metal and Colocation services, as well as new datacenter POP deployments.

    **Highlights:**

    + Setup of colocation procedures. Including customer and internal communication protocols.

    + Deployment of first US POP. Together with a small team we set up the first USA POP from the ground up in under a week.

    **Keywords:** BareMetal, Colocation, Automatic provisioning, Datacenter Infrastructure, Network (layer 1)

**ByteSheep Services**
:   *Owner* (2015 to current)

    ByteSheep Services is my own company. Started from the typical "can you host my website" friends and family service. My passion for radio quickly added streaming as a new service. With the trials of DAB+ broadcasting in the Netherlands I have teamed up with RF experts to form [DAB Partners]. Where I provide DAB+ supporting services such as streaming, trans-coding, multiplexing, content delivery and transmission line monitoring. As well as supporting on-site installation of the equipment, network and wireless transmission equipment.

    **Keywords:** DAB+, Long Range WiFi, Icecast, Docker, Kubernetes, InfluxDB, LAMP, Mail

**Timelapse.Live** ![timelapselogo][]
:   *Co-Owner* (2014 to current)

    Branching off the photography hobby, together with a fellow photographer, who was already doing timelapses at Bevrijdingspop, we gave it a live twist. Our service provides a [high quality timelapse][TimelapseLive] with the latest live image and periodically generated video accessible per API. To provide this, we build custom hardware to control the DSLR coupled with an API to ingest and process the images. The delivery is done trough a scalable CDN.

    **Keywords:** PHP, Python, Raspberry, Hardware, WiFi, CDN

**ZFM Zandvoort** ![zfmzandvoort][]
:   *Chief Technical Officer* (2013 to current) (volunteering position)

    A local radio station is a combination of mostly analog audio equipment and a digital backbone. Combining this with the transmission equipment, there is a broad spectrum of technologies to be maintained. We also develop custom hardware as needed. The network includes broadcasting systems, transmission monitoring, desktop environment and PBX systems.
    Broadcasting is also performed in external locations, introducing p2p audio transmissions and mobile studios.

    **Keywords:** Audio Processing, PBX, HAM, Transmission, Circuit Repair/Design

**Ground Control Show** ![gcs][]
:   *Stage Technician* 2008

    Working in a small team, you are self sufficient and responsible for transport, setup and operation of all equipment that is needed at a particular show. The contracts varied from small garden events to Mystery Land and Rockit Open Air. Setups including Sound, Light and Rigging. The irregular working hours, troubleshooting on demand (with the tools and people at hand) and variety of venues still intrigue me today.

    **Keywords:** Aviolite, Midas, DMX

**Ökotest Germany** ![oekotest][]
:   *Graphical Design* (Internship) 2006

    This internship was supposed to get my feet wet in graphics design and learn some more about frontend work. However it turned out, that my interest seemed to be more about figuring out how the systems are connected, the network arranged and the flow of project data between the different departments was set up.

    **Keywords:** Adobe Indesign, Photoshop, Collor Correction, Font Design

:   *System Administrator* (Internship) 2007

    This second internship was now focused on the system administration in the office environment. Their environment was based on Windows XP desktops, Samba 3 domain, and Gentoo servers. Combined with specialty software for the image database and various Adobe packages.

    **Keywords:** Samba, Windows Domains, Desktop Administration


## Education & Training##

+ **Chef Intermediate Training** Chef - 2014
+ **A10 Network Loadbalancing** Terach University - 2012
+ **Business English** Horizon Interlingua - 2011
+ **Highshool:** Havo N&T - Class of 2008 at 'Sancta Maria Lyceum Haarlem'


## Skills ##

+ Languages: Perl (++++), Bash (+++), PHP (+++), C++ (+), Ruby (+++), HTML (++)
+ Operating Systems: Linux (Debian, Ubuntu, Centos, Gentoo), BSD (FreeBSD, OpenBSD), Firewalls (pfSense, OPNsense, Monowall), ESXi, Windows (Server >2000)
+ DevOps, Agile, SCRUM
+ Apache, Nginx, Tomcat, Lighttpd, MySQL/MariaDB, Dovecot, Postfix, Icecast
+ Nagios, Icinga, Opsview, Prometheus, Grafana, *TSDB
+ Git, SVN, Jira, Stash, Jenkins


## Hobbies ##

+ **Photography:** Resident Photographer at Bevrijdingspop/Beeckesteinpop/Rob Acda Award ([Website])
+ **Radio:** As well as being the tech chief, my passion is recording live band performances in our studio. ([AlternativeFM])
+ **CTFs:** I like solving puzzles, CTFs, especially in a family style, provide the perfect pastime to do so and meet new people.

## Public References ##

### Blog Posts ###
+ [A Brief Overview of the History of Linux Containers](http://www.techsummit.io/2017/09/04/history-of-linux-containers.html)
+ [Cloud Computing's History and Impact](http://www.techsummit.io/2017/08/14/cloud-computing-history.html)

### Talks ###
+ [Chef at Leaseweb: past, present and future](https://www.youtube.com/watch?v=Uwv9gLdjvo8)



---

## About this resume ##

This resume is written as a markdown document, version controlled, an the latest version maintained on my [Github] page. Upon change, the document is compiled together with the stylesheet to HTML, Tested, converted to PDF and uploaded to my online [resume page][Resume].
The whole process is automated by use of a Jenkins file and run in Docker containers. A containerized version of this resume is also available.



[mugshot]: images/mugshot.jpg "Marcus van Dam" height=220px
[gcs]: images/gcs.png "Ground Control Show" class="logo" height=75px
[oekotest]: images/oekotest.png "Oekotest" class="logo" height=75px
[leaseweb]: images/leaseweb.png "Leaseweb" class="logo" height=125px
[zfmzandvoort]: images/zfm.png "ZFM Zandvoort" class="logo" height=150px
[timelapselogo]: images/timelapselive.png "Timelapse.Live" class="logo" height=50px

[Keybase]:   https://keybase.io/marcusvandam
[LinkedIn]:  https://nl.linkedin.com/in/marcusvandam
[Github]:    https://github.com/m4rcu5
[Website]:   https://marcusvandam.nl
[Resume]:    https://resume.marcusvandam.nl
[AlternativeFM]: https://www.altfm.nl
[DAB Partners]:  http://dabpartners.nl
[TimelapseLive]: http://www.timelapse.live
