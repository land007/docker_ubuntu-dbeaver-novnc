# docker_ubuntu-dbeaver-novnc

The porter uses Ubuntu's original desktop, installs ecliipse+ chrome, and supports Chinese

You can add the PASSWORD=1 parameter, the remote display opens the following address http://localhost:6080/vnc.html. Password 1 is the VNC connection and root password.


```bash
docker run -itd -p 6080:6080 -e PASSWORD=1 -e SUDO=yes –name zc004 land007/ubuntu-dbeaver-novnc:latest
```

![image](https://github.com/land007/docker_ubuntu-dbeaver-novnc/raw/main/20210604170156.png)

If you do not add the PASSWORD=1 parameter, the system will automatically assign a password.


```bash
docker rm -f ubuntu-dbeaver-novnc ; docker run -it -p 5901:5901 -p 6080:6080 -p 4040:4040 --privileged --name ubuntu-dbeaver-novnc land007/ubuntu-dbeaver-novnc:latest

```

You can use the following command to query.

```bash
docker exec ubuntu-dbeaver-novnc cat /home/ubuntu/password.txt
```

