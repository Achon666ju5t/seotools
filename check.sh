#!/bin/bash
#coded by Achon666ju5t
#Traffic Checker with alexa rank 
#Small Seo Tools From INDONESIAN KIDs
putih='\033[0m'
ijo='\e[38;5;82m'
merah='\e[38;5;196m'
 header(){
printf "${ijo}"
printf "   _____         .__                    ________ ________ ________    __      .________ __    \n"
printf "  /  _  \   ____ |  |__   ____   ____  /  _____//  _____//  _____/   |__|__ __|   ____//  |_  \n"
printf " /  /_\  \_/ ___\|  |  \ /  _ \ /    \/   __  \/   __  \/   __  \    |  |  |  \____  \/   __\ \n"
printf "/    |    \  \___|   Y  (  <_> )   |  \  |__\  \  |__\  \  |__\  \   |  |  |  /       \|  |   \n"
printf "\____|__  /\___  >___|  /\____/|___|  /\_____  /\_____  /\_____  /\__|  |____/______  /|__|   \n"
printf "        \/     \/     \/            \/       \/       \/       \/\______|           \/        \n"
printf "${putih}\n"
}
clear
header
ngegad(){
 	set=$1
 	echo -n "Result Simpen di Folder : "
 	read file
 	if [ ! -d $file ]; then
 		mkdir $file
 		echo "[+] $file Created "
 	fi
 	dir="alexa-achonk.txt"
 	printf "You Have `wc -l $set` Site\n"
 	for gad in $(cat $set); do
 		printf "Site -> ${ijo}$gad${putih}\n"
 		echo "Checking Traffic ....."
 	gas1=$(curl -sN  "http://www.statshow.com/www/$gad" --max-time 10| grep -A5 'Worth & Traffic Estimate of' | grep 'box_' | sed s/.*'Daily Pageviews: <span class="red_bold">'/''/ | sed s/'<\/span>.*'/''/)
 	gas2=$(curl -sN  "http://www.statshow.com/www/$gad" --max-time 10| grep -A5 'Worth & Traffic Estimate of' | grep 'box_' | sed s/.*'Daily Pageviews: <span class="red_bold">'/''/ | sed s/'<\/span>.*'/''/)
 	gas3=$(curl -sN  "http://www.statshow.com/www/$gad" --max-time 10| grep -A5 'Worth & Traffic Estimate of' | grep 'box_' | sed s/.*'Monthly Pageviews: <span class="red_bold">'/''/ | sed s/'<\/span>.*'/''/)
 	gas4=$(curl -sN  "http://www.statshow.com/www/$gad" --max-time 10| grep -A5 'Worth & Traffic Estimate of' | grep 'box_' | sed s/.*'Monthly Visitors: <span class="red_bold">'/''/ | sed s/'<\/span>.*'/''/)
 	echo "Checking PA/DA"
 	sleep 2
 	site=$(echo "$gad" | gawk -F/ '{ print $3}')
 	gas5=$(curl -s -X POST --url "http://www.scrolltotop.com/MozRank-Domain-Authority-Checker.php" -d "url_form=$gad" | grep -Po "(?<=\<tr>).*?(?=\<\/tr>)" | gawk -F\< '{ print $6 }' | sed 's|td>||g')
 	gas6=$(curl -s -X POST --url "http://www.scrolltotop.com/MozRank-Domain-Authority-Checker.php" -d "url_form=$gad" | grep -Po "(?<=\<tr>).*?(?=\<\/tr>)" | gawk -F\< '{ print $8 }' | sed 's|td>||g')
 	gas7=$(curl -s "https://www.alexa.com/siteinfo/${site}" | grep -C 2 'Global rank icon' | grep -e ^[0-9] | awk '{print $1}')
 	printf "%-22s : ${ijo}$gas1 ${putih}\n" "Daily visitor" >> $file/$dir
 	printf "%-22s : ${ijo}$gas3 ${putih}\n" "Monythly Page Visitor" >> $file/$dir
 	printf "%-22s : ${ijo}$gas2 ${putih}\n" "Daily PageViewer " >> $file/$dir
 	printf "%-22s : ${ijo}$gas4 ${putih}\n" "Monthly Page Viewer" >> $file/$dir
 	printf "%-22s : ${ijo}$gas6${putih}\n" "Page Authority" >> $file/$dir
 	printf "%-22s : ${ijo}$gas5${putih}\n" "Domain Authority" >> $file/$dir
 	printf "%-22s : ${ijo}$gas7${putih}\n" "Alexa Rank" >> $file/$dir
 	echo "____________________________________________________"  >> $file/$dir
 	echo "____________________________________________________"
 	printf "%-22s : ${ijo}$gas1 ${putih}\n" "Daily visitor"
 	printf "%-22s : ${ijo}$gas3 ${putih}\n" "Monythly Page Visitor"
 	printf "%-22s : ${ijo}$gas2 ${putih}\n" "Daily PageViewer "
 	printf "%-22s : ${ijo}$gas4 ${putih}\n" "Monthly Page Viewer"
 	printf "%-22s : ${ijo}$gas6${putih}\n" "Page Authority"
 	printf "%-22s : ${ijo}$gas5${putih}\n" "Domain Authority"
 	printf "%-22s : ${ijo}$gas7${putih}\n" "Alexa Rank"
 	echo "____________________________________________________"
 done
 }
 if [[ ! -f $1 ]]; then
 	echo "No such file or directory $1"
 	echo "usage $0 <listfile.txt>"
 else
 	ngegad $1
  	echo "Thank's for using my tools"
 fi
