import lldb
import optparse
import shlex

def __lldb_init_module(debugger, internal_dict):
    debugger.HandleCommand('command script add -f BreakAfterRegex.breakAfterRegex bar')

def breakAfterRegex(debugger, command, result, internal_dict):
    '''Creates a regular expression breakpoint and adds it.
    Once the breakpoint is hit, control will step out of the current
    function and print the return value. Useful for stopping on
    getter/accessor/initialization methods.
    '''
    command = command.replace('\\', '\\\\')
    command_args = shlex.split(command, posix=False)

    parser = generateOptionParser()

    try:
        (options, args) = parser.parse_args(command_args)
    except:
        result.SetError(parser.usage)
        return

    target = debugger.GetSelectedTarget()
    clean_command = shlex.split(args[0])[0]

    if options.non_regex:
        breakpoint = target.BreakpointCreateByName(clean_command)
    else:
        breakpoint = target.BreakpointCreateByRegex(clean_command)

    if not breakpoint.IsValid() or breakpoint.num_locations == 0:
        result.AppendWarning("Breakpoint isn't valid or hasn't found any hits")
    else:
        result.AppendMessage("{}".format(breakpoint))
    breakpoint.SetScriptCallbackFunction("BreakAfterRegex.breakpointHandler")

def breakpointHandler(frame, bp_loc, dict):
    '''The fuction called when the regular
    expression breakpoint gets triggered
    '''

    thread = frame.GetThread()
    process = thread.GetProcess()
    debugger = process.GetTarget().GetDebugger()

    function_name = frame.GetFunctionName()

    # wait until stepOut completes its execution
    # before handling control back to the python script
    debugger.SetAsync(False)

    # after this line executes
    # we are outside $function_name
    thread.StepOut()

    output = evaluateReturnedObject(debugger,
                                    thread,
                                    function_name)
    if output is not None:
        print(output)

    return False

def evaluateReturnedObject(debugger, thread, function_name):
    '''Grabs the reference from the return register
    and returns a string from the evaluated value.
    TODO ObjC only
    '''

    res = lldb.SBCommandReturnObject()

    interpreter = debugger.GetCommandInterpreter()
    target = debugger.GetSelectedTarget()
    frame = thread.GetSelectedFrame()
    parent_function_name = frame.GetFunctionName()

    expression = 'expression -l objc -O -- {}'.format(getRegisterString(target))

    interpreter.HandleCommand(expression, res)

    if res.HasResult():
        output = '{}\nbreakpoint: '\
                '{}\nobject: '\
                '{}\nstopped: {}'.format('*' * 80,
                                         function_name,
                                         res.GetOutput().replace('\n', ''),
                                         parent_function_name)
        return output
    else:
        return None

def getRegisterString(target):
    triple_name = target.GetTriple()
    if "x86_64" in triple_name:
        return "$rax"
    elif "i386" in triple_name:
        return "$eax"
    elif "arm64" in triple_name:
        return "$x0"
    elif "arm" in triple_name:
        return "$r0"
    raise Exception('Unknown hardare.')

def generateOptionParser():
    '''Gets the return register as a string for lldb
    based upon the hardware
    '''
    usage = "usage: %prog [options] breakpoint_query\n" +\
            "Use 'bar -h' for option desc"

    parser = optparse.OptionParser(usage=usage, prog='bar')
    parser.add_option("-n", "--non_regex",
                      action="store_true",
                      default=False,
                      dest="non_regex",
                      help="Use a non-regex breakpoint instead")
    return parser
