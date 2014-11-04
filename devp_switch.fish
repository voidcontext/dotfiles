function devp_switch
	
	set -l DEV_HOME ~/dev

	function unset_project
		set -l DEV_HOME ~/dev
		if test -n "$DEV_PROJECT"
			echo "Stopping current project's containers ($DEV_PROJECT):"
			echo ""
			cd $DEV_HOME/$DEV_PROJECT
			fig stop
		end

		set -Ux DEV_PROJECT 
	end


	if test (count $argv) -eq 0

		if test -n "$DEV_PROJECT"
			echo "Current project is: $DEV_PROJECT"

			cd $DEV_HOME/$DEV_PROJECT
			fig ps
		else 
			echo "There isn't running project"
		end
	else if test (count $argv) -eq 1
		if test $argv[1] = "--unset"
			unset_project
		else 

			cd ~/dev/$argv[1] 2>/dev/null

			if test $status = 0

				unset_project

				set -Ux DEV_PROJECT $argv[1]

				echo "Starting new project's containers ($DEV_PROJECT):"
				echo ""
				cd $DEV_HOME/$DEV_PROJECT
				fig start
			else 
				echo "Invalid project name"
			end 
		end
	else
		echo "Too many arguments"
	end

end
