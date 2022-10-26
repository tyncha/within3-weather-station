# Within3 weather station application deployment documentation #

Here you will find everything you looking for to deploy within3-weather-station app. Please follow all the requirements to be able to deploy the app properly

## Requirements ##

1. AWS account with `AdministratorAccess` and `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`.
2. Dockerhub account `DOCKERHUB_USERNAME`, with `DOCKERHUB_TOKEN`


## Application deployment ##

1. In order to deploy the app in AWS. You need to fork a within3-weather-station repository and clone it, and then go to the
```
https://github.com/<your repo>/within3-weather-station
cd deployments/terraform
```
2. In `terraform` directory open file `main.tf` in line 39 add your own public key `public_key = ""`
3. Once you done go ahead `git add, git commit and git push` cloned `within3-weather-station` repo.
4. Once pushed to your repo go to the `setting` of that repo, and then in dropdown options pick `actions`
5. In opening `Action secrets`  page click  `New repository secret` and in name add `AWS_SECRET_ACCESS_KEY` in a value add value of your secret access key from aws, same with `AWS_ACCESS_KEY_ID` and `DOCKERHUB_USERNAME` as well `DOCKERHUB_TOKEN` at the end you should have 4 secrets.
6. You can see in this documentation  https://docs.github.com/en/actions/security-guides/encrypted-secrets 

7. In order to deploy in `dev` environment you should create new `develop` branch and pipline automaticly picks up the code.

8. In order to deploy in `qa` environment you should create new `qa` branch and pipline automaticly picks up the code.

## Check the App ##

1. Once all services created in AW go to the `EC2` dashboard in AWS console and open `Elastic IP` get that IP and check in your browser.