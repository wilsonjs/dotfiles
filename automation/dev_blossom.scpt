#! /usr/bin/osascript

-- List actions to perform
set actions to {¬
  {action:"cd ~/Projects/blossom; yarn test:unit:watch"}, ¬
  {action:"cd ~/Projects/blossom; rsflow"}, ¬
  {action:"cd ~/Projects/blossom; yarn lint:watch"}, ¬
  {action:"cd ~/Projects/blossom; yarn start:local"} ¬
}
-- Count number of actions
set num_actions to count of actions

-- Start iTerm
tell application "iTerm"
	activate
	
	# Create new tab
	tell current window
		create tab with default profile
	end tell

	-- Split in 2 vertical panes
  tell session 1 of current tab of current window
    set name to "💮 Blossom"
    split vertically with default profile
  end tell
	
	-- Split right vertical pane in 3
  repeat with i from 2 to 3
	  set sessionId to i
    tell session sessionId of current tab of current window
      split horizontally with default profile
    end tell
  end repeat
	
	-- Execute actions
	repeat with i from 1 to num_actions
		tell session i of current tab of current window
			write text (action of item i of actions)
		end tell
	end repeat

-- Have to wait until the above commands are fired before setting the tab name or it gets overwritten by the command being run
delay 1
  repeat with i from 1 to 6
    tell session i of current tab of current window
      set name to "💮 Blossom"
    end tell
  end repeat

end tell
