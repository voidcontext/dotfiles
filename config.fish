set PATH /home/pgee/bin /home/pgee/.composer/vendor/bin $PATH
set PAGER less
set EDITOR /usr/bin/vim
set MYSQL_PS1 "\u@\h [\d]> "

function hg
	if [ $argv[1] = stat ]
		/usr/bin/hg status (hg root) $argv
	else
		/usr/bin/hg $argv
	end
 end

function cdhr
	cd (hg root)
end

umask 0022
