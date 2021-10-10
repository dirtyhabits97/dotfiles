import lldb


def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand(
        'command script add -f SwiftDemangle.swiftDemangle demangle'
    )


def swiftDemangle(debugger, command, result, internal_dict):
    # TODO: document this
    debugger.HandleCommand('sys pbpaste | xcrun swift-demangle')
