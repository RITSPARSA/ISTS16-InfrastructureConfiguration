echo "machines:"
for i in $(seq 0 11); do echo -e "
  vega.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.10\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  sirius.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.20\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  tauri.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.30\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  sol.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.40\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  crucis.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.50\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  persei.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.60\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  luna.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.75\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  andromeda.team$i.ists:
    team_id: \"$i\"
    ip: \"10.2.$i.100\"
    network: \"10.2.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.2.$i.254\"
    broadcast: \"10.2.$i.254\"
  pegasi.team$i.ists:
    team_id: \"$i\"
    ip: \"10.3.$i.10\"
    network: \"10.3.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.3.$i.254\"
    broadcast: \"10.3.$i.254\"
  wolf.team$i.ists:
    team_id: \"$i\"
    ip: \"10.3.$i.20\"
    network: \"10.3.$i.0\"
    netmask: \"255.255.255.0\"
    gateway: \"10.3.$i.254\"
    broadcast: \"10.3.$i.254\"
  cygni.team$i.ists:
    team_id: \"$i\"
    ip: \"10.3.$i.254/24\"
    public_ip: \"10.0.200.$[$i+64]/26\"
    gateway: \"10.0.200.126\"
  10.4.0.$[$i+100]:
    team_id: \"$i\"
    ip: \"10.4.0.$[$i+100]\"
   
\n"; done

echo -e "
hostnames:
  mail: tauri
  web1: luna
  web2: pegasi
  elastic1: crucis
  jenkins1: vega
  jenkins2: wolf
  ad: sol
  ftp: sirius
  db: sirius
  attack: persei
  android: andromeda
  router: cygni
  pi: luna\n"
