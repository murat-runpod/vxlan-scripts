Execute in following order:

`enable-jumboframes.sh` -> `setup-bridge.sh` -> `create-pod.sh`

To dismantle:

`kill-pod.sh` -> `remove-bridge.sh`


In case of any issues with Docker reading GPU's, follow these steps exactly:
https://stackoverflow.com/questions/75118992/docker-error-response-from-daemon-could-not-select-device-driver-with-capab
