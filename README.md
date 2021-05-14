# kapture
A simple automated bash tool that takes snapshots for all your Digital Ocean Droplets


### Prerequisites

- `DIGITAL OCEAN API KEY` - Click [Here](https://cloud.digitalocean.com/account/api/tokens) to get one.
- Bash 


### Installation and Usage 

> git clone git@github.com:bitnob/kapture.git \
  cd kapture \
  bash kapture.bash 



### Background Context

- It is advisable to run this script at a time when your servers won't be expecting heavy traffic so that there won't be data inconsistency in your snapshots.

- Auto deleting of previous snapshot is not available yet. If you find a way to implement that before I do, kindly fork this repo and raise a PR, then I would be happy to merge your PR

### To cancel the automation simply run

> crontab -r 

### Acknowledgement
- Heavily Inspired by [Stacks](https://github.com/NonsoAmadi10/stacks)


### Like this tool??

- Kindly leave a ⭐ on this repo and follow me on [Twitter](https://twitter.com/jackhoudini__)

