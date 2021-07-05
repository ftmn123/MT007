#!/usr/bin/env bash
## Update: 2021-06-30
## 更新说明：

## 当前脚本清单（以脚本名前缀排序）
##############################  京  东  商  城  ##############################
## 列表格式： | 脚本名 | 活动名 | 备注内容 |

## 短期或长期活动：
# jd_try.js                    		             京东试用
# jd_wsdlb.js                  	              柠檬我是大老板农场        （需要种水果）
# jd_SplitRedPacket.js                  天降红包                         （默认助力第一个账号）
# jd_ddnc_farmpark.js                  东东乐园
# jd_qqxing.js                               QQ星系牧场                     (每次都要手动打开才能跑)
# jd_europeancup.js                     狂欢欧洲杯                       (默认第一个号给作者助力，后续号给第一个号助力)
# jd_hwsx.js                                  柠檬众筹好物上新
# jd_jxzpk.js 								   京享值PK
# jx_cfdtx.js                                  京喜财富岛提现
# jx_mc_coin.js                             京喜牧场收集金币
# jx_mc_emptycabbage.js            京喜牧场清空白菜
# Andy_sendBeans.js                   送豆得豆
# chinnkarahoi_jd_bookshop.js   口袋书店(修复版)
# long_half_redrain.js                  半点红包雨
# long_super_redrain.js               整点红包雨


## Python 脚本：
## 需要先手动安装环境，进容器执行懒人一键命令： apk --no-cache add -f python3 py3-pip && cd /jd/scripts && pip3 install requests 

# jd_zjd.py                                   赚京豆                             (号多才有用，需配合全局环境变量使用 export zlzh=[''] ，单引号中填入用户名（pt_pin的值）或昵称，理解不了就看脚本里的注释内容，多个号用逗号隔开。需要手动改下定时任务)


## 一次性活动脚本：


##############################  近  期  删  除  的  活  动  脚  本  ##############################
# jd_necklace.js
# ddo_pk.js
# jddj_fruit_code.js
# jd_superBrand.js

##############################  京  东  到  家  ##############################

## jddj_fruit.js                             京东到家 果园任务
## jddj_fruit_collectWater.js       京东到家 果园水车
## jddj_getPoints.js                    京东到家 庄园领水滴
## jddj_bean.js                           京东到家 鲜豆任务
## jddj_plantBeans.js                 京东到家 鲜豆庄园

## 京东到家需开通 "到家果园" 活动，自行挑选水果种植跟东东农场类似
## 不想薅这个APP的羊毛就忽略这些脚本，顺便把定时任务注释掉

## 京东到家账号环境变量（必填）：
## export JDDJ_CKPATH="/jd/scripts/jdCookie.js"       必须指定路径否则会报错

## 提交互助码到公共库（每天早上 7 点）
# https://t.me/passerbybbot

##############################  定  义  下  载  代  理  （内置功能）  ##############################
if [[ ${EnableExtraShellProxyDownload} == true ]]; then
  DownloadJudgment=${ExtraShellProxyUrl}
else
  DownloadJudgment=
fi

##############################  作  者  昵  称  &  脚  本  地  址  &  脚  本  名  称  （必填）  ##############################

author_list="ftmn123 passerby-b LongZhuZhu panghu moposmall zsm85887823 SuperManito curtinlv"

## 京喜财富岛
scripts_base_url_1=${DownloadJudgment}https://github.com/ftmn123/MT007/blob/master/
my_scripts_list_1="sendNotify.js mtd_q_j_d.js mtd_super_Brand.js mtd_t_r_y.js mtx_dream_Factory.js mtd_qq_xing.js mtd_european_cup.js"

## 京东到家
scripts_base_url_2=${DownloadJudgment}https://raw.githubusercontent.com/passerby-b/JDDJ/main/
my_scripts_list_2="jddj_fruit.js jddj_fruit_collectWater.js jddj_bean.js jddj_plantBeans.js jddj_getPoints.js jddj_cookie.js"

## 龙王
scripts_base_url_3=${DownloadJudgment}https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/
my_scripts_list_3="long_half_redrain.js long_super_redrain.js"


## 柠檬/panghu
scripts_base_url_4=${DownloadJudgment}https://raw.githubusercontent.com/panghu999/panghu/master/
my_scripts_list_4="jd_wsdlb.js jd_hwsx.js"

## moposmall
scripts_base_url_5=${DownloadJudgment}https://raw.githubusercontent.com/moposmall/Script/main/Me/
my_scripts_list_5="jx_mc_coin.js jx_mc_emptycabbage.js"

## Andy
scripts_base_url_6=${DownloadJudgment}https://raw.githubusercontent.com/zsm85887823/AndyJD/main/own/
my_scripts_list_6="Andy_sendBeans.js"

## 京享值pk
scripts_base_url_7=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_7="jd_jxzpk.js"

## 皮卡丘
scripts_base_url_8=${DownloadJudgment}https://raw.githubusercontent.com/curtinlv/JD-Script/main/
my_scripts_list_8="jd_zjd.py"

## 免责声明：当作者的脚本不可拉取时，会临时启用别人 FORK 或搬运的库代替“官方渠道”

##############################  随  机  函  数  ##############################
rand() {
  min=$1
  max=$(($2 - $min + 1))
  num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
  echo $(($num % $max + $min))
}
cd ${ShellDir}
index=1
for author in $author_list; do
  echo -e "开始下载 $author 的活动脚本：\n"
  eval scripts_list=\$my_scripts_list_${index}
  eval url_list=\$scripts_base_url_${index}
  for js in $scripts_list; do
    eval url=$url_list$js
    echo $url
    eval name=$js
    echo $name
    wget -q --no-check-certificate $url -O scripts/$name.new

    if [ $? -eq 0 ]; then
      mv -f scripts/$name.new scripts/$name
      echo -e "更新 $name 完成...\n"
      croname=$(echo "$name" | awk -F\. '{print $1}')
      script_date=$(cat scripts/$name | grep "http" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5}' | sort | uniq | head -n 1)
      if [ -z "${script_date}" ]; then
        cron_min=$(rand 1 59)
        cron_hour=$(rand 7 9)
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${cron_min} ${cron_hour} * * * bash jd $croname" ${ListCron}
      else
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${script_date} bash jd $croname" ${ListCron}
      fi
    else
      [ -f scripts/$name.new ] && rm -f scripts/$name.new
      echo -e "更新 $name 失败，使用上一次正常的版本...\n"
    fi
  done
  index=$(($index + 1))
done

##############################  自  定  义  命  令  ##############################

## 修正定时
grep -q "jdJxncTokens" ${ListCron} && sed -i '/&*jdJxncTokens/c#4 8 * * * bash jd jdJxncTokens' ${ListCron}
grep -q "jddj_cookie" ${ListCron} && sed -i '/&*jddj_cookie/c#29 9 * * * bash jd jddj_cookie' ${ListCron}
grep -q "jd_qqxing" ${ListCron} && sed -i '/&*jd_qqxing/c30 7 * * * bash jd jd_qqxing' ${ListCron}

## 删除过期脚本和其定时
rm -rf ${ScriptsDir}/jd_necklace.js
rm -rf ${ScriptsDir}/ddo_pk.js && sed -i "/ddo_pk/d" ${ListCron}
rm -rf ${ScriptsDir}/jddj_fruit_code.js && sed -i "/jddj_fruit_code/d" ${ListCron}
rm -rf ${ScriptsDir}/jd_superBrand.js && sed -i "/jd_superBrand/d" ${ListCron}
