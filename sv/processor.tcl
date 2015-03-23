#-------------------------------------------------------------------------------
# File           : processor.tcl
# Description    : Simvision tcl sctript to display processor waves.
# Primary Author : Lewis Russell
#-------------------------------------------------------------------------------

simvision {
    # Open new waveform window
    window new WaveWindow -name "Waves for MIPS Processor"
    window geometry "Waves for MIPS Processor" 1200x700+60+20
    waveform using "Waves for MIPS Processor"

    # Add signals to wave window
    waveform add -signals processor_tb.Clock
    waveform add -signals processor_tb.nReset
    waveform add -signals processor_tb.PC_ASSERT
    waveform add -signals processor_tb.REG0_ASSERT
    waveform add -signals processor_tb.check_register.REG_DATA_ASSERT.REG_DATA_ASSERT
    waveform add -signals processor_tb.instrData
    waveform add -signals processor_tb.pmodel0.opcode
    waveform add -signals processor_tb.pmodel0.rs_addr
    waveform add -signals processor_tb.pmodel0.rt_addr
    waveform add -signals processor_tb.pmodel0.rd_addr
    waveform add -signals processor_tb.pmodel0.func
    waveform add -signals processor_tb.pmodel0.imm
    waveform add -signals processor_tb.pmodel0.shamt
    waveform add -signals processor_tb.pmodel0.address
    waveform add -signals processor_tb.pmodel0.stall
    group new -name Memory -contents {
        processor_tb.memAddr
        processor_tb.memAddrM
        processor_tb.memRData
        processor_tb.memRDataM
        processor_tb.memReadEn
        processor_tb.memReadEnM
        processor_tb.memWData
        processor_tb.memWDataM
        processor_tb.memWriteEn
        processor_tb.memWriteEnM
        processor_tb.memWriteL
        processor_tb.memWriteR
    }
    set groupId0 [waveform add -groups Memory]
    waveform hierarchy collapse $groupId0
    waveform add -signals processor_tb.rtlPC
    waveform add -signals processor_tb.modelPC
    waveform add -signals processor_tb.regAddr
    waveform format processor_tb.regAddr -radix %d
    waveform add -signals processor_tb.regData
    waveform add -signals processor_tb.register

    # Change radix of register to hex
    set id2 [lindex [waveform hierarchy content $id] 0]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 1]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 2]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 3]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 4]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 5]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 6]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 7]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 8]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 9]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 10]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 11]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 12]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 13]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 14]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 15]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 16]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 17]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 18]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 19]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 20]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 21]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 22]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 23]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 24]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 25]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 26]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 27]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 28]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 29]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 30]
    waveform format $id2 -radix %x
    set id2 [lindex [waveform hierarchy content $id] 31]
    waveform format $id2 -radix %x
}
