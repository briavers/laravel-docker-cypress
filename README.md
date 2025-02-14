<p align="center">
  <img src="https://raw.githubusercontent.com/robsontenorio/laravel-docker/master/octopus.png"> <img height="50" src="https://raw.githubusercontent.com/robsontenorio/laravel-docker-cypress/master/cypress.png">
</p> 
<p align="center">    
  <a href="https://hub.docker.com/r/robsontenorio/laravel-cypress">
    <img src="https://img.shields.io/docker/v/robsontenorio/laravel-cypress?color=green&sort=semver&style=for-the-badge" />   
    <img src="https://img.shields.io/docker/pulls/robsontenorio/laravel-cypress?color=orange&style=for-the-badge" />
   <img src="https://img.shields.io/docker/image-size/robsontenorio/laravel-cypress?sort=date&style=for-the-badge" />
  </a>
</p>

# Laravel Docker + Cypress

This image inherits from [robsontenorio/laravel](https://github.com/robsontenorio/laravel-docker) by including all required dependencies and browsers for running Cypress:
 - Firefox
 - Chrome
 - Electron

**INTENDED ONLY** for running Cypress tests on CI. For local development and production use [robsontenorio/laravel](https://github.com/robsontenorio/laravel-docker) instead.


## Update image
docker buildx build --push --platform linux/arm64,linux/amd64 --tag=briavers/laravel-docker-cypress:**YOUR_TAG_HERE** .
