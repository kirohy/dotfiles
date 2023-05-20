source /opt/ros/melodic/setup.sh

alias roseus='rlwrap roseus'
export ORBgiopMaxMsgSize=2097152000

# NOW_WS=sample
# alias sample-source='source ~/catkin_ws/sample/devel/setup.zsh && NOW_WS=sample'

PS1='%f%F{magenta}[$(date +"%H:%M:%S")]${ISSSH} %f%F{green}%~%f%F{cyan}$(__git_ps1)%f [${NOW_WS}]
%% '

# sample-source

