${TOTALTEST_JOBCARD}
//***   SPECIFY JOBCARD IN TOTALTEST PREFERENCES TO SUBSTITUTE
//*
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH 
//*** AS NOTIFY=&SYSUID and also a REGION=0M parameter
//*
//********************************************************************
//* Execute Target Runner under TSO using the DSN command
//*    and the RUN subcommand
//********************************************************************
//RUNBD2 EXEC PGM=IKJEFT01,REGION=0M
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the ECC SLCXLOAD 
//* dataset that contains the Topaz for Total Test TTTRUNNR program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//* The third DD statement should be changed to the loadlib
//* containing the TSO DSN command.
//*
//* The fourth DD statement is only required if running the JCL 
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise 
//* it can be removed.
//*
//STEPLIB  DD DISP=SHR,DSN=SYS2.CW.&CWGACX..SLCXLOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.DEV1.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.QA1.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.STG.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.PRD.LOAD
//         DD DISP=SHR,DSN=SALESSUP.CCV1.DEV1.DBRM
//         DD DISP=SHR,DSN=SALESSUP.CCV1.QA1.DBRM
//         DD DISP=SHR,DSN=SALESSUP.CCV1.STG.DBRM
//         DD DISP=SHR,DSN=SALESSUP.CCV1.PRD.DBRM
//         DD DISP=SHR,DSN=DSNB10.DBCC.RUNLIB.LOAD
//         DD DISP=SHR,DSN=DSNB10.SDSNLOAD
//         DD DISP=SHR,DSN=CEE.SCEERUN
//TRPARM DD *
*
*        Optionally set your custom exit program here:
* 
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
//*-----
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*-----
//*-----
//*      Optional
//*      Add your custom DD statements
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSTSPRT DD SYSOUT=*
//EMPFILE  DD DISP=SHR,DSN=FBRCCV0.DEMO.PARM(TTTDATD)
//SLSF001  DD DISP=SHR,DSN=SALESSUP.CCV1.DEV1.DB
//         DD DISP=SHR,DSN=SALESSUP.CCV1.QA1.DB
//         DD DISP=SHR,DSN=SALESSUP.CCV1.STG.DB
//         DD DISP=SHR,DSN=SALESSUP.CCV1.PRD.DB
//*
//* You need to modify the following RUN statement.
//*
//*
//* Change the <SUBSYSTEM ID> to your DB2 subsystem id(SSID).
//* Change the <PLAN NAME> to the plan name for your COBOL test program.
//*
//SYSTSIN  DD *
 DSN SYSTEM(DBCC)
 RUN PROGRAM(TTTRUNNR) PLAN(CWKTDB2X) PARMS('/NOSTAE')
 END
/*
//
