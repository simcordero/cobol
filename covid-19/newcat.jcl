//NEWCAT JOB 1,NOTIFY=&SYSUID,CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1)
//      EXEC PGM=IEFBR14
//NEWDS DD DSN=&SYSUID..NCOV19,DISP=(NEW,CATLG),VOL=SER=VPWRKA,
//         UNIT=3390,SPACE=(CYL,(3,1,25)),
//         DCB=(RECFM=FB,LRECL=130,BLKSIZE=130)
//