---sh

ansible-playbook -i inventory.ini openshift-ansible/playbooks/byo/openshift-cluster/upgrades/v3_10/upgrade.yml

ansible-playbook -i inventory.ini openshift-ansible/playbooks/prerequisites.yml

ansible-playbook -i inventory.ini openshift-ansible/playbooks/deploy_cluster.yml

ansible-playbook -i inventory.ini openshift-ansible/playbooks/adhoc/uninstall.yml

# tao cert
git clone https://github.com/letsencrypt/letsencrypt

letsencrypt/letsencrypt-auto certonly  --domains *.okd.lamit.win --email okd@lamit.win --manual --preferred-challenges dns --server https://acme-v02.api.letsencrypt.org/directory
# /etc/letsencrypt/live/okd.lamit.win-0001
# lam moi 
#ansible-playbook openshift-ansible/playbooks/openshift-master/private/redeploy-certificates.yml

yum install -y docker
systemctl start docker.service
vgcreate vgdocker /dev/sdb

# lvs - cat /etc/sysconfig/docker-storage-setup

echo "CONTAINER_THINPOOL=docker" >> /etc/sysconfig/docker-storage-setup

echo "VG=vgdocker" >> /etc/sysconfig/docker-storage-setup

systemctl stop docker docker-storage-setup

rm -rf /var/lib/docker/*

systemctl start docker docker-storage-setup

htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}

---
