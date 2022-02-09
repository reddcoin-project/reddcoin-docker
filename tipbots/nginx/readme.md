##Configure nginx
###SSL
#### dhparam
Within the root of nginx generate dhparam.pem
```shell
openssl dhparam -out dhparams.pem 4096
```
This will take a long time to complete, even up to an hour in some cases.
#### SSL certificates
Copy ssl certificate and key file to the ./certs directory with the following naming scheme. 
```shell
ssl_certificate             fullchain.pem
ssl_certificate_key         privkey.pem
```
#### Upstream Servers
Modify ./nginx/conf.d/sites-available/api.conf with the correct upstream server paths 