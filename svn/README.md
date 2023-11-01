### SVN SETUP

# SVN server deploy
kubectl apply -f svn-server-deploy.yml
kubectl exec -it $(kubecl get pods -l svc=svn-server) -- htpasswd -b /etc/subversion/passwd svnadmin 1

# Create Repo
kubectl exec -it $(kubecl get pods -l svc=svn-server) -- bash

cd $HOME

svnadmin create pnu-sugang-nginx

# Configure Auth

vi pnu-sugang-nginx/conf/svnserve.conf
>> anon-access = read
>> auth-access = write
>> password-db = passwd
>> authz-db = authz

vi pnu-sugang-nginx/conf/authz
>> [groups]
>> admin_group = tekton

>> [/]
>> @admin_group  = rw
>> jaehoon = rw

vi pnu-sugang-nginx/conf/passwd
>> [users]
>> tekton = 1

svn info --username tekton svn://localhost:3690/pnu-sugang-nginx

# Import PNU-TEST repo
git clone $SOURCE_REPO
svn import $SOURCE_REPO --username tekton svn://localhost:3690/pnu-sugang-nginx/trunk
