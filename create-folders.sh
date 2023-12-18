homeDefault="/home/ebony"
fastStorageDefault=$homeDefault
fastStorage=$fastStorageDefault
symlinkFastStorage=false
slowStorageDefault=$homeDefault
slowStorage=$slowStorageDefault
symlinkSlowStorage=false

for var in "$@"
do
	if [[ "$var" == fast-storage=* ]] then
		fastStorage=${var:13}
		if [[ "$fastStorage" != "$fastStorageDefault" ]] then
			symlinkFastStorage=true
		fi
	elif [[ "$var" == slow-storage=* ]] then
		slowStorage=${var:13}
		if [[ "$slowStorage" != "$slowStorageDefault" ]] then
			symlinkSlowStorage=true
		fi
	fi
done

#create all nessesary folders
mkdir -p "$fastStorage/Data/git"
mkdir -p "$fastStorage/Data/git/Ebony-Ayers"
ln -s /etc/nixos "$fastStorage/Data/git/Ebony-Ayers/nixos-config"
mkdir -p "$fastStorage/Data/gis"
mkdir -p "$fastStorage/Data/code"
mkdir -p "$fastStorage/Data/code/python"
mkdir -p "$fastStorage/Data/code/cpp"
mkdir -p "$slowStorage/Data/Documents"
mkdir -p "$slowStorage/Data/Downloads"
mkdir -p "$slowStorage/Data/Music"
mkdir -p "$slowStorage/Data/Pictures"
mkdir -p "$slowStorage/Data/Videos"
mkdir -p "$homeDefault/previous-generation"

if [[ "$symlinkFastStorage" = true ]] then
	#backup previous folders or symlinks
	mv "$homeDefault/git" "$homeDefault/previous-generation/git.backup"
	mv "$homeDefault/gis" "$homeDefault/previous-generation/gis.backup"
	mv "$homeDefault/code" "$homeDefault/previous-generation/code.backup"
	
	#delete the old folders or symlinks
	rm -rf "$homeDefault/git"
	rm -rf "$homeDefault/gis"
	rm -rf "$homeDefault/code"
	
	#create new symlinks
	ln -s "$fastStorage/Data/git" "$homeDefault/git"
	ln -s "$fastStorage/Data/gis" "$homeDefault/gis"
	ln -s "$fastStorage/Data/code" "$homeDefault/code"
fi

if [[ "$symlinkSlowStorage" = true ]] then
	#backup previous folders or symlinks
	mv "$homeDefault/Documents" "$homeDefault/previous-generation/Documents.backup"
	mv "$homeDefault/Downloads" "$homeDefault/previous-generation/Downloads.backup"
	mv "$homeDefault/Music" "$homeDefault/previous-generation/Music.backup"
	mv "$homeDefault/Pictures" "$homeDefault/previous-generation/Pictures.backup"
	mv "$homeDefault/Videos" "$homeDefault/previous-generation/Videos.backup"
	
	#delete the old folders or symlinks
	rm -rf "$homeDefault/Documents"
	rm -rf "$homeDefault/Downloads"
	rm -rf "$homeDefault/Music"
	rm -rf "$homeDefault/Pictures"
	rm -rf "$homeDefault/Videos"
	
	#create new symlinks
	ln -s "$slowStorage/Data/Documents" "$homeDefault/Documents"
	ln -s "$slowStorage/Data/Downloads" "$homeDefault/Downloads"
	ln -s "$slowStorage/Data/Music" "$homeDefault/Music"
	ln -s "$slowStorage/Data/Pictures" "$homeDefault/Pictures"
	ln -s "$slowStorage/Data/Videos" "$homeDefault/Videos"
fi
