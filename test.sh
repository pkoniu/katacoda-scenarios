./proc.sh &

pid=$!

spin='-\|/'

echo "Waiting..."
i=0
while kill -0 $pid 2>/dev/null
do
  i=$(( (i+1) %4 ))
  printf "\r${spin:$i:1}"
  sleep .1
done
