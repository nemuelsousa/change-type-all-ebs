# automatically change type of ebs volumes

## Requirements

Have the `jq` tool installed to better handle the JSON returned by the aws command and the `aws cli`.

```
$ sudo apt install jq
```
or 
```
$ sudo yum install jq
```
AWS CLI install instructions `https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html`

## Usage

### Configure AWS CLI

Set the configuration file and authentication information file.

```
$ aws configure
AWS Access Key ID [None]: XXXXXXXXXXXXXXXXX
AWS Secret Access Key [None]: XXXXXXXXXXXXXXXXXXXXXXXXXX
Default region name [None]: region
Default output format [None]: 
```
### How to run?

```
$ ./change_type_ebs.sh
```


This same script can be used to massively change EBS volumes of other types, such as standard, io1, io2, sc1, st1, etc.