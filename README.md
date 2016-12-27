A Dockerfile for Sonatype Nexus Repository Manager 3, based on CentOS.

To run, binding the exposed port 8081 to the host.

```
$ docker run -d -p 8081:8081 --name nexus sonatype/nexus3
```

Use *docker* to get shell access to *web* docker container
```
$ docker exec -it nginx_web_1 bash
```

Use *docker-compose* to get shell access to *web* docker container
```
$ docker-compose exec web /bin/bash
```

Add php-docker.local to /etc/hosts
```
127.0.0.1	php-docker.local
```

Access local docker web container from web browser
```
http://php-docker.local/adminer-4.2.5.php
```
