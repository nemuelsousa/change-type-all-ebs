#!/usr/bin/env bash
# 
# change_type_ebs.sh - automatically change type of ebs volumes
#
# Autor: Nemuel Sousa
#
region='sa-east-1'

# Finds all gp2 volumes within the specified region
volume_ids=$(/usr/bin/aws ec2 describe-volumes --region "${region}" --filters Name=volume-type,Values=gp2 | jq -r '.Volumes[].VolumeId')

# Changes all gp2 type volumes to gp3 type
for volume_id in ${volume_ids};do
    result=$(/usr/bin/aws ec2 modify-volume --region "${region}" --volume-type=gp3 --volume-id "${volume_id}" | jq '.VolumeModification.ModificationState' | sed 's/"//g')
    if [ $? -eq 0 ] && [ "${result}" == "modifying" ];then
        echo "OK: volume ${volume_id} changed to state 'modifying'"
    else
        echo "ERROR: couldn't change volume ${volume_id} type to gp3"
    fi
done