function devp_switch
	
	set -l DEV_HOME ~/dev


	if test (count $argv) -eq 0
		echo "Current project is: $DEV_PROJECT"

		if test -n "$DEV_PROJECT"
			cd $DEV_HOME/$DEV_PROJECT
			fig ps
		end
	else if test (count $argv) -eq 1
		cd ~/dev/$argv[1] 2>/dev/null

		if test $status = 0
			if test -n "$DEV_PROJECT"
				echo "Stopping current project's containers ($DEV_PROJECT):"
				echo ""
				cd $DEV_HOME/$DEV_PROJECT
				fig stop
			end

			set -Ux DEV_PROJECT $argv[1]

			echo "Starting new project's containers ($DEV_PROJECT):"
			echo ""
			cd $DEV_HOME/$DEV_PROJECT
			fig start
		else 
			echo "Invalid project name"
		end 
	else
		echo "Too many arguments"
	end

end
