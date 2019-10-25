nassh-relay
===========

Relay for Native Client SSH, see http://goo.gl/HMsm8p

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

[![PlayWithDocker](https://github.com/play-with-docker/stacks/raw/cff22438cb4195ace27f9b15784bbb497047afa7/assets/images/button.png)](http://play-with-docker.com?stack=https://gist.githubusercontent.com/santaklouse/6b1c084bf212a4b00cbd3b838b39495b/raw/nassh-stack.yml)

client options (fill in your temp docker url from pwd)
```
--proxy-host=pwd10-XXX-XXX-XXX-8022.host1.labs.play-with-docker.com --proxy-port=8022
```
