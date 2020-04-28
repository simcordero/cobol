       IDENTIFICATION DIVISION.
       PROGRAM-ID. COVID01.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT COUNTRY-REC ASSIGN TO CNTRYREC.
           SELECT PRINT-REC ASSIGN TO PRTLINE.
       DATA DIVISION.
       FILE SECTION.
       FD COUNTRY-REC
           RECORDING MODE F.
       01 INPUT-LINE PIC X(130).
       FD PRINT-REC
           RECORDING MODE F.
       01 OUTPUT-LINE PIC X(80).
       WORKING-STORAGE SECTION.
       01 RULER.
           05 FILLER PIC X(50) VALUE
           '**************************************************'.
       01 REPORT-DATE.
           05 FILLER PIC X(6) VALUE 'DATE: '.
           05 REP-DATE PIC X(10).
       01 REPORT-TIME.
           05 FILLER PIC X(6) VALUE 'TIME: '.
           05 REP-TIME PIC X(9).
       01 REPORT-COUNTRY.
           05 FILLER PIC X(9) VALUE 'COUNTRY: '.
           05 REP-COUNTRY PIC X(44).
       01 REPORT-CODE.
           05 FILLER PIC X(14) VALUE 'COUNTRY CODE: '.
           05 REP-CODE PIC X(2).
       01 REPORT-SLUG.
           05 FILLER PIC X(6) VALUE 'SLUG: '.
           05 REP-SLUG PIC X(44).
       01 REPORT-CASE-NEW.
           05 FILLER PIC X(21) VALUE 'NEW CONFIRMED CASES: '.
           05 REP-CASE-NEW PIC 9(5).
       01 REPORT-CASE-TOTAL.
           05 FILLER PIC X(23) VALUE 'TOTAL CONFIRMED CASES: '.
           05 REP-CASE-TOT PIC 9(5).
       01 REPORT-DEATH-NEW.
           05 FILLER PIC X(12) VALUE 'NEW DEATHS: '.
           05 REP-DEATH-NEW PIC 9(5).
       01 REPORT-DEATH-TOT.
           05 FILLER PIC X(14) VALUE 'TOTAL DEATHS: '.
           05 REP-DEATH-TOT PIC 9(5).
       01 REPORT-RECVD-NEW.
           05 FILLER PIC X(16) VALUE 'NEW RECOVERIES: '.
           05 REP-RECVD-NEW PIC 9(5).
       01 REPORT-RECVD-TOT.
           05 FILLER PIC X(18) VALUE 'TOTAL RECOVERIES: '.
           05 REP-RECVD-TOT PIC 9(5).
       01 REP-TIMESTAMP.
           05 TS-DATE PIC X(10).
           05 TS-TIME PIC X(9).
       01 LASTREC PIC X VALUE 'N'.
       PROCEDURE DIVISION.
       OPEN-FILES.
           OPEN INPUT COUNTRY-REC.
           OPEN OUTPUT PRINT-REC.
       READ-NEXT-RECORD.
          PERFORM READ-RECORD
           PERFORM UNTIL LASTREC = 'Y'
           PERFORM WRITE-RECORD
           PERFORM READ-RECORD
           END-PERFORM
          .
       PRGM-EXIT.
           CLOSE COUNTRY-REC.
           CLOSE PRINT-REC.
           STOP RUN.
       READ-RECORD.
           READ COUNTRY-REC
           AT END MOVE 'Y' TO LASTREC
           END-READ.
       WRITE-RECORD.
           UNSTRING INPUT-LINE DELIMITED BY ','
           INTO REP-COUNTRY
                REP-CODE
                REP-SLUG
                REP-CASE-NEW
                REP-CASE-TOT
                REP-DEATH-NEW
                REP-DEATH-TOT
                REP-RECVD-NEW
                REP-RECVD-TOT
                REP-TIMESTAMP.
           MOVE TS-DATE TO REP-DATE.
           MOVE TS-TIME TO REP-TIME.
           WRITE OUTPUT-LINE FROM RULER.
           WRITE OUTPUT-LINE FROM REPORT-DATE.
           WRITE OUTPUT-LINE FROM REPORT-TIME.
           WRITE OUTPUT-LINE FROM REPORT-COUNTRY.                      .
           WRITE OUTPUT-LINE FROM REPORT-CODE.
           WRITE OUTPUT-LINE FROM REPORT-SLUG.
           WRITE OUTPUT-LINE FROM REPORT-CASE-NEW.
           WRITE OUTPUT-LINE FROM REPORT-CASE-TOTAL.
           WRITE OUTPUT-LINE FROM REPORT-DEATH-NEW.
           WRITE OUTPUT-LINE FROM REPORT-DEATH-TOT.
           WRITE OUTPUT-LINE FROM REPORT-RECVD-NEW.
           WRITE OUTPUT-LINE FROM REPORT-RECVD-TOT.
           WRITE OUTPUT-LINE FROM RULER.
