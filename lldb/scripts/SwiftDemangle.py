import lldb


def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand(
        'command script add -f SwiftDemangle.swiftDemangle demangle'
    )


# I found this useful when debugging SwiftUI views in
# the UI inspector / debugger.
#
# 1. Copy a mangled Swift symbol to your pasteboard
# 2. Upon running this command, it will attempt to demangle said symbol
def swiftDemangle(debugger, command, result, internal_dict):
    debugger.HandleCommand('sys pbpaste | xcrun swift-demangle')
