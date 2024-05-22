import lldb
import sys


LLDB_DUMP_FILE = "/Users/user/logs/lldb_dump.log"


def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f ToFile.dump tofile')


# Call this method when you want to redirect the output from lldb to a file,
# instead of outputing to the console.
#
# Copied from: https://stackoverflow.com/a/19332143
def dump(debugger, command, result, internal_dict):
    f = open(LLDB_DUMP_FILE, "w")
    debugger.SetOutputFileHandle(f, True)
    debugger.HandleCommand(command)
    f.close()
    debugger.SetOutputFileHandle(sys.__stdout__, True)
