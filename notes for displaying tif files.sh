#locate to the folder where you store all the tifs
  mkdir movies
  for f in *.tif; do outname=${f%.*}'.mp4'; echo $f '==>' 'movies/'$outname; done
  for f in *.tif; do outname=${f%.*}'.mp4'; convert_tif_to_mp4.py $f 'movies/'$outname -slow_down_factor 0.01; done
  make_montage.sh ./movies > look_at_me.html
