
UNAMES="`uname -s`"

if [ -f ~/.bin/${UNAMES}/go-getter ];then
  echo "we good"
else
  echo "need to do something about it"
  #cp Downloads/gopath/bin/go-getter ~/.bin/Darwin/
fi
