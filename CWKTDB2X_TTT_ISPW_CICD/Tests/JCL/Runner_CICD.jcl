${TOTALTEST_JOBCARD}
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//STEPLIB  DD DISP=SHR,DSN=SYS2.CW.&CWGACX..SLCXLOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.DEV1.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.QA1.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.STG.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.PRD.LOAD
//*         DD DISP=SHR,DSN=DSNB10.DBCC.RUNLIB.LOAD
//*         DD DISP=SHR,DSN=DSNB10.SDSNLOAD
//         DD DISP=SHR,DSN=CEE.SCEERUN
//*
//* The following lines will initialize storage to zeroes to avoid 
//* uninitialized storage assertion miscompares.
//CEEOPTS  DD  *
STORAGE(00,00,00)
/*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
* 
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
/* 
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*      Optionally add your custom DD statements
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSPRT DD SYSOUT=*
//*SLXP0001 DD DISP=SHR,DSN=SALESSUP.CCV1.DEV1.LOAD.SSD
//*         DD DISP=SHR,DSN=SALESSUP.CCV1.QA1.LOAD.SSD
//*         DD DISP=SHR,DSN=SALESSUP.CCV1.STG.LOAD.SSD
//*         DD DISP=SHR,DSN=SALESSUP.CCV1.PRD.LOAD.SSD
//
//*** SPECIFY JOBCARD IN TOTALTEST PREFERENCES TO SUBSTITUTE
//***
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH 
//*** AS NOTIFY=&SYSUID and also a REGION=0M parameter
//*
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the ECC SLCXLOAD 
//* dataset that contains the Topaz for Total Test TTTRUNNR program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//* The third DD statement is only required if running the JCL 
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise 
//* it can be removed.
//*
