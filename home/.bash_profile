
eval $(ssh-agent -s)
trap "echokill $SSH_AGENT_PID" 0

pushd $USERPROFILE
ssh-add ./.ssh/id_rsa
popd
