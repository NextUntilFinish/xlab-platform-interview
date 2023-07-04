# Technical Test - John Poole
## Action Summary
- Module created representing a deployable environment
- Used a foreach loop to generate the environments rather than repeating code

## Usage instructions
- In order to create a new environment, simply add another entry to the dictionary declared in main.tf on line 44

## TODO
- extract the environment definition into a config file

## Pipeline
- Add quality control gate (Sonarcloud?)
- Add security gate (Sonarcloud/Snyk?)
- Using the variables file, create a post deployment health check in order to check any node_port variables return 200

