#!/bin/bash
 
/sbin/ss -ant | awk "{if (NR>1) {state[\$1]++}} END {host = \"-\"; \
for (i in state) {s=i; \
sub (/ESTAB/, \"establ\", s); sub (/LISTEN/, \"listen\", s); sub (/SYN-SENT/, \"synsent\", s); \
sub (/SYN-RECV/, \"synrecv\", s); sub (/FIN-WAIT-1/, \"finw1\", s); sub (/FIN-WAIT-2/, \"finw2\", s); \
sub (/CLOSE-WAIT/, \"closew\", s); sub (/TIME-WAIT/, \"timew\", s); print host, \"tcp.\"s, state[i]}}" \
| /usr/bin/zabbix_sender -vv -c /etc/zabbix/zabbix_agentd.conf -i - 2>&1
echo "1"
exit 0