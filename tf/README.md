# Technical Test - John Poole
## Action Summary
- Modules created for the kubernetes deployment and kubernetes service resource types
- Module created representing a deployable environment
- All environments extracted from main.tf into an nginx deployments file

## Usage instructions
- In order to create a new environment, simply add a new deployment to the nginxdeployment.tf

## TODO
- Fix the selector output in order to avoid this being inferred
- Extract environment variables into a json file for parsing - allowing an environment to be deploed just from the addition of variables    
- create terraform config to enable running witrhout full vagrant teardown

## Pipeline
- Add quality control gate (Sonarcloud?)
- Add security gate (Sonarcloud/Snyk?)
- Using the variables file, create a post deployment health check in order to check any node_port pvariables return 200

