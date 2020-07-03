#!/bin/bash

echo -e "I: This script resolves the key expired errors\n"

keys=(`apt-key list | grep expired | awk '{print $2}' | cut -d/ -f2`)

for key in "${keys[@]}"
do
	apt-key adv --keyserver keys.gnupg.net --recv-keys $key
	echo -e "Done updating the key with new one for $key\n"
done

echo -e "I: Thank you  for using the script"

