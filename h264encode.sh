#$1 input filename
#$2 no threads to use
#$3 preset ultrafast superfast veryfast faster fast medium slow slower veryslow
#$4 out filename
# -b:v bitrate 512k maybe too low for 720p30 try 1500k to 2000k 
#for fast/quality use realtime 6-7 
#for very good quality use good 2
start=$(date +%s.%N)
ffmpeg -i $1 -r 30 -g 90 -s 1280x720 -aspect 16:9 -c:v libx264 -preset $3  -b:v 2500k -threads $2  -maxrate 3000k -crf 30  $4.mp4

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "Script Execution Time: $execution_time"
