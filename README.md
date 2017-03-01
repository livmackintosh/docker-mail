Docker-Mail
===========

About
-----
Docker-Mail is a 'secure' mail project that intents to make email server
deployments that follow best practice security methods. It's based on
the TREES project by the Riseup collective.

It is based around Docker containers that each
provide a microservice. Each container can has an image context in it's
own directory which are all prefixed with "docker-". All of these
microservices then are composed in a way to create a full system using
the docker-compose.yml file that creates various volume mounts, port
exposures and inter-service links. It's a way to manage these services.


Future Direction
----------------
There will be a small module in the future that will contain a setup
process that can pass variables into the build context of each service.
I envision the user running a single command and being prompted for
every part of information required to stand up the services as well as
feedback on any further instructions required to be completed (e.g. DNS
records). Things like this could even be automated if DNS is self-hosted
or via DNS services with an API (e.g AWS Route53 or DNSimple) but
given this project's nature - it may actually counter the overarching
goals and principles of this project.


Licence
-------
Docker-Mail is licenced under the GNU General Public Licence (Version 3+).
See the LICENCE file for the full licence text.
