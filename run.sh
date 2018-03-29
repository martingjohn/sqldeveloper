test -d $HOME/.sqldeveloper || mkdir $HOME/.sqldeveloper
docker run -it \
	--rm \
	--net host \
	--cpuset-cpus 0 \
	--memory 512mb \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-v $HOME/.sqldeveloper:/home/ubuntu/.sqldeveloper \
	-e DISPLAY=unix$DISPLAY \
	--security-opt seccomp=$HOME/chrome.json \
	--device /dev/snd \
	--device /dev/dri \
	-v /dev/shm:/dev/shm \
	--name sqldeveloper \
	sqldeveloper

