#!/usr/bin/env python

import os
import sys
import shutil

host = "ci.skores.eu"
certs_dir = "/var/lib/acme/live"
jenkins_uid = 1000
jenkins_gid = 1000
jenkins_volume_name = "jenkins"
jenkins_volume_path = "/var/lib/docker/volumes/"+jenkins_volume_name+"/_data"

def ConvertKeyToRSA(privkey):
    print("[*]\tConverting provided private key to rsa format:")
    os.system("openssl rsa -in %s -out %s/key.pem" % (privkey, jenkins_volume_path))
    print("[*]\tRemoving older key format.")
    os.remove(privkey)
    print("[*]\tDone")

print("[*]\tPrinting provided values:")
print("Host: %s,\n" \
      "Certificates path: %s,\n" \
      "Jenkins volume: %s,\n" \
      "Jenkins volume path: %s" % (host, certs_dir, jenkins_volume_name, jenkins_volume_path)
     )

print("[*]\tBootstrapping certitifcates.")

try:
    ssl = os.listdir(certs_dir+'/'+host)
    #cert = [ certs_dir+'/'+host+'/'+i for i in certs if i in ['fullchain', 'privkey']]
    certs = [ i for i in ssl if i in  ['fullchain','privkey'] ]
    print("[*]\tFound following certificates:\n%s" % (certs))
    print(certs)
    print("[*]\tSetting up certificates...")
    for f in certs:
        print("[*] Copying %s to %s" % (certs_dir+'/'+host+'/'+f, jenkins_volume_path+'/'+f))
        shutil.copy2(certs_dir+'/'+host+'/'+f, jenkins_volume_path+'/'+f)
    ConvertKeyToRSA(jenkins_volume_path+'/privkey')
    
    print("[*]\tRenaming cert file to cert.pem")
    os.rename(jenkins_volume_path+'/fullchain', jenkins_volume_path+'/cert.pem')
    print("[*]\tApplying proper permissions for jenkins user")
    for f in os.listdir(jenkins_volume_path):
        f = jenkins_volume_path+'/'+f
        os.chown(f, jenkins_uid, jenkins_gid) 
        perms = os.stat(f)
        print("[*] %s ownerships are :\n%s" % (f, perms))
   

    
except (OSError,FileNotFoundError) as e:
    print("[*]\tAn error occured:\n%s" % (e))
    sys.exit(2)


