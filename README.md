ansible-playbook -i inventory.ini openshift-ansible/playbooks/prerequisites.yml
ansible-playbook -i inventory.ini openshift-ansible/playbooks/deploy_cluster.yml
--------------------------
yum install -y docker
systemctl start docker.service
vgcreate vgdocker /dev/sdb
# lvs --- cat /etc/sysconfig/docker-storage-setup
echo "CONTAINER_THINPOOL=docker" >> /etc/sysconfig/docker-storage-setup
echo "VG=vgdocker" >> /etc/sysconfig/docker-storage-setup

systemctl stop docker docker-storage-setup
rm -rf /var/lib/docker/*
systemctl start docker docker-storage-setup
-------------------------
htpasswd -b /etc/origin/master/htpasswd ${USERNAME} ${PASSWORD}
oc adm policy add-cluster-role-to-user cluster-admin ${USERNAME}
---------------------------
cat ~/*.crt ~/*.key ~/*.crt > /var/lib/origin/openshift.local.config/master/router.pem
