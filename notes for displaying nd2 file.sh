#first need to cd to the folder that contains the images
  mkdir movies
  for f in *.nd2; do outname=${f%.*}'.mp4'; echo $f '==>' 'movies/'$outname; done
  for f in *.nd2; do outname=${f%.*}'.mp4'; convert_nd2_to_mp4.py $f 'movies/'$outname -slow_down_factor 0.5 -s 4.44 3.0; done
  make_montage.sh ./movies > look_at_me.html
