# smtp-server
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
	ullbergm/smtp-server
```
