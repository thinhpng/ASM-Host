/*--------------------------------------------------------------------------
' File: secsim.sml      Version: 2.01                         Date: 01-28-98
'
' Description:
'    This file contains one each of all SECS-II messages.
'    (c) Copyright 1985-96 GW Associates, Inc.
'    All rights reserved.
'    Copy license granted to registered SECSIM/SECSIM Pro Users.
'
' Author(s):
'    GW Associates Staff
'
' Cautions:
'
' Mods:
'    Date     Who Description
'    -------- --- -------------------------------------------------------
'    11-05-95 GW  1) Copied from SECSIM file simmsg2.sml
'    12-06-95 GW  1) Added Stream 14 and updated for 1995 SECS-II standard
'                 2) Changed one line comments to use C-style comments to
'                    be compatible with SSL commenting style.
'    12-07-95 GW  1) Changed all BOOLEANS to use 1 or 0, not T or F, this way
'                    if the SML is copied to an SSL file it will compile
'                    correctly, since SSL would treat T and F as variables.
'                 2) Changed all ' to " so SSL would understand.
'                 3) Changed all Binary's (<B 0>) to use <B 0x0> hex notation,
'                    again for SSL compatibility.
'    05-14-96 GW  1) Fixed several Binary data items to match the old DOS
'                    SECSIM file simmsg2.sml
'    12-04-96 dlr Prepared for 1.1 Release
'    05-20-97 jrh Added new messages from 1996 standard
'    11-18-97 jrh Changes and new messages for September 1997 standard
'    01-28-98 jrh Fix S16F7, F9
'--------------------------------------------------------------------------*/
/* Stream 1 Abort */
S1F0 .

/* Are You There */
S1F1 W .

/* On Line Data */
S1F2
    <L> .

/* Selected Equipment Status Request */
S1F3 W
    <L
        <U2 1>      /* SVID */
        > .

/* Selected Equipment Status Data */
S1F4
    <L
        <I2 1>      /* SV */
        > .

/* Formatted Status Request */
S1F5 W
    <B 0x01> .      /* SFCD */

/* Formatted Status Data */
'S1F6'
    <L
       <I2>
       <I2>
       > .

/* Fixed Form Request */
S1F7 W
    <B 0x01> .      /* SFCD */

/* Fixed Form Data */
'S1F8'
    <L
        <L [2]
            <A "AAAA  ">
            <I2 7>
        >
        <L [2]
            <A "BBBB  ">
            <I2 7>
        >
    > .

/* Material Transfer Status Request */
S1F9 W .

/* Material Transfer Status Data */
S1F10
    <L [2]
        <B 0x01>        /* TSIP */
        <B 0x01>        /* TSOP */
        > .

/* Status Variable Namelist Request */
S1F11 W
    <L
        <U2 1>          /* SVID */
        >.

/* Status Variable Namelist Reply */
S1F12
    <L
        <L [3]
            <U2 1>          /* SVID */
            <A "SETPOINT">  /* SVNAME */
            <A "">      /* UNITS */
            >
        >.

/* Establish Communications Request */
// S1F13 W
    // <L> .

/* Establish Communications Request Acknowledge */
// S1F14
    // <L
        // <B 0x00>        /* COMMACK */
        // <L>
        // > .

/* Request OFF-LINE */
S1F15 W.

/* OFF-LINE Acknowledge */
S1F16
    <B 0x00>.           /* OFLACK */

/* Request ON-LINE */
S1F17 W.

/* ON-LINE Acknowledge */
S1F18
    <B 0x00>.           /* ONLACK */

/* Get Attribute */
S1F19 W
    <L [3]
        <U2 100>        /* OBJTYPE */
        <L
            <U2 1>      /* OBJID */
            <U2 2>      /* OBJID */
        >
        <L
            <U2 10>     /* ATTRID */
            <U2 11>     /* ATTRID */
            <U2 12>     /* ATTRID */
        >
    >.

/* Attribute Data */
S1F20
    <L [2]
        <L
            <L
                <A "Length">            /* ATTRDATA */
                <A "Width">             /* ATTRDATA */
            >
            <L
                <A "Length">            /* ATTRDATA */
                <A "Width">             /* ATTRDATA */
            >
        >
        <L
            <L [2]
                <U2 2>                  /* ERRCODE */
                <A "Unknown Object ID"> /* ERRTEXT */
            >
        >
    >.

/* Stream 2 Abort */
S2F0 .

/* Service Program Load Inquire */
S2F1 W
    <L [2]
        <A "SP0001">        /* SPID */
        <U2 128>            /* LENGTH */
        > .

/* Service Program Load Grant */
S2F2
    <B 0x00> .              /* GRANT */

/* Service Program Send */
S2F3 W
    <B 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       > .
/* Service Program Acknowledge */
S2F4
    <B 0x00> .

/* Service Program Load Request */
S2F5 W
    <A "SP0001"> .

/* Service Program Load Data */
S2F6
    <B 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
       > .

/* Service Program Run Send */
S2F7 W
    <A "SP0001"> .

/* Service Program Run Acknowledge */
S2F8
    <B 0x00> .

/* Service Program Results Request */
S2F9 W
    <A "SP0001"> .

/* Service Program Results Data */
'S2F10'
    <B 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF> .

/* Service Program Directory Request */
S2F11 W .

/* Service Program Directory Data */
S2F12
    <L
        <A "SP0001">
        <A "SP0002">
        > .

/* Equipment Constant Request */
S2F13 W
    <L
        <U2 1>          /* ECID */
        > .
/* Equipment Constant Data */
S2F14
    <L
        <I2 1>          /* ECV */
        > .

/* New Equipment Constant Send */
S2F15 W
    <L
        <L [2]
            <U4 17635121>   /* ECID */
            <U2 12>      	/* ECV */
		>
        <L [2]
            <U4 17635041>   /* ECID */
            <F4 140.0>      	/* ECV */
		>	
	> .
/* New Equipment Constant Acknowledge */
S2F16
    <B 0x00> .

/* Date and Time Request */
S2F17 W .

/* Date and Time Data */
S2F18
    <A "850101123000"> .

/* Reset/Initialize Send */
S2F19 W
    <U1 1> .

/* Reset Acknowledge */
S2F20
    <U1 0> .

/* Remote Command Send */
S2F21 W
    <U1 1> .

/* Remote Command Acknowledge */
S2F22
    <U1 0> .

/* Trace Initialize Send */
S2F23 W
    <L [5]
        <U2 1>
        <A "000100">
        <U2 1>
        <U2 1>
        <L
            <U2 1>      /* SVID */
            >
        > .
/* Trace Initialize Acknowledge */
S2F24
    <B 0x00> .

/* Loopback Diagnostic Request */
S2F25 W
    <B  0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07
        0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F
        0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17
        0x18 0x19 0x1A 0x1B 0x1C 0x1D 0x1E 0x1F
        0xF0 0xF1 0xF2 0xF3 0xF4 0xF5 0xF6 0xF7
        0xF8 0xF9 0xFA 0xFB 0xFC 0xFD 0xFE 0xFF> .

/* Loopback Diagnostic Data */
S2F26
    <B  0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07
        0x08 0x09 0x0A 0x0B 0x0C 0x0D 0x0E 0x0F
        0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17
        0x18 0x19 0x1A 0x1B 0x1C 0x1D 0x1E 0x1F
        0xF0 0xF1 0xF2 0xF3 0xF4 0xF5 0xF6 0xF7
        0xF8 0xF9 0xFA 0xFB 0xFC 0xFD 0xFE 0xFF> .

/* Initiate Processing Request */
S2F27 W
    <L [3]
        <B 0x00>
        <A "PP01            ">
        <L
            <A "LOT01           ">
            >
        > .

/* Initiate Processing Acknowledge */
S2F28
    <U1 0> .

/* Equipment Constant Namelist Request */
S2F29 W
    <L
        <U2 1>              /* ECID */
        >.

/* Equipment Constant Namelist Request : All EC's */
all: S2F29 W
    <L>.

/* Equipment Constant Namelist Data */
S2F30
    <L
        <L [6]
            <U2 1>          /* ECID */
            <A "SPINRATE">  /* ECNAME */
            <U2 10>         /* ECMIN */
            <U2 100>        /* ECMAX */
            <U2 25>         /* ECDEF */
            <A "Hz">        /* UNITS */
            >
        > .

/* Date and Time Set Request */
S2F31 W
    <A "950519143000"> .

/* Date and Time Set Acknowledge */
S2F32
    <B 0x00> .

/* Define Report */
S2F33 W
    <L [2]
        <U2 0>              /* DATAID */
        <L
            <L [2]
                <U2 1>      /* RPTID */
                <L
                    <U2 1>  /* VID */
                    >
                >
            >
        > .

/* Define Report Acknowledge */
S2F34
    <B [1] 00> .            /* DRACK */

/* Link Event/Report */
S2F35 W
    <L [2]
        <U2 0>              /* DATAID */
        <L
            <L [2]
                <U2 1>      /* CEID */
                <L
                    <U2 1>  /* RPTID */
                    >
                >
            >
        > .

/* Line Event/Report */
S2F35_del: S2F35 W
    <L [2]
        <U2 0>              /* DATAID */
        <L
            <L [2]
                <U2 1>      /* CEID */
                <L>
                >
            >
        > .


/* Link Event/Report Acknowledge */
S2F36
    <B [1] 00> .            /* LRACK */

/* Enable/Disable Event Report */
S2F37 W
    <L [2]
        <BOOLEAN 0x1>         /* CEED */
        <L
            <U2 1>          /* CEID */
            <U2 2>          /* CEID */
            <U2 3>          /* CEID */
            >
        > .
/* Enable/Disable Event Report */
S2F37_1: S2F37 W
    <L
        <BOOLEAN 0x1>         /* CEED */
        <L>
    > .

/* Enable/Disable Event Report Acknowledge */
S2F38
    <B [1] 00> .            /* ERACK */

/* Multi-Block Inquire */
S2F39 W
    <L
        <U2 0>              /* DATAID */
        <U2 512>            /* DATALENGTH */
        > .

/* Multi-Block Grant */
S2F40
    <B [1] 00> .            /* GRANT */

/* Host Command Send */
S2F41 W
    <L [2]
        <A "RCMD">              /* RCMD */
        <L
            <L [2]
                <A "CPNAME1">   /* CPNAME */
                <A "CPVAL1">    /* CPVAL */
            >
            <L [2]
                <A "CPNAME2">   /* CPNAME */
                <A "CPVAL2">    /* CPVAL */
            >
        >
    > .

/* Host Command Acknowledge */
S2F42
    <L [2]
        <B 0x00>                /* HCACK */
        <L>
    > .

/* Reset Spooling Streams and Functions */
S2F43 W
    <L
        <L [2]
            <U1 2>              /* STRID */
            <L
                <U1 3>          /* FCNID */
                <U1 5>          /* FCNID */
                >
            >
        <L [2]
            <U1 7>              /* STRID */
            <L
                <U1 3>          /* FCNID */
                <U1 5>          /* FCNID */
                >
            >
        > .
/* Reset Spooling Acknowledge */
S2F44
    <L [2]
        <B 0x01>                /* RSACK */
        <L
            <L [3]
                <U1 2>          /* STRID */
                <B 0x01>        /* STRACK */
                <L
                    <U1 5>      /* FCNID */
                    >
                >
            <L [3]
                <U1 7>          /* STRID */
                <B 0x01>        /* STRACK */
                <L
                    <U1 3>      /* FCNID */
                    <U1 5>      /* FCNID */
                    >
                >
            >
        > .

/* Define Variable Limit Attributes */
S2F45 W
    <L
        <U2 0>                  /* DATAID */
        <L
            <L [2]
                <U2 11000>      /* VID */
                <L
                    <L [2]
                        <B 0x01>        /* LIMITID */
                        <L
                            <F4 11.0>   /* UPPERDB */
                            <F4 10.0>   /* LOWERDB */
                            >
                        >
                    <L [2]
                        <B 0x02>        /* LIMITID */
                        <L
                            <F4 21.0>   /* UPPERDB */
                            <F4 20.0>   /* LOWERDB */
                            >
                        >
                    >
                >
            >
        > .

/* Define Variable Limit Attributes */
S2F45_1: S2F45 W
    <L
        <U2 0>                  /* DATAID */
        <L
            <L [2]
                <U2 1>          /* VID */
                <L
                    <L [2]
                        <B 0x01>        /* LIMITID */
                        <L
                            <F4 40.0>   /* UPPERDB */
                            <F4 39.0>   /* LOWERDB */
                        >
                    >
                >
            >
        >
    >.

/* Variable Limit Attribute Acknowledge */
S2F46
    <L [2]
        <B 0x01>                /* VLAACK */
        <L
            <L [3]
                <U2 1>          /* VID */
                <B 0x04>        /* LVACK */
                <L
                    <B 0x01>    /* LIMITID */
                    <B 0x02>    /* LIMITACK */
                    >
                >
            >
        > .

/* Variable Limit Attribute Request */
S2F47 W
    <L
        <U2 11000>          /* VID */
        <U2 2>          /* VID */
        > .

/* Variable Limit Attributes Send */
S2F48
    <L
        <L [2]
            <U2 1>              /* VID */
            <L [4]
                <A "degC">      /* UNITS */
                <U2 200>        /* LIMITMIN */
                <U2 300>        /* LIMITMAX */
                <L
                    <L [3]
                        <B 0x01> /* LIMITID */
                        <U2 230> /* UPPERDB */
                        <U2 220> /* LOWERDB */
                        >
                    <L [3]
                        <B 0x02> /* LIMITID */
                        <U2 270> /* UPPERDB */
                        <U2 260> /* LOWERDB */
                        >
                    >
                >
            >
        <L [2]
            <U2 2>              /* VID */
            <L [4]
                <A "s">         /* UNITS */
                <U1 40>         /* LIMITMIN */
                <U1 55>         /* LIMITMAX */
                <L
                    <L [3]
                        <B 0x03>/* LIMITID */
                        <U1 45> /* UPPERDB */
                        <U1 50> /* LOWERDB */
                        >
                    >
                >
            >
        > .

/* Enhanced Remote Command */
S2F49 W
    <L[4]
        <U1 0>                  /* DATAID */
        <A "OBJECT" >           /* OBJSPEC */
        <A "REMOTE" >           /* RCMD */
        <L[2]
            <L[2]
                <A "COMMAND1">  /* CPNAME */
                <B 0x00 >       /* CEPVAL */
            >
            <L[2]
                <A "COMMAND2">  /* CPNAME */
                <B 0x01 >       /* CEPVAL */
            >
        >
    >.

/* Enhanced Remote Command Acknowledge */
S2F50
    <L[2]
         <B 0x00>   /* HCACK */
         <L[2]
             <L[2]
                 <A "COMMAND1">   /* CPNAME */
                 <U1 1 >          /* CEPACK */
             >
             <L[2]
                 <A "COMMAND2">   /* CPNAME */
                 <U1 0 >          /* CEPACK */
             >
         >
     >.

/* Stream 3 Abort */
S3F0 .

/* Material Status Request */
S3F1 W .

/* Material Status Data */
S3F2
    <L [2]
        <B 0x01>
        <L
            <L [3]
                <B 0x07>
                <B 0x01>
                <A "LOT01           ">
                >
            >
        > .

/* Time to Completion Request */
S3F3 W .

/* Time to Completion Data */
S3F4
    <L [2]
        <B 0x01>
        <L
            <L [3]
                <U2 120>
                <B 0x01>
                <A "LOT01           ">
                >
            >
        > .

/* Material Found Send */
S3F5 W
    <L [2]
        <B 0x07>
        <B 0x01>
        > .
/* Material Found Acknowledge */
S3F6
    <B 0x00> .

/* Material Lost Send */
S3F7 W
    <L [3]
        <B 0x01>
        <B 0x01>
        <A "WAFER001        ">
        > .

/* Material Lost Acknowledge */
S3F8
    <B 0x00> .

/* Material ID Equate Send */
S3F9 W
    <L [2]
        <A "LOT01           ">
        <A "CASSETTE29      ">
        > .

/* Material ID Equate Acknowledge */
S3F10
    <B 0x00> .

/* Material ID Request */
S3F11 W
    <B 0x01> .

/* Material ID Request Acknowledge */
S3F12
    <L [3]
        <B 0x01>
        <B 0x00>
        <A "LOT01           ">
        > .

/* Material ID Send */
S3F13 W
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Material ID Acknowledge */
S3F14
    <B 0x00> .

/* Testing ProceedWithCarrier Command */
S3F17_ProceedWithCarrier_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [18] 'ProceedWithCarrier' >
		<A [1] '1'>				
		<U1 [1] 1 >				
		<L>
	>.
	
S3F17_ProceedWithCarrier_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [18] 'ProceedWithCarrier' >
		<A [1] '2'>				
		<U1 [1] 2 >				
		<L>
	>.

/* Testing CancelCarrier Command */
S3F17_CancelCarrier_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [13] 'CancelCarrier' >	// Command
		<A ''>					
		<U1 [1] 1 >					// PortId 
		<L>
	>.

S3F17_CancelCarrier_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [13] 'CancelCarrier' >	// Command
		<A ''>					
		<U1 [1] 2 >					// PortId 
		<L>
	>.
	
/* Testing CancelCarrierAtPort Command */
S3F17_CancelCarrierAtPort_1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [19] 'CancelCarrierAtPort' >
		<A ''>				
		<U1 [1] 1 >				
		<L>
	>.

S3F17_CancelCarrierAtPort_2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [19] 'CancelCarrierAtPort' >
		<A [1] '2'>				
		<U1 [1] 2 >				
		<L>
	>.

/* Testing Bind Command */
S3F17_Bind_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [4] 'Bind' >
		<A [1] '1'>				
		<U1 [1] 1 >				
		<L>
	>.

S3F17_Bind_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [4] 'Bind' >
		<A [1] '2'>				
		<U1 [1] 2 >				
		<L>
	>.
	
/* Testing CancelBind Command */
S3F17_CancelBind_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [10] 'CancelBind' >
		<A [1] '1'>				
		<U1 [1] 1 >				
		<L>
	>.

S3F17_CancelBind_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [10] 'CancelBind' >
		<A [1] '2'>				
		<U1 [1] 2 >				
		<L>
	>.

/* Testing CancelCarrierNotification Command */
S3F17_CancelCarrierN_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [25] 'CancelCarrierNotification' >
		<A [1] '1'>				
		<U1 [1] 1 >				
		<L>
	>.

S3F17_CancelCarrierN_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [25] 'CancelCarrierNotification' >
		<A [1] '2'>				
		<U1 [1] 2 >				
		<L>
	>.

/* Testing CarrierOut Command */
S3F17_CarrierOut_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [10] 'CarrierOut' >
		<A [1] '1'>				
		<U1 [1] 1 >				
		<L>
	>.

S3F17_CarrierOut_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [10] 'CarrierOut' >
		<A [1] '2'>				
		<U1 [1] 2 >				
		<L>
	>.
	
/* Testing CarrierReCreate Command */
S3F17_CarrierReCreate_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [15] 'CarrierReCreate' >
		<A ''>				
		<U1 [1] 1 >				
		<L>
	>.
	
S3F17_CarrierReCreate_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [15] 'CarrierReCreate' >
		<A [7] 'NewName'>				
		<U1 [1] 2 >				
		<L>
	>.

/* Testing CarrierRelease Command */
S3F17_CarrierRelease_P1: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [14] 'CarrierRelease' >
		<A ''>				
		<U1 [1] 1 >				
		<L>
	>.

S3F17_CarrierRelease_P2: 'S3F17' W
	<L [5] 
		<U4 [1] 1 >
		<A [14] 'CarrierRelease' >
		<A ''>				
		<U1 [1] 2 >				
		<L>
	>.
	
/* Stream 4 Abort */
S4F0 .

/* Ready to Send Material */
S4F1 W
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Ready to Send Acknowledge */
S4F2
    <B 0x00> .

/* Send Material */
S4F3
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Handshake Complete */
S4F5
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Not Ready to Send */
S4F7
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Stuck in Sender */
S4F9
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Stuck in Receiver */
S4F11
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Send Incomplete Timeout */
S4F13
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Material Received */
S4F15
    <L [2]
        <B 0x01>
        <A "LOT01           ">
        > .

/* Request to Receive */
S4F17 W
    <L [2]
        <B 0x01>                    /* PTN */
        <A "LOT01           ">      /* MID */
        > .

/* Request to Receive Acknowledge */
S4F18
    <B 0x00> .                      /* RRACK */

/* Transfer Job Create */
S4F19 W
    <L [2]
        <U4 1>                  /* DATAID */
        <L [2]
            <A "WAFER MOVE">    /* TRJOBNAME */
            <L
                <L [12]
                    <U2 50>             /* TRLINK */
                    <U2 2>              /* TRPORT */
                    <A "WAFER">         /* TROBJNAME */
                    <U2 3>              /* TROBJTYPE */
                    <U1 1>              /* TRROLE */
                    <A "RECIPE1">       /* TRRCP */
                    <A "TRACK#1">       /* TRPTNR */
                    <U2 1>              /* TRPTPORT */
                    <U1 1>              /* TRDIR */
                    <U1 1>              /* TRTYPE */
                    <U2 2>              /* TRLOCATION */
                    <BOOLEAN 0x1>         /* TRAUTOSTART */
                >
            >
        >
    >.

/* Transfer Job Acknowledge */
S4F20
    <L [3]
        <B 0x01>                /* TRJOBID */
        <L
            <U2 1>              /* TRATOMICID */
            <U2 2>              /* TRATOMICID */
        >
        <L [2]
            <BOOLEAN 0x00>         /* TRACK */
            <L
                <L [2]
                    <U2 1>              /* ERRCODE */
                    <A "Error Message"> /* ERRTEXT */
                >
            >
        >
    >.

/* Transfer Job Command */
S4F21 W
    <L [3]
        <B 0x01>        /* TRJOBID */
        <A "PAUSE">     /* TRCMDNAME */
        <L>             /* Command Parameters */
    >.

/* Transfer Command Acknowledge */
S4F22
    <L [2]
        <BOOLEAN 0x1>     /* TRACK */
        <L>
    >.

/* Transfer Job Alert */
S4F23 W
    <L [4]
        <B 0x01>                /* TRJOBID */
        <A "WAFER MOVE">        /* TRJOBNAME */
        <U1 1>                  /* TRJOBMS */
        <L [2]
            <BOOLEAN 0x1>         /* TRACK */
            <L>
        >
    >.

/* Transfer Alert Acknowledge */
S4F24.

/* Multi-Block Inquire */
S4F25 W
    <L [2]
        <U4 1>          /* DATA ID */
        <U4 500>        /* DATALENGTH */
    >.

/* Multi-Block Grant */
S4F26
    <B 0x00>.

/* Handoff Ready */
S4F27
    <L [2]
        <A "MACHINE 1">         /* EQNAME */
        <L [10]
            <U2 50>             /* TRLINK */
            <U2 2>              /* TRPORT */
            <A "WAFER">         /* TROBJNAME */
            <U2 3>              /* TROBJTYPE */
            <U1 1>              /* TRROLE */
            <A "TRACK#1">       /* TRPTNR */
            <U2 1>              /* TRPTPORT */
            <U1 1>              /* TRDIR */
            <U1 1>              /* TRTYPE */
            <U2 2>              /* TRLOCATION */
        >
    >.

/* Handoff Command */
S4F29
    <L [4]
        <U2 50>                 /* TRLINK */
        <U2 3>                  /* MCINDEX */
        <A "GRAB WAFER">        /* HOCMDNAMDE */
        <L>
    >.

/* Handoff Command Complete */
S4F31
    <L [3]
        <U2 50>                 /* TRLINK */
        <U2 3>                  /* MCINDEX */
        <L [2]
            <BOOLEAN 0x1>         /* HOACK */
            <L>
        >
    >.

/* Handoff Verified */
S4F33
    <L [2]
        <U2 50>                 /* TRLINK */
        <L [2]
            <BOOLEAN 0x1>         /* HOACK */
            <L>
        >
    >.

/* Handoff Cancel Ready */
S4F35
    <U2 50>.            /* TRLINK */

/* Handoff Cancel Ready Acknowledge */
S4F37
    <L [2]
        <U2 50>                 /* TRLINK */
        <U1 0>                  /* HOCANCELACK */
    >.

/* Handoff Halt */
S4F39
    <U2 50>.            /* TRLINK */

/* Handoff Halt Acknowledge */
S4F41
    <L [2]
        <U2 50>                 /* TRLINK */
        <U1 0>                  /* HOHALTACK */
    >.


/* Stream 5 Abort */
S5F0 .

/* Alarm Report Send */
S5F1 W
    <L [3]
        <B 0x06>
        <U2 1>
        <A "EQUIP ERR       ">
        > .

/* Alarm Report Send without W-Bit */
S5F1A: S5F1
    <L [3]
        <B 0x06>
        <U2 1>
        <A "EQUIP ERR       ">
        > .

/* Alarm Report Acknowledge */
S5F2
    <B 0x00> .

/* Enable/Disable Alarm Send */
S5F3 W
    <L [2]
        <B 80>
        <U2 1>
        > .

/* Enable/Disable Alarm Acknowledge */
S5F4
    <B 0x00> .

/* List Alarms Request */
S5F5 W
    <U2 1> .

/* List Alarms Data */
S5F6
    <L
        <L [3]
            <B 0x06>
            <U2 1>
            <A "EQUIP ERR       ">
            >
        > .

/* List Enabled Alarms Request */
S5F7 W .

/* List Alarms Data */
S5F8
    <L
        <L [3]
            <B 0x06>
            <U2 1>
            <A "EQUIP ERR       ">
            >
        > .

/* Exception Post Notify */
S5F9 W
    <L[5]
        <A "1997053112250000">  /* TIMESTAMP */
        <A "WAFER">             /* EXID */
        <A "Abnormal">          /* EXTYPE */
        <A "Broken meter">      /* EXMESSAGE */
        <L
            <A "Replace the existing meter"> /* EXRECVRA */
        >
    >.

/* Exception Post Confirm */
S5F10 .

/* Exception Clear Notify */
S5F11 W
    <L[4]
        <A "1997053112250000">  /* TIMESTAMP */
        <A "OVER HEAT">         /* EXID */
        <A "ALARM">             /* EXTYPE */
        <A "Equip. Error">      /* EXMESSAGE */
    >.

/* Exception Clear Confirm */
S5F12 .

/* Exception Recover Request */
S5F13 W
    <L[2]
        <A "CONGESTION">               /* EXID */
        <A "Cut down in production">   /* EXRECVRA */
    >.

/* Exception Recover Acknowledge */
S5F14
    <L[2]
        <A "CONGESTION">
        <L[2]
            <BOOLEAN 0x01>     /* ACKA */
            <L[2]
                <U1 4>         /* ERRCODE */
                <A "Unknown attribute">   /* ERRTEXT */
            >
         >
     >.

/* Exception Recovery Complete Notify */
S5F15 W
    <L[3]
        <A "1997053112250000">  /* TIMESTAMP */
        <A "CLOG">              /* EXID */
        <L[2]
             <BOOLEAN 0x01>
             <L[2]
                 <U1 15>        /* ERRCODE */
                 <A "Busy ">    /* ERRTEXT */
             >
        >
    >.


/* Exception Recovery Complete Confirm */
S5F16 .

/* Exception Recovery Abort Request */
S5F17 W
    <A "Abort"> .

/* Exception Recovery Abort Acknowledge */
S5F18
    <L[2]
         <A "Abort">    /* EXID */
         <L[2]
              <BOOLEAN 0x01>
              <L[2]
                 <U1 0>         /* ERRCODE */
                 <A "Aborted">  /* ERRTEXT */
              >
         >
     >.

/* Stream 6 Abort */
S6F0 .

/* Trace Data Send */
S6F1 W
    <L [4]
        <U2 1>
        <U2 1>
        <A "850103123000">
        <L
            <U2 7>
            >
        > .

/* Trace Data Acknowledge */
S6F2
    <B 0x00>.

/* Discrete Variable Data Send */
S6F3 W
    <L [3]
        <U2 1>
        <U2 1>
        <L
            <L [2]
                <U2 1>
                <L
                    <L [2]
                        <U2 1>
                        <I2 7>
                        >
                    >
                >
            >
        > .

/* Discrete Variable Data Acknowledge */
S6F4
    <B 0x00>.

/* Multi-Block Data Send Inquire */
S6F5 W
    <L [2]
        <U2 1>
        <U2 4096>
        > .

/* Multi-block Grant */
S6F6
    <B 0x00> .

/* Data Transfer Request */
S6F7 W
    <U2 1> .

/* Data Transfer Data */
S6F8
    <L [3]
        <U2 1>
        <U2 1>
        <L
            <L [2]
                <U2 1>
                <L
                    <L [2]
                        <U2 1>
                        <I2 7>
                        >
                    >
                >
            >
        > .

/* Formatted Variable Send */
S6F9 W
    <L [4]
        <B 0x01>
        <U2 1>
        <U2 1>
        <L
            <L [2]
                <U2 1>
                <L
                    <I2 7>
                    >
                >
            >
        > .

/* Formatted Variable Acknowledge */
S6F10
    <B 0x00>.

/* Event Report Send */
S6F11 W
    <L [3]
        <U2 0>              /* DATAID */
        <U2 1>              /* CEID */
        <L
            <L [2]
                <U2 1>      /* RPTID */
                <L
                    <I2 -7> /* V */
                    <U1 4>  /* V */
                    >
                >
            >
        > .

/* Event Report Acknowledge */
/* S6F12 */
/*    <B [1] 00> .  */          /* ACKC6 */

/* Annotated Event Report Send */
S6F13 W
    <L [3]
        <U2 0>                  /* DATAID */
        <U2 1>                  /* CEID */
        <L
            <L [2]
                <U2 1>          /* RPTID */
                <L
                    <L [2]
                        <U2 1>  /* VID */
                        <I2 -7> /* V */
                        >
                    <L [2]
                        <U2 2>  /* VID */
                        <U1 4>  /* V */
                        >
                    >
                >
            >
        > .

/* Annotated Event Report Acknowledge */
S6F14
    <B [1] 00> .                /* ACKC6 */

/* Report Request */
S6F15 W
    <U2 0> .                    /* CEID */

/* Report Data */
S6F16
    <L [3]
        <U2 0>                  /* DATAID */
        <U2 1>                  /* CEID */
        <L
            <L [2]
                <U2 1>          /* RPTID */
                <L
                    <I2 -7>     /* V */
                    <U1 4>      /* V */
                    >
                >
            >
        > .

/* Annotated Event Report Request */
S6F17 W
    <U2 0> .                    /* CEID */

/* Annotated Event Report Data */
S6F18
    <L [3]
        <U2 0>                  /* DATAID */
        <U2 1>                  /* CEID */
        <L
            <L [2]
                <U2 1>          /* RPTID */
                <L
                    <L [2]
                        <U2 1>  /* VID */
                        <I2 -7> /* V */
                        >
                    <L [2]
                        <U2 2>  /* VID */
                        <U1 4>  /* V */
                        >
                    >
                >
            >
        > .

/* Individual Report Request */
S6F19 W
        <U2 1> .                /* RPTID */

/* Individual Report Data */
S6F20
    <L
        <I2 -7>                 /* V */
        <U1 4>                  /* V */
    > .

/* Annotated Individual Report Request */
S6F21 W
        <U2 1> .                /* RPTID */

/* Annotated Individual Report Data */
S6F22
    <L
        <L [2]
            <U2 1>              /* VID */
            <I2 -7>             /* V */
        >
        <L [2]
            <U2 2>              /* VID */
            <U1 4>              /* V */
        >
    > .

/* Request Spooled Data */
S6F23 W
    <U1 0> .                    /* RSDC */

/* Request Spooled Data Acknowledgement Send */
S6F24
    <B 0x00> .                    /* RSDA */

/* Notification Report Send */
S6F25 W
    <L[7]
        <U2 0>         /* DATAID */
        <U2 31>        /* OPID */
        <U4 22>        /* LINKID */
        <A "WAFER">    /* RCPSPEC */
        <U1 1>         /* RMCHGSTAT */
        <L
            <L[2]
                 <A "Name1">    /* RCPATTRID */
                 <B 0x00>       /* RCPATTRDATA */
            >
        >
        <L[2]
             <U1 2>             /* RMACK */
             <L
                 <L[2]
                      <U1 4>        /* ERRCODE */
                      <A "ERROR">   /* ERRTEXT */
                 >
             >
         >
     >.

/* Notification Report Send Acknowledge */
S6F26
     <B 0X01>.

/* Trace Report Send */
S6F27 W
    <L[3]
        <U1 0>      /* DATAID */
        <U2 3>      /* TRID */
        <L
            <L[3]
                <L[2]
                    <U4 11>         /* RPTID */
                    <L[2]
                        <I2 -7>     /* V */
                        <U2 21>
                    >
                >
                <L[2]
                    <U4 13>         /* RPTID */
                    <L[2]
                        <I4 -17>    /* V */
                        <U2 31>
                    >
                >
                <L[2]
                    <U4 15>         /* RPTID */
                    <L[2]
                        <U1 7>      /* V */
                        <U1 23>
                    >
                >
            >
        >
    >.

/* Trace Report Send Acknowledge */
S6F28
     <U2 3>.     /* TRID */

/* Trace Report Request */
S6F29 W
     <U1 9>.     /* TRID */

/* Trace Report Send */
S6F30
    <L[3]
        <U1 9>      /* TRID */
        <L[2]
            <L[2]
                <U4 12>         /* RPTID */
                <L[2]
                    <I2 17>     /* VID */
                    <U2 21>     /* VID */
                >
            >
            <L[2]
                <U4 13>         /* RPTID */
                <L[2]
                    <I4 12>     /* VID */
                    <U2 31>     /* VID */
                >
            >
        >
        <U1 1>                  /* ERRCODE */
    >.

/* Stream 7 Abort */
S7F0 .

/* Process Program Load Inquire */
S7F1 W
    <L [2]
        <A "PP01            ">
        <U2 512>
        > .

/* Process Program Load Grant */
S7F2
    <B 0x00> .

/* Process Program Send */
S7F3 W
    <L [2]
      <A "PP01            ">
      <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF
        >
      > .

/* Process Program Acknowledge */
S7F4
    <B 0x00> .

/* Process Program Request */
S7F5 W
    <A "PP01            "> .

/* Process Program Data */
S7F6
    <L [2]
      <A "PP01            ">
      <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF
        >
      > .

/* Process Program ID Request */
S7F7 W
    <A "LOT01           "> .

/* Process Program ID Data */
S7F8
    <L [2]
        <A "PP01            ">
        <A "LOT01           ">
        > .

/* M/P M Request */
S7F9 W .

/* M/P M Data */
S7F10
    <L
        <L [2]
            <A "PP01            ">
            <L
                <A "LOT01           ">
                >
            >
        > .

/* M/P M Update Send */
S7F11 W
    <L
        <L [2]
            <A "PP01            ">
            <L
                <A "LOT01           ">
                >
            >
        > .
/* M/P M Update Acknowledge */
S7F12
    <B 0x00> .

/* Delete M/P M Entry Send */
S7F13 W
    <L
        <L [2]
            <A "PP01            ">
            <L
                <A "LOT01           ">
                >
            >
        > .

/* Delete M/P M Entry Acknowledge */
S7F14
    <B 0x00> .

/* Matrix Mode Select Send */
S7F15 W
    <B 0x01> .

/* Matrix Mode Select Acknowledge */
S7F16
    <B 0x00> .

/* Delete Process Program Send */
S7F17 W
    <L
        <A "PP01            ">
        > .

/* Delete Process Program Acknowledge */
S7F18
    <B 0x00> .

/* Current EPPD Request */
S7F19 W .

/* Current EPPD Data */
S7F20
    <L
        <A "PP01            ">
        <A "PP02            ">
        > .

/* Equipment Process Capabilities Request */
S7F21 W .

/* Equipment Process Capabilities Data */
S7F22
    <L [5]
        <A "WONDER">
        <A "000000">
        <U2 4>
        <U2 100>
        <L
            <L [11]
                <U2 1>
                <A "PROCESS         ">
                <BOOLEAN 0x1>
                <U1 0>
                <U2>
                <U2>
                <U2>
                <U2>
                <U2>
                <U2>
                <L
                    <L [9]
                        <A "TEMP">
                        <BOOLEAN 0x1>
                        <U2 100>
                        <U2 1>
                        <U2 50>
                        <U2 300>
                        <A "degC">
                        <U1 1>
                        <U2 1>
                        >
                    <L [9]
                        <A "TIME">
                        <BOOLEAN 0x1>
                        <U2 5>
                        <U2 1>
                        <U2 1>
                        <U2 600>
                        <A "s">
                        <U1 1>
                        <U2 1>
                        >
                    >
                >
            >
        > .

/* Formatted Process Program Send */
S7F23 W
    <L [4]
        <A "PP01            ">
        <A "WONDER">
        <A "000000">
        <L
            <L [2]
                <U2 1>
                <L
                    <U2 100>
                    <U2 60>
                    >
                >
            >
        > .

/* Formatted Process Program Acknowledge */
S7F24
    <B 0x00> .

/* Formatted Process Program Request */
S7F25 W
    <A "PP01            "> .

/* Formatted Process Program Data */
S7F26
    <L [4]
        <A "PP01            ">
        <A "WONDER">
        <A "000000">
        <L
            <L [2]
                <U2 1>
                <L
                    <U2 100>
                    <U2 60>
                    >
                >
            >
        > .

/* Process Program Verification Send */
S7F27 W
    <L [2]
        <A "PP01            ">
        <L>
        > .
/* Process Program Verification Acknowledge */
S7F28 .

/* Process Program Verification Inquire */
S7F29 W
    <U2 100> .

/* Process Program Verification Grant */
S7F30
    <B 0x00> .

/* Verification Request Send */
S7F31 W
    <L [4]
        <A "PP01            ">
        <A "WONDER">
        <A "000000">
        <L
            <L [2]
                <U2 1>
                <L
                    <U2 100>
                    <U2 60>
                    >
                >
            >
        > .

/* Verification Request Acknowledge */
S7F32
    <B 0x00> .

/* Process Program Available Request */
S7F33 W
    <A "PP01            "> .

/* Process Program Available Data */
S7F34
    <L [3]
        <A "PP01            ">
        <U2 20>
        <U2 100>
    > .

/* Process Program for MID Request */
S7F35 W
    <A "LOT01           "> .        /* MID */

/* Process Program for MID Data */
S7F36
    <L [3]
      <A "LOT01           ">      /* MID */
      <A "PP01            ">      /* PPID */
      <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF
        >
      > .

/* Stream 8 Abort */
S8F0 .

/* Boot Program Request */
S8F1 W .

/* Boot Program Data */
S8F2
    <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        > .

/* Executive Program Request */
S8F3 W .

/* Executive Program Data */
S8F4
    <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        > .

/* Stream 9 Abort */
S9F0 .

/* Unrecognized Device ID */
S9F1
    <B 0x0001 0x0000 0x8001 0x00000000> .

/* Unrecognized Stream Type */
S9F3
    <B 0x0001 0x0000 0x8001 0x00000000> .

/* Unrecognized Function Type */
S9F5
    <B 0x0001 0x0000 0x8001 0x00000000> .

/* Illegal Data */
S9F7
    <B 0x0001 0x0000 0x8001 0x00000000> .

/* Transaction Timer Timeout */
S9F9
    <B 0x0001 0x0000 0x8001 0x00000000> .

/* Data Too Long */
S9F11
    <B 0x0001 0x0000 0x8001 0x00000000> .

/* Conversation Timeout */
S9F13
    <L [2]
        <A "S7F3">
        <A "PP01            ">
        > .

/* Stream 10 Abort */
S10F0 .

/* Terminal Request */
S10F1 W
    <L [2]
        <B 0x00>
        <A "BBBBB           ">
        > .

/* Terminal Request Acknowledge */
S10F2
    <B 0x00> .

/* Terminal Display, Single */
S10F3 W
    <L [2]
        <B 0x00>
        <A "BBBBB           ">
        > .

/* Terminal Display, Single Acknowledge */
S10F4
    <B 0x00> .

/* Terminal Display, Multi-Block */
S10F5 W
    <L [2]
        <B 0x00>
        <L
            <A "AAAAA           ">
            <A "BBBBB           ">
            <A "CCCCC           ">
            >
        > .

/* Terminal Display, Multi-block Acknowledge */
S10F6
    <B 0x00> .

/* Multi-Block Not Allowed */
S10F7
    <B 0x00> .

/* Broadcast */
S10F9 W
    <A "BBBBB           "> .

/* Broadcast Acknowledge */
S10F10
    <B 0x00> .

/* Stream 11 Abort */
S11F0 .

/* File Access Inquire */
S11F1 W
    <L [4]
        <A "FILE01">
        <B 0x01>
        <B 0x01>
        <U2 0>
        > .

/* File Access Grant */
S11F2
    <B 0x00> .

/* File Write Data Send */
S11F3 W
    <L [2]
      <B 0x01>
      <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        >
      > .

/* File Write Acknowledge */
S11F4
    <L [2]
        <B 0x01>
        <B 0x00>
        > .

/* File Read Request */
S11F5 W
    <L [2]
        <B 0x01>
        <U2 128>
        > .

/* File Read Data */
S11F6
    <L [4]
      <B 0x01>
      <B 0x00>
      <U2 128>
      <B [/2]
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
        >
      > .

/* File Close */
S11F7
    <B 0x01> .

/* File Delete */
S11F9
    <A "FILE01"> .

/* File Directory Request */
S11F11 W .

/* File Directory Data */
S11F12
    <L
        <A "FILE01">
        <A "FILE02">
        > .

/* File Inquire Request */
S11F13 W
    <A "FILE01"> .

/* File Inquire Data */
S11F14
    <U2 128> .

/* Abort Transaction */
S12F0  .

/* Map Setup Data Send */
S12F1 W
    <L [15]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <U2 0>                      /* FNLOC */
        <U2 0>                      /* FFROT */
        <B 0x00>                    /* ORLOC */
        <U1 1>                      /* RPSEL */
        <L
            <I2 -2  1>              /* REFP */
            >
        <A "um">                    /* DUTMS */
        <U2 6000>                   /* XDIES */
        <U2 6000>                   /* YDIES */
        <U2 6>                      /* ROWCT */
        <U2 6>                      /* COLCT */
        <U1 0>                      /* NULBC */
        <U2 36>                     /* PRDCT */
        <B 0x00>                    /* PRAXI */
        >.
/* Map Setup Data Acknowledge */
S12F2
        <B 0x00> .

/* Map Setup Data Request */
S12F3 W
    <L [9]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <B 0x00>                    /* MAPFT */
        <U2 0>                      /* FNLOC */
        <U2 0>                      /* FFROT */
        <B 0x00>                    /* ORLOC */
        <B 0x00>                    /* PRAXI */
        <U1 1  2>                   /* BCEQU */
        <U1 0>                      /* NULBC */
        >.
/* Map Setup Data */
S12F4
    <L [15]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <U2 0>                      /* FNLOC */
        <B 0x00>                    /* ORLOC */
        <U1 1>                      /* RPSEL */
        <L
            <I2 -2  1>              /* REFP */
            >
        <A "um">                    /* DUTMS */
        <U2 6000>                   /* XDIES */
        <U2 6000>                   /* YDIES */
        <U2 6>                      /* ROWCT */
        <U2 6>                      /* COLCT */
        <U2 36>                     /* PRDCT */
        <U1 1  2>                   /* BCEQU */
        <U1 0>                      /* NULBC */
        <U2 400>                    /* MLCL */
        >.

/* Map Transmit Inquire */
S12F5 W
    <L [4]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <B 0x00>                    /* MAPFT */
        <U2 400>                    /* MLCL */
        >.
/* Map Transmit Grant */
S12F6
    <B 0x00> .

/* Map Data Send Type 1 */
S12F7 W
    <L [3]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <L
            <L [2]
                <I2 -2 2 1>         /* RSINF */
                <U1 1  0  2  1>     /* BINLT */
                >
            >
        > .
/* Map Data Acknowledge */
S12F8
    <B 0x00> .

/* Map Data Send Type 2 */
S12F9 W
    <L [4]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <I2 -2  2>                  /* STRP */
        <U1 1  0  2  1>             /* BINLT */
        > .

/* Map Data Acknowledge */
S12F10
    <B 0x00> .

/* Map Data Send Type 3 */
S12F11 W
    <L [3]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <L
            <L [2]
                <I2 -2  2>          /* XYPOS */
                <U1 1  0  2  1>     /* BINLT */
                >
            >
        >.

/* Map Data Acknowledge */
S12F12
    <B 0x00> .

/* Map Data Request Type 1 */
S12F13 W
    <L [2]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        > .

/* Map Data Type 1 */
S12F14
    <L [3]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <L
            <L [2]
                <I2 -2 2 1>         /* RSINF */
                <U1 1  0  2  1>     /* BINLT */
                >
            >
        >.

/* Map Data Request Type 2 */
S12F15 W
    <L [2]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        > .

/* Map Data Type 2 */
S12F16
    <L [4]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <I2 -2  2>                  /* STRP */
        <U1 1  0  2  1>             /* BINLT */
        > .


/* Map Data Request Type 3 */
S12F17 W
    <L [3]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <B 0x00>                    /* SDBIN */
        > .

/* Map Data Type 3 */
S12F18
    <L [3]
        <A  "WAFER0001       ">     /* MID */
        <B 0x00>                    /* IDTYP=WAFER */
        <L
            <L [2]
                <I2 -2  2>          /* XYPOS */
                <U1 1  0  2  1>     /* BINLT */
                >
            >
        >.

/* Map Error Report Send */
S12F19
    <L [2]
        <B 0x01>                    /* MAPER */
        <U1 7>                      /* DATLC */
        > .

/* Abort Transaction */
S13F0  .

/* Send Data Set Send */
S13F1 W
    <L [1]
        <A "FILE0001">              /* DSNAME */
        > .

/* Send Data Set Acknowledge */
S13F2
    <L [2]
        <A "FILE0001">              /* DSNAME */
        <B 0x00>                    /* ACKC13 */
        > .

/* Open Data Set Request */
S13F3 W
    <L [3]
        <U2 1>                      /* HANDLE */
        <A  "FILE0001">             /* DSNAME */
        <U4 1>                      /* CKPNT */
        > .

/* Open Data Set Data */
S13F4
    <L [5]
        <U2 1>                      /* HANDLE */
        <A  "FILE0001">             /* DSNAME */
        <B 0x00>                    /* ACKC13 */
        <U1 0>                      /* RTYPE */
        <U2 100>                    /* RECLEN */
        > .

/* Read Data Set Request */
S13F5 W
   <L [2]
        <U2 1>                      /* HANDLE */
        <U2 256>                    /* READLN */
        > .

/* Read Data Set Data */
S13F6
  <L [4]
    <U2 1>                        /* HANDLE */
    <B 0x00>                      /* ACKC13 */
    <U4 1>                        /* CKPNT */
    <L
      <B 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         >                        /* FILDAT */
       >
    > .

/* Close Data Set Send */
S13F7 W
    <L [1]
        <U2 1>                    /* HANDLE */
        > .

/* Close Data Set Acknowledge */
S13F8
    <L [2]
        <U2 1>                    /* HANDLE */
        <B 0x00>                  /* ACKC13 */
        > .

/* Reset Data Set Send */
S13F9 W .

/* Reset Data Set Acknowledge */
S13F10 .

/* Data Set Object Multi-Block Inquire */
S13F11 W
     <L[3]
          <U1 0>                  /* DATAID */
          <A "Object:Type_12">    /* OBJSPEC */
          <U4 256>                /* DATALENGTH */
     >.

/* Data Set Object Multi-Block Grant */
S13F12
     <B 0x00>.  /* GRANT */

/* Table Data Send */
S13F13 W
     <L[8]
         <U1 2>           /* DATAID */
         <A "object">     /* OBJSPEC */
         <A "table">      /* TBLTYP */
         <A "table_id">   /* TBLID */
         <U1 0>           /* TBLCMD */
         <L[2]
             <L[2]
                 <U1 3>      /* ATTRID */
                 <I1 -10>    /* ATTRDATA */
             >
             <L[2]
                 <U1 4>      /* ATTRID */
                 <U2 1>      /* ATTRDATA */
             >
         >
         <L[2]
              <A "TYPE1">    /* COLHDR */
              <A "TYPE2">    /* COLHDR */
         >
         <L[2]
              <L[3]
                   <U1 1>    /* TBLELT ll */
                   <U1 11>
                   <U1 21>
              >
              <L[3]
                   <U2 100>  /* TBLELT rl */
                   <U2 110>
                   <U2 121>
              >
         >
     >.

/* Table Data Acknowledge */
S13F14
     <L[2]
          <U1 1>     /* TBLACK */
          <L[2]
               <L[2]
                   <U1 0>                 /* ERRCODE */
                   <A "Error message">    /* ERRTEXT */
               >
               <L[2]
                   <U1 1>                 /* ERRCODE */
                   <A "Error message">    /* ERRTEXT */
               >
          >
     >.

/* Table Data Request */
S13F15 W
    <L[7]
        <U1 2>              /* DATAID */
        <A "obj">           /* OBJSPEC */
        <A "tbl_type">      /* TBLTYP */
        <A "tbl_id">        /* TBLID */
        <U1 0>              /* TBLCMD */
        <L[2]
            <A "TEXT1">     /* COLHDR */
            <A "TEXT2">     /* COLHDR */
        >
        <L[2]
            <B 0x00>        /* TBLELT */
            <B 0x00>        /* TBLELT */
        >
    >.

/* Table Data */
S13F16
    <L[6]
        <A "tbl_type">      /* TBLTYP */
        <A "tbl_id">        /* TBLID */
        <L[2]
            <L[2]
                <U1 0>      /* ATTRID */
                <U2 3>      /* ATTRDATA */
            >
            <L[2]
                <U1 5>      /* ATTRID */
                <U2 7>      /* ATTRDATA */
            >
        >
        <L[2]
            <A "TEXT1">     /* COLHDR */
            <A "TEXT2">     /* COLHDR */
        >
        <L[2]
            <L[2]
                <B 0x01>    /* TBLELT11 */
                <B 0x02>    /* TBLELT12 */
            >
            <L[2]
                <U1 1>      /* TBLELT21 */
                <U1 2>      /* TBLELT22 */
            >
        >
        <L[2]
            <U1 1>              /* TBLACK */
            <L
                <L[2]
                    <U1 1>          /* ERRCODE */
                    <A "ERR MSG">   /* ERRTEXT */
                >
            >
        >
    >.

/* Stream 14 Abort */
S14F0.

/* GetAttr Request */
S14F1 W
    <L [5]
        <A "type:id>" > /* OBJSPEC */
        <U2 1>          /* OBJTYPE */
        <L
            <U2 5>      /* OBJID */
            <U2 6>      /* OBJID */
        >
        <L
            <L [3]
                <U2 10>         /* ATTRID */
                <U2 40>         /* ATTRDATA */
                <U1 4>          /* ATTRRELN */
            >
        >
        <L
            <U2 10>             /* ATTRID */
            <U2 11>             /* ATTRID */
        >
    >.

/* GetAttr Data */
S14F2
    <L [2]
        <L
            <L [2]
                <U2 5>          /* OBJID */
                <L
                    <L [2]
                        <U2 10>         /* ATTRID */
                        <A "ATTRIBUTE"> /* ATTRDATA */
                    >
                >
            >
        >
        <L [2]
            <U1 0>              /* OBJACK */
            <L
                <L [2]
                    <U1 1>      /* ERRCODE */
                    <A "ERROR"> /* ERRTEXT */
                >
            >
        >
    >.

/* SetAttr Request */
S14F3 W
    <L [4]
        <A "type:id>" >         /* OBJSPEC */
        <U2 1>                  /* OBJTYPE */
        <L
            <U2 5>              /* OBJID */
            <U2 6>              /* OBJID */
        >
        <L
            <L [2]
                <U2 10>         /* ATTRID */
                <A "ATTRIBUTE"> /* ATTRDATA */
            >
        >
    >.

/* SetAttr Data */
S14F4
    <L [2]
        <L
            <L [2]
                <U2 5>          /* OBJID */
                <L
                    <L [2]
                        <U2 10>         /* ATTRID */
                        <A "ATTRIBUTE"> /* ATTRDATA */
                    >
                >
            >
        >
        <L [2]
            <U1 0>              /* OBJACK */
            <L
                <L [2]
                    <U1 1>      /* ERRCODE */
                    <A "ERROR"> /* ERRTEXT */
                >
            >
        >
    >.

/* GetType Request */
S14F5 W
    <A "type:id>" >.    /* OBJSPEC */

/* GetType Data */
S14F6
    <L [2]
        <L
            <U2 1>      /* OBJTYPE */
            <U2 2>      /* OBJTYPE */
        >
        <L
            <U1 1>              /* OBJACK */
            <L
                <L [2]
                    <U1 1>      /* ERRCODE */
                    <A "ERROR"> /* ERRTEXT */
                >
            >
        >
    >.

/* GetAttrName Request */
S14F7 W
    <L [2]
        <A "type:id>" > /* OBJSPEC */
        <L
            <U2 1>      /* OBJTYPE */
            <U2 2>      /* OBJTYPE */
        >
    >.

/* Get AttrName Data */
S14F8
    <L [2]
        <L
            <L [2]
                <U2 1>          /* OBJTYPE */
                <L
                    <U2 10>     /* ATTRID */
                    <U2 11>     /* ATTRID */
                >
            >
        >
        <L
            <U1 1>              /* OBJACK */
            <L
                <L [2]
                    <U1 1>      /* ERRCODE */
                    <A "ERROR"> /* ERRTEXT */
                >
            >
        >
    >.

/* Create Object Request */
S14F9 W
    <L[3]
        <A "text_string">   /* OBJSPEC */
        <A "obj_type">      /* OBJTYPE */
        <L
            <L[2]
                <U1 0>      /* ATTRID */
                <U1 11>     /* ATTRDATA */
            >
        >
    >.

/* Create Object Acknowledge */
S14F10
    <L[3]
        <A "text_string">   /* OBJSPEC */
        <L
            <L[2]
                <U1 0>      /* ATTRID */
                <U1 11>     /* ATTRDATA */
            >
        >
        <L[2]
            <U1 0>              /* OBJACK */
            <L
                <L[2]
                    <U1 1>      /* ERRCODE */
                    <A "ERROR"> /* ERRTEXT */
                >
            >
        >
    >.

/* Delete Object Request */
S14F11 W
     <L[2]
          <A "OBJ">         /* OBJSPEC */
          <L[2]
               <L[2]
                  <U1 11>    /* ATTRID */
                  <U2 100>   /* ATTRDATA */
               >
               <L[2]
                  <U1 99>    /* ATTRID */
                  <U2 1000>  /* ATTRDATA */
               >
           >
     >.

/* Delete Object Acknowledge */
S14F12
     <L[2]
          <L[2]
               <L[2]
                  <U1 11>    /* ATTRID */
                  <U2 100>   /* ATTRDATA */
               >
               <L[2]
                  <U1 99>    /* ATTRID */
                  <U2 1000>  /* ATTRDATA */
               >
           >
           <L[2]
               <U1 10>       /* OBJACK */
               <L[2]
                   <L[2]
                       <U1 1>                /* ERRCODE */
                       <A "Error message">   /* ERRTEXT */
                   >
                   <L[2]
                       <U1 2>                /* ERRCODE */
                       <A "Error message">   /* ERRTEXT */
                   >
               >
           >
       >.

/* Object Attach Request */
S14F13 W
    <L[2]
        <A "TextString">        /* OBJSPEC */
        <L[2]
            <L[2]
                <U1 3>          /* ATTRID */
                <U2 11>         /* ATTRDATA */
            >
            <L[2]
                <U1 7>          /* ATTRID */
                <U2 1000>       /* ATTRDATA */
            >
        >
    >.

/* Object Attach Acknowledge */
S14F14
     <L[3]
          <U4 101>           /* OBJTOKEN */
          <L[2]
               <L[2]
                  <U1 3>     /* ATTRID */
                  <U2 11>    /* ATTRDATA */
               >
               <L[2]
                  <U1 7>     /* ATTRID */
                  <U2 1000>  /* ATTRDATA */
               >
          >
          <L[2]
               <U1 10>       /* OBJACK */
               <L[2]
                   <L[2]
                       <U1 1>                /* ERRCODE */
                       <A "Error message">   /* ERRTEXT */
                   >
                   <L[2]
                       <U1 2>                /* ERRCODE */
                       <A "Error message">   /* ERRTEXT */
                   >
               >
           >
       >.

/* Attached Object Action Request */
S14F15 W
     <L[4]
          <A "Text string">    /* OBJSPEC */
          <U1 4>               /* OBJCMD */
          <U4 111>             /* OBJTOKEN */
          <L[2]
               <L[2]
                  <U1 7>       /* ATTRID */
                  <U2 17>      /* ATTRDATA */
               >
               <L[2]
                  <U1 9>       /* ATTRID */
                  <U2 19>      /* ATTRDATA */
               >
          >
     >.

/* Attached Object Action Acknowledge */
S14F16
      <L[2]
          <L[2]
               <L[2]
                  <U1 7>       /* ATTRID */
                  <U2 17>      /* ATTRDATA */
               >
               <L[2]
                  <U1 9>       /* ATTRID */
                  <U2 19>      /* ATTRDATA */
               >
          >
          <L[2]
               <U1 99>         /* OBJACK */
               <L[2]
                   <L[2]
                       <U1 3>                /* ERRCODE */
                       <A "Error message">   /* ERRTEXT */
                   >
                   <L[2]
                       <U1 5>                /* ERRCODE */
                       <A "Error message">   /* ERRTEXT */
                   >
               >
           >
       >.

/* Supervised Object Action */
S14F17 W
    <L[4]
        <A "Text string">       /* OBJSPEC */
        <U1 4>                  /* OBJCMD */
        <A "Input_latch">       /* TARGETSPEC */
        <L[2]
            <L[2]
                <U1 6>          /* ATTRID */
                <U2 67>         /* ATTRDATA */
            >
            <L[2]
                <U1 5>          /* ATTRID */
                <U2 119>        /* ATTRDATA */
            >
        >
    >.

/* Supervised Object Action Acknowledge */
S14F18
    <L[2]
        <L[2]
            <L[2]
                <U1 6>          /* ATTRID */
                <U2 67>         /* ATTRDATA */
            >
            <L[2]
                <U1 5>          /* ATTRID */
                <U2 119>        /* ATTRDATA */
            >
        >
        <L[2]
            <U1 1>              /* OBJACK */
            <L[2]
                <L[2]
                    <U1 51>             /* ERRCODE */
                    <A "Error message"> /* ERRTEXT */
                >
                <L[2]
                    <U1 43>             /* ERRCODE */
                    <A "Error message"> /* ERRTEXT */
                >
            >
        >
    >.

/* Abort Transaction */
S15F0 .

/* Recipe Management Multi-Block Inquire */
S15F1 W
     <L[3]
         <U1 0 >          /* DATAID */
         <A "RECIPE">     /* RCPSPEC */
         <U4 512>         /* RMDATASIZE */
     >.

/* Recipe Management Multi-block Grant */
S15F2
     <B 0x00> .

/* Recipe Namespace Action Request */
S15F3 W
     <L[2]
          <A "GWA003">     /* RMNSSPEC */
          <U1 5>           /* RMNSCMD */
     >.

/* Recipe Namespace Action Acknowledge */
S15F4
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 2>          /* ERRCODE */
                <A "ERROR">     /* ERRTEXT */
            >
        >
    >.

/* Recipe Namespace Rename Request */
S15F5 W
     <L[2]
         <A "GWA003">     /* RMNSSPEC */
         <A "GWA004">     /* RMNEWNS */
     >.

/* Recipe Namespace Rename Acknowledge */
S15F6
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 2>          /* ERRCODE */
                <A "ERROR">     /* ERRTEXT */
            >
        >
    >.

/* Recipe Space Request */
S15F7 W
    <A "GWA001">.    /* OBJSPEC */

/* Recipe Space Data */
S15F8
    <L[2]
        <U4 100>                /* RMSPACE */
        <L[2]
            <U1 0>              /* RMACK */
            <L
                <L[2]
                    <U1 0>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Status Request */
S15F9 W
     <A "GWA003">.    /* RCPSPEC */

/* Recipe Status Data */
S15F10
    <L[3]
        <U1 9>                  /* RCPSTAT */
        <A "Version 1.0">       /* RCPVERS */
        <L[2]
            <U1 0>              /* RMACK */
            <L
                <L[2]
                    <U1 0>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Version Request */
S15F11 W
     <L[4]
          <A "GWAxx">     /* RMNSSPEC */
          <A "Class A">   /* RCPCLASS */
          <A "GWA005">    /* RCPNAME */
          <A "AA">        /* AGENT */
     >.

/* Recipe Version Data */
S15F12
    <L[3]
        <A "AA">                        /* AGENT */
        <A "Version 1.0">               /* RCPVERS */
        <L[2]
            <U1 0>                      /* RMACK */
            <L
                <L[2]
                    <U1 0>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Create Request */
S15F13 W
    <L[5]
        <U1 0>            /* DATAID */
        <BOOLEAN 0x00>    /* RCPUPDT */
        <A "GWA001">      /* RCPSPEC */
        <L[2]
            <L[2]
                <A "ATTRIB1">     /* RCPATTRID */
                <U1 100>          /* RCPATTRDATA */
            >
            <L[2]
                <A "ATTRIB2">     /* RCPATTRID */
                <U1 200>          /* RCPATTRDATA */
            >
        >
        <B [/2]
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
            0xFF 0xFF 0xFF   >
    > .

/* Recipe Create Acknowledge */
S15F14
     <L[2]
          <U1 0>    /* RMACK */
          <L[2]
              <L[2]
                  <U1 0>              /* ERRCODE */
                  <A "ERROR MSG">     /* ERRTEXT */
              >
              <L[2]
                  <U1 0>              /* ERRCODE */
                  <A "ERROR MSG">     /* ERRTEXT */
               >
           >
     >.

/* Recipe Store Request */
S15F15 W
    <L[4]
        <U1 0 >         /* DATAID */
        <A "GWA007">    /* RCPSPEC */
        <B 0x01>        /* RCPSECCODE */
        <L[3]
            <L[2]
                <A "GENERIC">           /* RCPSECNM */
                <L
                    <L[2]
                        <A "ATTRIB">    /* RCPATTRID */
                        <U4 23>         /* RCPATTRDATA */
                    >
                >
            >
            <B                          /* RCPBODY */
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF
            >
            <L
                <L[2]
                    <A "GENERIC">           /* RCPSECNM */
                    <L
                        <L[2]
                            <A "ATTRIB">    /* RCPATTRID */
                            <U4 43>         /* RCPATTRDATA */
                        >
                    >
                >
            >
        >
    >.

/* Recipe Store Acknowledge */
S15F16
    <L[2]
        <B 0x01>                /* RCPSECCODE */
        <L[2]
            <U1 0>              /* RMACK */
            <L
                <L[2]
                    <U1 1>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Retrieve Request */
S15F17 W
     <L[2]
          <A "GWA007">     /* RCPSPEC */
          <B 0x01>         /* RCPSECCODE */
     >.

/* Recipe Retrieve Data */
S15F18
    <L[2]
        <L[3]
            <L[2]
                <A "ASDS">          /* RCPSECNM */
                <L[2]
                    <A "ATTRIB">    /* RCPATTRID */
                    <U4 333>        /* RCPATTRDATA */
                >
            >
            <B                      /* RCPBODY */
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF
            >
            <L[2]
                <A "ASDS">          /* RCPSECNM */
                <L[2]
                    <A "ATTRIB">    /* RCPATTRID */
                    <U4 43>         /* RCPATTRDATA */
                >
            >
        >
        <L[2]
            <U1 0>                  /* RMACK */
            <L
                <L[2]
                    <U1 0>          /* ERRCODE */
                    <A "ERROR MSG"> /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Rename Request */
S15F19 W
     <L[3]
          <A "GWA008">      /* RCPSPEC */
          <BOOLEAN 0x01>    /* RCPRENAME */
          <A "GWA009">      /* RCPNEWID */
     >.

/* Recipe Rename Acknowledge */
S15F20
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 1>          /* ERRCODE */
                <A "ERROR MSG"> /* ERRTEXT */
            >
        >
    >.

/* Recipe Action Request */
S15F21 W
     <L[6]
          <U1 1>          /* DATAID */
          <U1 9>          /* RCPCMD */
          <A "GWA001">    /* RMNSSPEC */
          <U4 5>          /* OPID */
          <A "GWA">       /* AGENT */
          <L[2]
               <A "id001">   /* RCPID */
               <A "id002">
          >
      >.

/* Recipe Action Acknowledge */
S15F22
    <L[4]
        <A "GWA">       /* AGENT */
        <U4 5>          /* LINKID */
        <U1 9>          /* RCPCMD */
        <L[2]
            <U1 1>      /* RMACK */
            <L
                <L[2]
                    <U1 2>          /* ERRCODE */
                    <A "ERROR MSG"> /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Descriptor Request */
S15F23 W
    <L[3]
        <U1 1>              /* DATAID */
        <A "GWA010">        /* OBJSPEC */
        <L[2]
            <A "GWA000">    /* RCPID */
            <A "GWA001">    /* RCPID */
        >
    >.

/* Recipe Descriptor Data */
S15F24
    <L[2]
        <L[2]
            <L[2]
                <L[3]
                    <A "GenDesc">               /* RCPDESCNM */
                    <A "1997053190350000">      /* RCPDESTIME */
                    <U1 50>                     /* RCPDESCLTH */
                >
                <L[3]
                    <A "GenDesc">               /* RCPDESCNM */
                    <A "1997052514150000">      /* RCPDESTIME */
                    <U1 70>                     /* RCPDESCLTH */
                >
            >
            <L[2]
                <L[3]
                    <A "ASDesc">                /* RCPDESCNM */
                    <A "1997051512450000">      /* RCPDESTIME */
                    <U1 99>                     /* RCPDESCLTH */
                >
                <L[3]
                    <A "ASDesc">                /* RCPDESCNM */
                    <A "1997060417300000">      /* RCPDESTIME */
                    <U1 100>                    /* RCPDESCLTH */
                >
            >
        >
        <L[2]
            <U1 1>                      /* RMACK */
            <L
                <L[2]
                    <U1 2>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
                <L[2]
                    <U1 3>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Parameter Update Request */
S15F25 W
    <L[4]
        <I2 11>        /* DATAID */
        <A "GWA000">   /* RMNSSPEC */
        <A "GWA">      /* AGENT */
        <L[2]
            <L[3]
                <A "Recipe01">          /* RCPPARNM */
                <I1 13>                 /* RCPPARVAL */
                <A "Numeric">           /* RCPPARRULE */
            >
            <L[3]
                <A "Recipe02">          /* RCPPARNM */
                <A "RecipeVar">         /* RCPPARVAL */
                <A "Alpha numeric">     /* RCPPARRULE */
            >
        >
    >.

/* Recipe Parameter Update Acknowledge */
S15F26
     <L[2]
         <U1 0>                /* RMACK */
         <L[2]
             <L[2]
                 <U1 0>            /* ERRCODE */
                 <A "ERROR MSG">   /* ERRTEXT */
             >
             <L[2]
                 <U1 1>            /* ERRCODE */
                 <A "ERROR MSG">   /* ERRTEXT */
             >
         >
     >.

/* Recipe Download Request */
S15F27 W
    <L[5]
        <U2 2>                  /* DATAID */
        <BOOLEAN 0X01>          /* RCPOWCODE */
        <A "GWA000">            /* RCPSPEC */
        <L
            <L[2]
                <A "ATTRIB">    /* RCPATTRID */
                <U1 10>         /* RCPATTRDATA */
            >
        >
        <B
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
              0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
         >
     > .

/* Recipe Download Acknowledge */
S15F28
    <L[3]
        <A "GWA000">      /* RCPID */
        <L
            <L[2]
                <A "ATTRIB">    /* RCPATTRID */
                <U1 10>         /* RCPATTRDATA */
            >
        >
        <L[2]
            <U1 0>              /* RMACK */
            <L
                <L[2]
                    <U1 0>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Verify Request */
S15F29 W
    <L[4]
        <U2 2>          /* DATAID */
        <U2 31>         /* OPID */
        <A "WAFER">     /* RESPEC */
        <L
            <A "id00">  /* RCPID */
        >
    >.

/* Recipe Verify Acknowledge */
S15F30
    <L[5]
        <U2 31>        /* OPID */
        <U4 31>        /* LINKID */
        <A "id00">     /* RCPID */
        <L
            <L[2]
                <A "ATTRIB">    /* RCPATTRID */
                <U1 10>         /* RCPATTRDATA */
            >
        >
        <L[2]
            <U1 0>              /* RMACK */
            <L
                <L[2]
                    <U1 0>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Unload Request */
S15F31 W
    <A "GWA000"> .    /* RCPSPEC */

/* Recipe Unload Data */
S15F32
    <L[4]
        <A "GWA000">            /* RCPSPEC */
        <L[2]
            <L[2]
                <A "ATTRIB1">   /* RCPATTRID */
                <U1 110>        /* RCPATTRDATA */
            >
            <L[2]
                <A "ATTRIB2">   /* RCPATTRID */
                <U1 220>        /* RCPATTRDATA */
            >
        >
        <B                      /* RCPBODY */
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF 0xFF
                0xFF 0xFF 0xFF >

        <L[2]
            <U1 2>              /* RMACK */
            <L
                <L[2]
                    <U1 1>              /* ERRCODE */
                    <A "ERROR MSG">     /* ERRTEXT */
                >
                <L[2]
                    <U1 2>              /* ERRCODE */
                    <A "ERROR MSG2">    /* ERRTEXT */
                >
            >
        >
    >.

/* Recipe Select Request */
S15F33 W
    <L[3]
        <U2 2>          /* DATAID */
        <A "GWA000">    /* RESPEC */
        <L
            <L[2]
                <A "id001">     /* RCPID */
                <L[2]
                    <L[2]
                        <A "Recipe01">    /* RCPPARNM */
                        <I1 13>           /* RCPPARVAL */
                    >
                    <L[2]
                        <A "Recipe02">    /* RCPPARNM */
                        <I1 13>           /* RCPPARVAL */
                    >
                >
            >
        >
    >.

/* Recipe Select Acknowledge */
S15F34
    <L[2]
        <U1 2>                /* RMACK */
        <L
            <L[2]
                <U1 1>            /* ERRCODE */
                <A "ERROR MSG">   /* ERRTEXT */
            >
        >
    >.

/* Recipe Delete Request */
S15F35 W
     <L[4]
          <U4 20>      /* DATAID */
          <A "OPER">   /* RESPEC */
          <U1 0>       /* RCPDEL */
          <L[2]
               <A "GWA000">   /* RCPID */
               <A "GWA001">   /* RCPID */
          >
      >.

/* Recipe Delete Acknowledge */
S15F36
     <L[2]
         <U1 0>                /* RMACK */
         <L[2]
             <L[2]
                 <U1 0>            /* ERRCODE */
                 <A "ERROR MSG">   /* ERRTEXT */
             >
             <L[2]
                 <U1 1>            /* ERRCODE */
                 <A "ERROR MSG">   /* ERRTEXT */
             >
         >
     >.

/* DRNS Segment Approve Action Request */
S15F37 W
    <L [6]
        <A "SEGMENT1">          /* RMSEGSPEC */
        <U4 101>                /* OBJTOKEN */
        <B 00>                  /* RMGRNT */
        <U4 1>                  /* OPID */
        <A "ID00">              /* RCPID */
        <U1 2>                  /* RMCHGTYPE */
    >.

/* DRNS Segment Approve Action Acknowledge */
S15F38
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 2>          /* ERRCODE */
                <A "ERROR">     /* ERRTEXT */
            >
        >
    >.

/* DRNS Recorder Segment Request */
S15F39 W
    <L [5]
        <U4 0>                  /* DATAID */
        <U1 1>                  /* RMNSCMD */
        <A "OBJECTSPEC">        /* RMRECSPEC */
        <A "SEG001">            /* RMSEGSPEC */
        <U4 101>                /* OBJTOKEN */
    >.

/* DRNS Recorder Segment Acknowledge */
S15F40
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 2>          /* ERRCODE */
                <A "ERROR">     /* ERRTEXT */
            >
        >
    >.

/* DRNS Recorder Modify Request */
S15F41 W
    <L [5]
        <U4 0>                      /* DATAID */
        <A "OBJECTSPEC">            /* RMRECSPEC */
        <U4 101>                    /* OBJTOKEN */
        <U1 1>                      /* RMNSCMD */
        <L [7]
            <A "RECIPE01">          /* RCPID */
            <A "RECIPE02">          /* RCPNEWID */
            <A "SEG001">            /* RMSEGSPEC */
            <U1 1>                  /* RMCHGTYPE */
            <U4 1>                  /* OPID */
            <A "1997113012250000">  /* TIMESTAMP */
            <BOOLEAN 0xFF>          /* RMREQUESTOR */
        >
    >.

/* DRNS Recorder Modify Acknowledge */
S15F42
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 2>          /* ERRCODE */
                <A "ERROR">     /* ERRTEXT */
            >
        >
    >.

/* DRNS Get Change Request */
S15F43 W
    <L [3]
        <U4 0>                  /* DATAID */
        <A "OBJECT">            /* OBJSPEC */
        <A "TARGET">            /* TARGETSPEC */
    >.

/* DRNS Get Change Request Data */
S15F44
    <L [2]
        <L
            <L [7]
                <A "RECIPE01">          /* RCPID */
                <A "RECIPE02">          /* RCPNEWID */
                <A "SEG001">            /* RMSEGSPEC */
                <U1 1>                  /* RMCHGTYPE */
                <U4 1>                  /* OPID */
                <A "1997053112250000">  /* TIMESTAMP */
                <BOOLEAN 0x00>          /* RMREQUESTOR */
            >
        >
        <L[2]
            <U1 1>              /* RMACK */
            <L
                <L[2]
                    <U1 2>      /* ERRCODE */
                    <A "ERROR"> /* ERRTEXT */
                >
            >
        >
    >.

/* DRNS Manager Segment Change Approval Request */
S15F45 W
    <L [4]
        <U4 1>                  /* DATAID */
        <A "RECIPE01">          /* RCPSPEC */
        <A "RECIPE02">          /* RCPNEWID */
        <U1 7>                  /* RMCHGTYPE */
    >.

/* DRNS Manager Segment Approval Acknowledge */
S15F46
    <L [3]
        <U1 7>                  /* RMCHGTYPE */
        <B 0x00>                /* RMGRNT */
        <U4 1>                  /* OPID */
    >.

/* Manager Rebuild Request */
S15F47 W
    <L [5]
        <U4 0>                  /* DATAID */
        <A "OBJECT">            /* OBJSPEC */
        <A "NAMESP01">          /* RMNSSPEC */
        <A "RECIPE01">          /* RMRECSPEC */
        <L
            <A "SEG001">        /* RMSEGSPEC */
            <A "SEG002">        /* RMSEGSPEC */
        >
    >.

/* DRNS Manager Rebuild Acknowledge */
S15F48
    <L[2]
        <U1 1>                  /* RMACK */
        <L
            <L[2]
                <U1 2>          /* ERRCODE */
                <A "ERROR">     /* ERRTEXT */
            >
        >
    >.

/* Multi-block Process Job Data */
S16F1 W
    <L[2]
         <U4 25>     /* DATAID */
         <U4 512>    /* DATALENGTH */
    >.

/* Multi-block Process Job Data Grant */
S16F2
    <B 0x01>.    /* GRANT */

/* Process Job Create Request */
S16F3 W
    <L[5]
        <I4 23>             /* DATAID */
        <B 0x01>            /* MF */
        <L[2]
            <A "material1"> /* MID */
            <B 0x03>
        >
        <L[3]
            <A "STANDARD"> /* PRRECIPEMETHOD - NOTE: not yet defined by SEMI */
            <A "Recipe">   /* RCPSPEC */
            <L[2]
                <L[2]
                    <A "Variable1"> /* RCPPARNM */
                    <U1 3>          /* RCPPARVAL */
                >
                <L[2]
                    <A "Variable2"> /* RCPPARNM */
                    <U1 10>         /* RCPPARVAL */
                >
            >
        >
        <BOOLEAN 0x01>  /* PRPROCESSSTART - NOTE: not yet defined by SEMI */
    >.

/* Process Job Create Acknowledge */
S16F4
    <L[2]
        <A "PRJ_21">            /* PRJOBID */
        <L[2]
            <BOOLEAN 0x00>      /* ACKA */
            <L
                <L[2]
                    <U1 3>              /* ERRCODE */
                    <A "Error message"> /* ERRTEXT */
                >
            >
        >
    >.

/* Process Job Command Request */
S16F5 W
     <L[4]
          <U1 10>         /* DATAID */
          <A "PRJ_32">    /* PRJOBID */
          <A "STOP">      /* PRCMDNAME */
          <L[2]
               <L[2]
                    <A "GWA001">    /* CPNAME */
                    <U1 33>         /* CPVAL */
               >
               <L[2]
                    <A "GWA002">    /* CPNAME */
                    <U1 73>         /* CPVAL */
               >
          >
     >.

/* Process Job Command Acknowledge */
S16F6
    <L[2]
        <A "PRJ_32">    /* PRJOBID */
        <L[2]
            <BOOLEAN 0x01>              /* ACKA */
            <L
                <L[2]
                    <U1 51>             /* ERRCODE */
                    <A "Error message"> /* ERRTEXT */
                >
                <L[2]
                    <U1 43>             /* ERRCODE */
                    <A "Error message"> /* ERRTEXT */
                >
            >
        >
    >.

/* Process Job Alert Notify */
S16F7 W
    <L[4]
        <A "1998011512350000">  /* TIMESTAMP */
        <A "PRJ_99" >           /* PRJOBID */
        <U4 3>                  /* PRJOBMILESTONE */
        <L[2]
            <BOOLEAN 0x00>      /* ACKA */
            <L
                <L[2]
                    <U1 43>             /* ERRCODE */
                    <A "Error message"> /* ERRTEXT */
                >
            >
        >
    >.

/* Process Job Alert Confirm */
S16F8 .

/* Process Job Event Notify */
S16F9 W
    <L[4]
        <U4 2>                  /* PREVENTID */
        <A "1998011514250000">  /* TIMESTAMP */
        <A "PRJ_77">            /* PRJOBID */
        <L[2]
            <L[2]
                <U1 100>        /* VID */
                <U4 20>         /* V */
            >
            <L[2]
                <U1 101>        /* VID */
                <U4 21>         /* V */
            >
        >
    >.

/* Process Job Event Confirm */
S16F10 .

/* Data Report Create Request */
S17F1 W
    <L [4]
        <U2 0>      /* DATAID */
        <U2 1>      /* RPTID */
        <A "GOOD">  /* DATASRC */
        <L
            <U2 3>  /* VID */
        >
    >.

/* Data Report Create Acknowledge */
S17F2
        <L [2]
            <U2 1>  /* RPTID */
            <U1 0>  /* ERRCODE */
        >.

/* Data Report Delete Request */
S17F3 W
    <L
        <U2 1>      /* RPTID */
    >.

/* Data Report Delete Acknowledge */
S17F4
    <L[2]
        <BOOLEAN 0x1>         /* ACKA */
        <L
            <L[3]
                <U2 1>            /* RPTID */
                <U1 2>            /* ERRCODE */
                <A "Error msg">   /* ERRTEXT */
            >
        >
    >.

/* Trace Create Request */
S17F5 W
        <L[6]
            <U2 1>              /* DATAID */
            <U2 2>              /* TRID */
            <BOOLEAN 0x01>      /* CEED */
            <L[2]
                <U1 3>          /* RPTID */
                <U1 4>          /* RPTID */
            >
            <F4 20.0>           /* TRSPER */
            <L[8]
                <U4 20>         /* TOTSMP */
                <U2 5>          /* REPGSZ */
                <A "START">     /* EVNTSRC */
                <U4 17>         /* CEID */
                <A "STOP">      /* EVNTSRC */
                <U4 20>         /* CEID */
                <BOOLEAN 0x1>   /* TRAUTOD */
                <BOOLEAN 0x0>   /* RPTOC */
            >
        >.

/* Trace Create Acknowledge */
S17F6
    <L
        <U4 1>      /* TRID */
        <U1 0>      /* ERRCODE */
    >.

/* Trace Delete Request */
S17F7 W
    <L
        <U4 1>    /* TRID */
        <U4 2>    /* TRID */
    >.

/* Trace Delete Acknowledge */
S17F8
    <L[2]
        <BOOLEAN 0x1>             /* ACKA */
        <L
            <L[3]
                <U2 1>                /* TRID */
                <U2 0>                /* ERRCODE */
                <A "Error message">   /* ERRTEXT */
            >
        >
    >.

/* Collection Event Link Request */
S17F9 W
    <L[4]
         <U1 0>         /* DATAID */
         <A "LINK">     /* EVNTSRC */
         <U2 13 >       /* CEID */
         <L[2]
             <U1 2>     /* RPTID */
             <U1 5>     /* RPTID */
         >
     >.

/* Collection Event Link Acknowledge */
S17F10
    <L[3]
        <A "LINK">      /* EVNTSRC */
        <U2 13>         /* CEID */
        <U2 0>          /* ERRCODE */
    >.


/* Collection Event Unlink Request */
S17F11 W
    <L[3]
        <A "UNLINK">    /* EVNTSRC */
        <U2 15 >        /* CEID */
        <U1 7>          /* RPTID */
    >.

/* Collection Event Unlink */
S17F12
    <L[4]
        <A "UNLINK">    /* EVNTSRC */
        <U2 15 >        /* CEID */
        <U1 7>          /* RPTID */
        <U2 0>          /* ERRCODE */
    >.

/* Trace Reset Request */
S17F13 W
    <L
        <U1 0>          /* TRID */
        <U1 2>          /* TRID */
    >.

/* Trace Report Reset Acknowledge */
S17F14
    <L[2]
        <BOOLEAN 0x1>               /* ACKA */
        <L
            <L[3]
                 <U1 0>                 /* TRID */
                 <U2 0>                 /* ERRCODE */
                 <A "Error message">    /* ERRTEXT */
            >
        >
    >.

/* Sample User-Defined Messages */
'S64F1' W
    <L
        <U2 1>
        > .

'S64F2'
    <L
        <U2 0>
        > .

/* Sample JIS-8 Message */
'S65F1'
        <J "ABC¡¢£"> .      /* JIS-8 Data Item */

/* THE END! */
