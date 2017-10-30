node default {
  notify{"Running in $server_facts['environment']":}
  notice("Running in $server_facts['environment']")
}
