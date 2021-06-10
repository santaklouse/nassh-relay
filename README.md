[![Docker Pulls](https://img.shields.io/docker/pulls/santaklouse/nassh-tor-relay)](https://hub.docker.com/r/santaklouse/nassh-tor-relay)

nassh-relay
===========

Relay for Native Client SSH, see http://goo.gl/HMsm8p

!!! Locally installed tor required for non Docker version.

Typical use case is when you want to firewall your sshd port. Also the
relay supports roaming clients better than a direct TCP connection, as
the TCP stack cuts the connection if the client IP changes. This relay
on the other hand supports reconnecing from all HTTP client as long as
the client can present it with the correct session ID[*].

Invoke:
$ node nassh-relay.js <port> [external-redirect]

At relay selection, the server echos back the HTTP Host header as the
relay. If that host is not directly reachable by its clients, you need
to specify an external-redirect.

[*] The session is still protected by SSH, so guessing the session ID
is a denial of service attack and allows sniffing the encrypted sshd
response bytestream.

## Demo

1. Click link below

[![PlayWithDocker](https://github.com/play-with-docker/stacks/raw/cff22438cb4195ace27f9b15784bbb497047afa7/assets/images/button.png)](http://play-with-docker.com?stack=https://gist.githubusercontent.com/santaklouse/6b1c084bf212a4b00cbd3b838b39495b/raw/nassh-stack.yml)

2. login to docker and wait for swarm creating 
3. after sucessful swarm creating need to wait about 2 minutes for torproxy container set up
4. in the top of Play with Docker site opened by step 2 find link *8022* and copy it
5. paste link to nassh proxy host and remove http and slashes (like in example below)
client options (fill in your temp docker url from pwd)
```
--proxy-host=pwd10-XXX-XXX-XXX-8022.host1.labs.play-with-docker.com --proxy-port=8022
```
6. connect to your .onion or usual .com host or ip.
7. `# curl ipinfo.io` and look at your ip address =)
