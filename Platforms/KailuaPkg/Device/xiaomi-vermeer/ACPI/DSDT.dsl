/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20230628 (64-bit version)
 * Copyright (c) 2000 - 2023 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of bbbb.aml, Mon Jun 15 12:50:05 2026
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0000060C (1548)
 *     Revision         0x02
 *     Checksum         0xDB
 *     OEM ID           "QCOMM "
 *     OEM Table ID     "SDM8550 "
 *     OEM Revision     0x00000003 (3)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "DSDT", 2, "QCOMM ", "SDM8550 ", 0x00000003)
{
    Scope (_SB)
    {
        Name (PSUB, "MTP08550")
        Name (SOID, 0xFFFFFFFF)
        Name (STOR, 0xABCABCAB)
        Name (SIDS, "899800000000000")
        Name (SIDV, 0xFFFFFFFF)
        Name (SVMJ, 0xFFFF)
        Name (SVMI, 0xFFFF)
        Name (SDFE, 0xFFFF)
        Name (SFES, "899800000000000")
        Name (SIDM, 0x0000000FFFFFFFFF)
        Name (SUFS, 0xFFFFFFFF)
        Name (PUS3, 0xFFFFFFFF)
        Name (SUS3, 0xFFFFFFFF)
        Name (SIDT, 0xFFFFFFFF)
        Name (SOSN, 0xAAAAAAAABBBBBBBB)
        Name (PLST, 0xFFFFFFFF)
        Name (EMUL, 0xFFFFFFFF)
        Name (SJTG, 0xFFFFFFFF)
        Name (RMTB, 0xAAAAAAAA)
        Name (RMTX, 0xBBBBBBBB)
        Name (RFMB, 0xCCCCCCCC)
        Name (RFMS, 0xDDDDDDDD)
        Name (RFAB, 0xEEEEEEEE)
        Name (RFAS, 0x77777777)
        Name (TCMA, 0xDEADBEEF)
        Name (TCML, 0xBEEFDEAD)
        Name (SOSI, 0xDEADBEEFFFFFFFFF)
        Name (PRP0, 0xFFFFFFFF)
        Name (PRP1, 0xFFFFFFFF)
        Name (PRP2, 0xFFFFFFFF)
        Name (PRP3, 0xFFFFFFFF)
        Name (PRP4, 0xFFFFFFFF)
        Name (PRP5, 0xFFFFFFFF)
        Name (PRP6, 0xFFFFFFFF)
        Name (DPP0, Zero)
        Name (CCST, Zero)
        Name (HSFL, Zero)
        Name (QUFN, Zero)

        // ================================
        // 1. UFS0 设备
        // ================================
        Device (UFS0)
        {
            Name (_HID, "QCOM24A5")
            Alias (PSUB, _SUB)
            Alias (^EMUL, EMUL)
            Name (_UID, Zero)
            Name (_CCA, One)

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x01D84000,         // Address Base
                        0x0001C000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000129,
                    }
                })
                Return (RBUF)
            }

            Device (DEV0)
            {
                Method (_ADR, 0, NotSerialized) { Return (0x08) }
                Method (_RMV, 0, NotSerialized) { Return (Zero) }
            }
        }

        // ================================
        // 2. URS0 设备 (USB)
        // ================================
        Device (URS0)
        {
            Method (URSI, 0, NotSerialized)
            {
                If ((QUFN == Zero)) { Return ("QCOM0597") }
                Else { Return ("QCOM0598") }
            }

            Alias (URSI, _HID)
            Name (_CID, Package (0x02) { "PNP0CA1", "QCOMFFE1" })
            Alias (PSUB, _SUB)
            Name (_UID, Zero)
            Name (_CCA, Zero)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x0A600000,         // Address Base
                    0x000FFFFF,         // Address Length
                    )
            })

            Device (USB0)
            {
                Name (_ADR, Zero)
                Name (_S0W, 0x03)
                Name (_CRS, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, ) { 0x000000A5, }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, ) { 0x000000A2, }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, ) { 0x00000206, }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, SharedAndWake, ,, ) { 0x00000208, }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, SharedAndWake, ,, ) { 0x00000209, }
                })

                Device (RHUB)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04) { One, 0x09, Zero, Zero })
                        Name (_PLD, Package (0x01)
                        {
                            ToPLD (
                                PLD_Revision           = 0x2,
                                PLD_IgnoreColor        = 0x1,
                                PLD_Red                = 0x0,
                                PLD_Green              = 0x0,
                                PLD_Blue               = 0x0,
                                PLD_Width              = 0x0,
                                PLD_Height             = 0x0,
                                PLD_UserVisible        = 0x1,
                                PLD_Dock               = 0x0,
                                PLD_Lid                = 0x0,
                                PLD_Panel              = "BACK",
                                PLD_VerticalPosition   = "CENTER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape              = "VERTICALRECTANGLE",
                                PLD_GroupOrientation   = 0x0,
                                PLD_GroupToken         = 0x0,
                                PLD_GroupPosition      = 0x0,
                                PLD_Bay                = 0x0,
                                PLD_Ejectable          = 0x0,
                                PLD_EjectRequired      = 0x0,
                                PLD_CabinetNumber      = 0x0,
                                PLD_CardCageNumber     = 0x0,
                                PLD_Reference          = 0x0,
                                PLD_Rotation           = 0x0,
                                PLD_Order              = 0x0,
                                PLD_VerticalOffset     = 0xFFFF,
                                PLD_HorizontalOffset   = 0xFFFF)
                        })
                    }
                }

                Method (_STA, 0, NotSerialized) { Return (0x0F) }
                Method (DPM0, 1, NotSerialized) { DPP0 = Arg0 }
                Method (CCVL, 0, NotSerialized) { Return (CCST) }
                Method (HSEN, 0, NotSerialized) { Return (HSFL) }

                Method (_DSM, 4, Serialized)
                {
                    Switch (ToBuffer (Arg0))
                    {
                        Case (ToUUID ("ce2ee385-00e6-48cb-9f05-2edb927c4899"))
                        {
                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Switch (ToInteger (Arg1))
                                    {
                                        Case (Zero) { Return (Buffer (One) { 0x1D }) }
                                        Default    { Return (Buffer (One) { 0x01 }) }
                                    }
                                    Return (Buffer (One) { 0x00 })
                                }
                                Case (0x02) { Return (Zero) }
                                Case (0x03) { Return (Zero) }
                                Case (0x04) { Return (0x02) }
                                Default    { Return (Buffer (One) { 0x00 }) }
                            }
                        }
                        Default { Return (Buffer (One) { 0x00 }) }
                    }
                }

                Method (PHYC, 0, NotSerialized)
                {
                    Name (CFG0, Package (0x00) {})
                    Return (CFG0)
                }
            }

            Device (UFN0)
            {
                Name (_ADR, One)
                Name (_S0W, 0x03)

                Device (RHUB)
                {
                    Name (_ADR, Zero)
                    Device (PRT1)
                    {
                        Name (_ADR, One)
                        Name (_UPC, Package (0x04) { One, 0x09, Zero, Zero })
                        Name (_PLD, Package (0x01)
                        {
                            ToPLD (
                                PLD_Revision           = 0x2,
                                PLD_IgnoreColor        = 0x1,
                                PLD_Red                = 0x0,
                                PLD_Green              = 0x0,
                                PLD_Blue               = 0x0,
                                PLD_Width              = 0x0,
                                PLD_Height             = 0x0,
                                PLD_UserVisible        = 0x1,
                                PLD_Dock               = 0x0,
                                PLD_Lid                = 0x0,
                                PLD_Panel              = "BACK",
                                PLD_VerticalPosition   = "CENTER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape              = "VERTICALRECTANGLE",
                                PLD_GroupOrientation   = 0x0,
                                PLD_GroupToken         = 0x0,
                                PLD_GroupPosition      = 0x0,
                                PLD_Bay                = 0x0,
                                PLD_Ejectable          = 0x0,
                                PLD_EjectRequired      = 0x0,
                                PLD_CabinetNumber      = 0x0,
                                PLD_CardCageNumber     = 0x0,
                                PLD_Reference          = 0x0,
                                PLD_Rotation           = 0x0,
                                PLD_Order              = 0x0,
                                PLD_VerticalOffset     = 0xFFFF,
                                PLD_HorizontalOffset   = 0xFFFF)
                        })
                    }
                }

                Name (_CRS, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, ) { 0x000000A5, }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, ) { 0x000000A2, }
                })

                Method (CCVL, 0, NotSerialized) { Return (CCST) }

                Method (_DSM, 4, Serialized)
                {
                    Switch (ToBuffer (Arg0))
                    {
                        Case (ToUUID ("fe56cfeb-49d5-4378-a8a2-2978dbe54ad2"))
                        {
                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Switch (ToInteger (Arg1))
                                    {
                                        Case (Zero) { Return (Buffer (One) { 0x03 }) }
                                        Default    { Return (Buffer (One) { 0x01 }) }
                                    }
                                    Return (Buffer (One) { 0x00 })
                                }
                                Case (One) { Return (0x20) }
                                Default  { Return (Buffer (One) { 0x00 }) }
                            }
                        }
                        Case (ToUUID ("18de299f-9476-4fc9-b43b-8aeb713ed751"))
                        {
                            Switch (ToInteger (Arg2))
                            {
                                Case (Zero)
                                {
                                    Switch (ToInteger (Arg1))
                                    {
                                        Case (Zero) { Return (Buffer (One) { 0x03 }) }
                                        Default    { Return (Buffer (One) { 0x01 }) }
                                    }
                                    Return (Buffer (One) { 0x00 })
                                }
                                Case (One) { Return (0x39) }
                                Default  { Return (Buffer (One) { 0x00 }) }
                            }
                        }
                        Default { Return (Buffer (One) { 0x00 }) }
                    }
                }

                Method (PHYC, 0, NotSerialized)
                {
                    Name (CFG0, Package (0x00) {})
                    Return (CFG0)
                }
            }
        }

        // ================================
        // 3. GPIO 控制器 (TLMM)
        // ================================
        Device (GPI0)
        {
            Name (_HID, "QCOM1000")
            Name (_UID, 0)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x0F000000,         // Address Base
                    0x00100000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x000000D0,
                }
            })

            Name (_STA, 0x0F)
            Name (RBUF, Package () { "gpio-count", 150 })
        }

        // ================================
        // 4. I2C 控制器 (QUP SE4)
        // ================================
        Device (I2C0)
        {
            Name (_HID, "QCOM0110")
            Name (_UID, 0)

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00A90000,         // Address Base
                    0x00004000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x00000165,
                }
            })

            Name (_STA, 0x0F)

            // Goodix 触摸屏
            Device (TPAD)
            {
                Name (_HID, "GDIX2961")
                Name (_CID, "PNP0C50")

                Name (_CRS, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x005D, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.I2C0", 0x00, ResourceConsumer, , Exclusive)
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000, "\\_SB.GPI0", 0x00, ResourceConsumer) { 25 }
                    GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly, "\\_SB.GPI0", 0x00) { 24 }
                })

                Method (_STA, 0, NotSerialized) { Return (0x0F) }
            }
        }

        // ================================
        // 5. 调试 UART (QUP SE7)
        // ================================
        Device (UAR1)
        {
            Name (_HID, "QCOM0050")
            Name (_CID, "PNP0501")
            Name (_UID, 0)
            Name (_STR, Unicode ("Debug UART"))

            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00A9C000,         // Address Base
                    0x00004000,         // Address Length
                    )
                Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                {
                    0x00000243,
                }
            })

            Name (_STA, 0x0F)
            Method (_INI, 0, NotSerialized) {}
        }

        // ================================
        // 6. PCIe Root Bridge (Segment 0)
        // ================================
        Device (PCI0)
        {
            Name (_HID, "PNP0A08")
            Name (_CID, "PNP0A03")
            Name (_SEG, 0)
            Name (_BBN, 0)
            Name (_CCA, 1)
            Name (_STR, Unicode ("PCIe Root Complex 0"))

            Name (_CRS, ResourceTemplate ()
            {
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x0000000000000000,
                    0x0000000060300000,
                    0x0000000063FFFFFF,
                    0x0000000000000000,
                    0x0000000003D00000)
                Memory32Fixed (ReadWrite,
                    0x60000000,         // Address Base
                    0x10000000,         // Address Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,
                    0x0000,
                    0x0FFF,
                    0x0000,
                    0x1000)
            })

            Method (_OSC, 4, NotSerialized)
            {
                CreateDWordField (Arg3, 0, CDW1)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766")))
                {
                    CreateDWordField (Arg3, 4, CDW2)
                    CreateDWordField (Arg3, 8, CDW3)
                    CDW2 = 0x1F
                    CDW3 = 0
                    Return (Arg3)
                }
                CDW1 = 0x04
                Return (Arg3)
            }

            Name (_S0W, 4)
            Name (_PR0, Package () {})
            Name (_PR1, Package () {})
            Name (_PR2, Package () {})
            Name (_PR3, Package () {})
            Name (_PRT, Package ()
            {
                Package () {0x0000FFFF, 0x00, 0x00, 0x10},
                Package () {0x0000FFFF, 0x01, 0x00, 0x11},
                Package () {0x0000FFFF, 0x02, 0x00, 0x12},
                Package () {0x0000FFFF, 0x03, 0x00, 0x13}
            })
        }
    }

    Name (_S0_, Package (0x01) { 0x00 })
    Name (_S1_, Package (0x01) { 0x01 })
    Name (_S3_, Package (0x01) { 0x03 })
    Name (_S4_, Package (0x01) { 0x04 })
    Name (_S5_, Package (0x01) { 0x05 })
}