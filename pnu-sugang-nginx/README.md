## 부산대학교 DR 수강신청 웹페이지 레파지토리


---
- main 브랜치를 수정후 Push 하면 파이프라인이 기동되고 신규 애플리케이션이 배포됩니다.
- 본 레파지토리는 DR 웹 화면 테스트 용입니다.
- SVN 레파지토리 연동 구성과 Backend 서비스는 추가 구성 예정입니다.

---

```bash
# SVN setup
kubectl apply -f pnu-dr/svn/deploy.yml
kubectl exec -it svn -- bash

htpasswd -bc /etc/subversion/passwd svnadmin 1

# Create Repo
cd /home/svn

svn-server svnadmin create pnu-sugang-nginx

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
>> tekton = rw

vi pnu-sugang-nginx/conf/passwd
>> [users]
>> tekton = 1

svn info --username tekton svn://localhost:3690/pnu-sugang-nginx

# Import PNU-SUGANG-NGINX repo
git clone https://gitea-dr.pnu.ac.kr/gitea/pnu-sugang-nginx tmp
svn import tmp --username tekton svn://localhost:3690/pnu-sugang-nginx/trunk

#  Checkout SVN repo
svn co --username=tekton --password=1 svn://localhost:3690/pnu-sugang-nginx

# Copy SVN source to local git
cp -R pnu-sugang-nginx/trunk/* tmp/

# Push git
cd tmp

git add .
git commit -m "update SVN source"
git push origin main
```
