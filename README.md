# docker-whmcs
This image is available with two PHP versions. Please note that PHP70 is only compatible with WHMCS V7 and above. A lot of modules are still not compatible with PHP70.

## PHP7.0 
This is a image based of Ubuntu 16.0, it contains all the needed php extentions for WHMCS to work.
```
Docker service create \
  --name whmcs
  phasehosting/docker-whmcs:php70
```
  
## PHP5.6
```
Docker service create \
  --name whmcs
  phasehosting/docker-whmcs:php56
```
