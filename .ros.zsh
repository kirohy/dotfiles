alias roseus='rlwrap roseus'
export ORBgiopMaxMsgSize=2097152000

NOW_WS=origin
alias origin-source='source /opt/ros/noetic/setup.zsh && NOW_WS=origin'
# alias sample-source='source ~/catkin_ws/sample/devel/setup.zsh && NOW_WS=sample'

PS1='%f%F{magenta}[$(date +"%H:%M:%S")]${ISSSH} %f%F{green}%~%f%F{cyan}$(__git_ps1)%f [${NOW_WS}]
%% '

origin-source

