import lldb
import sys


def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f ToFile.dump tofile')


def dump(debugger, command, result, internal_dict):
    # source: https://stackoverflow.com/a/30761468
    # TODO: document this
    f = open("/Users/user/logs/lldb_dump.log", "w")
    debugger.SetOutputFileHandle(f, True)
    debugger.HandleCommand(command)
    f.close()
    debugger.SetOutputFileHandle(sys.__stdout__, True)
