import pynvim
import rospkg
import os

@pynvim.plugin
class RosUtilsPlugin(object):

    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command('Roscd', nargs='*')
    def roscd(self, args):
        rp = rospkg.RosPack()
        if len(args) == 0:
            cmake_prefix_path = os.environ['CMAKE_PREFIX_PATH']
            workspace_devel_path = cmake_prefix_path.split(':')
            self.nvim.chdir(workspace_devel_path[0] + '/../src')
        else:
            try:
                package_path = rp.get_path(args[0])
            except rospkg.ResourceNotFound:
                self.nvim.err_write('ROS Package not found\n')
                return
            self.nvim.chdir(package_path)

