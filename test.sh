#!/bin/bash
ID=$(echo $HOSTNAME | rev | cut -d- -f1 | rev)
cat > config.yaml <<EOD
data-dir: /home/dev-station/proglog/data
rpc-port: 8999
bind-addr: "127.0.0.1:8991"
boostrap: $([ $ID = 0 ] && echo true || echo false)
$([ $ID != 0 ] && echo 'start-join-addrs: "proglog-0.proglog.{{.Release.Namespace}}.svc.cluster.local:{{.Values.serfPort}}"')
EOD