# base64 somefile.txt | base64 -d - > 123.txt


echo "{\"message\":\"my commit message\",\"committer\":{\"name\":\"Monalisa Octocat\",\"email\":\"octocat@github.com\"},\"content\":\"$(base64 ./20201014180756916.png)\"}" > temp.json

curl -L \
  -X PUT \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${XXXXXX}"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/dirkarnez/gittest/contents/20201014180756916.png \
  -d @./temp.json && \
rm ./temp.json

read -p "jajaj"
