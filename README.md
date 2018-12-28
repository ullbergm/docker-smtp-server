# kubernetes-postfix-relay-host
A SMTP relay host for transactional based emails from within a k8 cluster.
 
## Background
I needed a smtp relay to use in my Kubernetes cluster that all the different services can use to send notifications with.

# Quickstart
Run on docker
```
docker run --rm -it -p 2525:25 \
	-e SMTP_RELAY_HOST="[email-smtp.us-east-1.amazonaws.com]:587" \
	-e SMTP_RELAY_MYHOSTNAME=smtp.k8s.yourhost.com \
	-e SMTP_RELAY_USERNAME=username \
	-e SMTP_RELAY_PASSWORD=password \
	ullbergm/postfix-relay-host
```
Send a test message
<pre>
<b>telnet localhost 2525</b>
220 tx-smtp-relay.yourhost.com ESMTP Postfix
<b>helo localhost</b>
250 tx-smtp-relay.yourhost.com
<b>mail from: noreply@yourhost.com</b>
250 2.1.0 Ok
<b>rcpt to: chris@applariat.com</b>
250 2.1.5 Ok
<b>data</b>
354 End data with <CR><LF>.<CR><LF>
<b>Subject: What?</b>
<b>My hovercraft is full of eels.</b>
<b>.</b>
250 2.0.0 Ok: queued as 982FF53C
<b>quit</b>
221 2.0.0 Bye
Connection closed by foreign host
</pre>
