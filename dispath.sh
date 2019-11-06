prefix=172.18.226

api_gateway1=$prefix.232
api_gateway2=$prefix.237

eureka1=$prefix.239
eureka2=$prefix.233

case1=$prefix.241
case2=$prefix.234
operation1=$case1
operation2=$case2
dispatch1=$case1
dispatch2=$case2
im1=$case1
im2=$case2
call1=$case1
call2=$case2

attachment1=$prefix.235
attachment2=$prefix.240
order1=$attachment1
order2=$attachment2
core1=$attachment1
core2=$attachment2
customer1=$attachment1
customer2=$attachment2

dispatch() {
  echo dispaching $1:
  echo '  to:' $2:/data/web/
  echo '  to:' $3:/data/web/
  rsync -Rr $1 root@$2:/data/web
  rsync -Pr $1 root@$3:/data/web
}


for name in lisp-*.tar.gz; do
  case $name in
    *api-gateway*) dispatch $name $api_gateway1 $api_gateway2;;
    *eureka*     ) dispatch $name $eureka1 $eureka2;;
    *case*       ) dispatch $name $case1 $case2;;
    *operation*  ) dispatch $name $operation1 $operation2;;
    *dispatch*   ) dispatch $name $dispatch1 $dispatch2;;
    *im*         ) dispatch $name $im1 $im2;;
    *call*       ) dispatch $name $call1 $call2;;
    *attachment* ) dispatch $name $attachment1 $attachment2;;
    *order*      ) dispatch $name $order1 $order2;;
    *core*       ) dispatch $name $core1 $core2;;
    *customer*   ) dispatch $name $customer1 $customer2;;
    *            ) echo Unkown: $name;;
  esac
done