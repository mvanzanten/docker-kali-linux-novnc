# Kali Linux Docker Container with XFCE Desktop over VNC / noVNC

Kali Linux docker container running with a full desktop, VNC, and noVNC so that you can access the desktop via your browser.

### Build
Run the command `make build` to create the container.

### Run
Run the command `make run` to start the container.

Access in your browser on `https://localhost:9020/vnc.html`


### Config

The default configuration is set as follows. Feel free to change this as required.

- `-e VNCEXPOSE=0`
  - By default, the VNC server runs on `localhost` within the container only and is not exposed.
  - Use `-e VNCEXPOSE=1` to expose the VNC server and use a VNC client of your choice to connect to `localhost:9021` with the default password `changeme`.
  - The default port mapping for the VNC server is configured with the `-p 9021:5900` parameter.
- `-e VNCPORT=5900`
  - By default, the VNC server runs on port 5900 within the container.
  - Note: If you change this port, you also need to change the port mapping with the `-p 9021:5900` parameter.
- `-e VNCPWD=changeme`
  - Change the default password of the VNC server.
- `-e VNCDISPLAY=1920x1080`
  - Change the default display resolution of the VNC connection.
- `-e VNCDEPTH=16`
  - Change the default display depth of the VNC connection. Possible values are 8, 16, 24, and 32. Higher values mean better quality but more bandwidth requirements.
- `-e NOVNCPORT=8080`
  - By default, the noVNC server runs on port 8080 within the container.
  - Note: If you change this port, you also need to change the port mapping with the `-p 9020:8080` parameter.
- `-v /your/path/to/cert.pem:/etc/ssl/certs/novnc_cert.pem -v /your/path/to/key.pem:/etc/ssl/certs/novnc_key.pem`
  - By default, the container creates a new self-signed certificate for the noVNC connection at creation time.
  - You can optionally mount your self-signed certificate and key to the container.
  - Use `openssl req -new -x509 -days 365 -nodes -out cert.pem -keyout key.pem` to create a new certificate and key.