# Within3 weather station application deployment documentation #

Here you will find everything you looking for to deploy within3-weather-station app. Please follow all the requirements to be able to deploy the app properly

## Requirements ##

1. AWS account with `AdministratorAccess` and `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`.
2. Dockerhub account `DOCKERHUB_USERNAME`, with `DOCKERHUB_TOKEN`


## Application deployment ##
1. In order to deploy the app in AWS. You need to clone a within3-weather-station repository from tyncht github org.
```
https://github.com/tyncha/within3-weather-station
```
2. Create own repo and push cloned 'within3-weather-station' repo to you own new created repo
3. Once pushed to your repo go to the `setting` of that repo, and then in dropdown options pick `actions`
4. In opening `Action secrets`  page click  `New repository secret` and in name add `AWS_SECRET_ACCESS_KEY` in a value add value of your secret access key from aws, same with `AWS_ACCESS_KEY_ID` and `DOCKERHUB_USERNAME` as well `DOCKERHUB_TOKEN` at the end you should have 4 secrets.

5. You can see in this documentation  https://docs.github.com/en/actions/security-guides/encrypted-secrets 

