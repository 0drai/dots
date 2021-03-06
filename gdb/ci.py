class ContinueI(gdb.Command):
    """
Continue until instruction with given opcode.

  ci OPCODE

Example:

  ci callq
  ci mov
"""
    def __init__(self):
        super().__init__('ci', gdb.COMMAND_BREAKPOINTS, gdb.COMPLETE_NONE,
                         False)

    def invoke(self, arg, from_tty):
        if len(arg.strip()) == 0:
            gdb.write('Argument missing.\n')
            return

        arg = arg.split()[0]
        thread = gdb.inferiors()[0].threads()[0]
        while thread.is_valid():
            gdb.execute('si', to_string=True)
            frame = gdb.selected_frame()
            arch = frame.architecture()
            pc = gdb.selected_frame().pc()
            instruction = arch.disassemble(pc)[0]['asm']
            if instruction.split()[0] == arg:
                gdb.write(instruction + '\n')
                break


ContinueI()
