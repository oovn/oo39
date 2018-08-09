---sh
ansible-playbook -i inventory.ini openshift-ansible/playbooks/prerequisites.yml
ansible-playbook -i inventory.ini openshift-ansible/playbooks/deploy_cluster.yml
ansible-playbook -i inventory.ini openshift-ansible/playbooks/adhoc/uninstall.yml
git clone https://github.com/certbot/certbot
certbot/certbot-auto certonly --standalone --agree-tos --email binhbat@live.com -d oocp.lamit.win -d okd.lamit.win
# tao cert
git clone https://github.com/certbot/certbot
/root/certbot/certbot-auto certonly -d oovn.nodebb.xyz --standalone -m oovn@kynu.xyz -n --agree-tos
# nap lai
export openshift_master_named_certificates=[{"certfile":"/etc/letsencrypt/live/oovn.nodebb.xyz/fullchain.pem","keyfile":"/etc/letsencrypt/live/oovn.nodebb.xyz/privkey.pem"}]
export openshift_master_overwrite_named_certificates=true
# lam moi 
#ansible-playbook openshift-ansible/playbooks/openshift-master/private/redeploy-certificates.yml

yum install -y docker
systemctl start docker.service
vgcreate vgdocker /dev/sdb

# lvs --- cat /etc/sysconfig/docker-storage-setup

echo "CONTAINER_THINPOOL=docker" >> /etc/sysconfig/docker-storage-setup
echo "VG=vgdocker" >> /etc/sysconfig/docker-storage-setup
systemctl stop docker docker-storage-setup
rm -rf /var/lib/docker/*
systemctl start docker docker-storage-setup
htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}

cat ~/*.crt ~/*.key ~/*.crt > /var/lib/origin/openshift.local.config/master/router.pem
