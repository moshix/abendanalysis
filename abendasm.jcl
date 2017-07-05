//IBMUSERA JOB (BAL),
//             'ABEND STUDY       ',
//             CLASS=A,
//             MSGCLASS=A,
//             TIME=1440,
//             MSGLEVEL=(1,1),REGION=140K
//S010    EXEC ASMFCG,PARM.ASM=(OBJ,DECK,ALOGIC,NUMBER)
/*** MAC1='SYS2.MACLIB',
/**  REGION.GO=128K
//ASM.SYSIN DD *
M12EX2   CSECT
         SAVE  (14,12)                 SAVE REGISTERS ON ENTRY
         BASR  R12,0                   SET UP MY
         USING *,R12                             BASE REGISTER
         ST    R13,SAVEA+4             ENSURE SAVE AREA
         LA    R13,SAVEA                        CHAIN BUILT CORRECTLY.
         L     R11,0(R1)
         OPEN  (OUTDCB,OUTPUT)         OPEN THE FILE.
         LA    R9,NAMETAB              R9  = ADDRRESS OF NAME TABLE
         USING NAMETABD,R9             MAKE NAME ADDRESSABLE
*                                      EDIT HERE
         PACK  DWORD,2(2,R11)          PACK HERE, CAN SOC7 !!!!
         CVB   R10,DWORD
         MH    R10,ENTLEN
         AR    R10,R9
*---------------------------------------------------------------------*
*        ADD THE REQUIRED INSTRUCTIONS AFTER THIS COMMENT BOX.        *
*---------------------------------------------------------------------*
GETNAME  CR    R9,R10                  IS IT END OF TABLE?
         BNL   EXIT                    YEP - THEN QUIT
         MVC   PNAME(L'ENT1),ENTNAME   EXTRACT THE NAME FROM TABLE
         PUT   OUTDCB,OUTAREA          WRITE LINE TO PRINTER, AND
         LA    R9,L'ENT1(R9)           R9 - POINTS TO NEXT ENTRY
         B     GETNAME                 REPEAT TILL TABLE END
EXIT     CLOSE OUTDCB                  CLOSE THE FILE.
         L     R13,SAVEA+4             R13 = PREVIOUS SAVE AREA ADDR.
         RETURN (14,12),RC=0           RETURN TO CALLER (Z/OS)
         LTORG
DWORD    DS    1D
SAVEA    DS    18F                     FOR REGISTER SAVE AREA
OUTDCB   DCB   DSORG=PS,MACRF=PM,DDNAME=OUTDD
*--------S-T-A-R-T----O-F----O-U-T-P-U-T----S-T-R-U-C-T-U-R-E---------*
OUTAREA  DS    0CL121                                                 *
         DC    CL1' '                                                 *
PNAME    DC    CL120' '                                               *
*--------E-N-D----O-F----O-U-T-P-U-T----S-T-R-U-C-T-U-R-E-------------*
*--------S-T-A-R-T----O-F----N-A-M-E----T-A-B-L-E---------------------*
ENTLEN   DC    0H,AL2(L'ENT1)          LENGTH OF ENTRY                *
NAMETAB  DS    0C                      START OF TABLE                 *
ENT1     DC    CL9'ANASTASE'                                          *
         DC    CL9'ALEXANDER'                                         *
         DC    CL9'BILL'                                              *
         DC    CL9'CHERIE'                                            *
         DC    CL9'DAVID'                                             *
         DC    CL9'ELIZABETH'                                         *
         DC    CL9'MOSHIX'                                            *
         DC    CL9'PHILLIP'                                           *
         DC    CL9'SAMANTHA'                                          *
         DC    CL9'TONY'                                              *
NAMETABE DS    0C                      INDICATES END OF TABLE         *
NAMETABD DSECT                                                        *
ENTNAME  DS    C                       SPECIFIC ITEM VALUE            *
M12EX2   CSECT ,                                                      *
*--------E-N-D----O-F----N-A-M-E----T-A-B-L-E-------------------------*
R0       EQU  0
R1       EQU  1
R2       EQU  2
R3       EQU  3
R4       EQU  4
R5       EQU  5
R6       EQU  6
R7       EQU  7
R8       EQU  8
R9       EQU  9
R10      EQU  10
R11      EQU  11
R12      EQU  12
R13      EQU  13
R14      EQU  14
R15      EQU  15
*---------------------------------------------------------------------*
*        THIS IS THE PHYSICAL END OF PROGRAM                          *
*---------------------------------------------------------------------*
         END
/*
//GO.SYSPRINT DD SYSOUT=A
//SYSUDUMP    DD SYSOUT=A
//
