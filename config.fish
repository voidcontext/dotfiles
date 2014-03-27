set PATH /home/pgee/bin $PATH
set PAGER less
set EDITOR /usr/bin/vim

function hg
	if [ $argv[1] = stat ]
		/usr/bin/hg status (hg root) $argv
	else
		/usr/bin/hg $argv
	end
 end

umask 0022
