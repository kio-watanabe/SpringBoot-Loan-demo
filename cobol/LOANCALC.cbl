      ****************************************************************
      *                                                              *
      *         ÉçÅ[Éìï‘çœäzåvéZÉTÉìÉvÉãÅiå≥óòãœìôï‘çœÅj             *
      *                                                              *
      ****************************************************************
       IDENTIFICATION          DIVISION.
      ****************************************************************
       PROGRAM-ID.             LOANCALC.
       AUTHOR.                 TOKYO-SYSTEM-HOUSE.
       DATE-WRITTEN.           2023/03/20.
       ENVIRONMENT             DIVISION.
       CONFIGURATION           SECTION.
       SOURCE-COMPUTER.        OPEN-COBOL.
       OBJECT-COMPUTER.        OPEN-COBOL.
      ****************************************************************
       DATA                    DIVISION.
      ****************************************************************
       WORKING-STORAGE         SECTION.
       01  WK-AREA.
         03  INTEREST-RATE     PIC 9(02)V9(03).
         03  INTEREST-YEAR     PIC 9(02)V9(09).
         03  KAKUNIN           PIC X.
       01  COMPUTE-AREA.
         03  PERIODS           PIC 999.
         03  PAYMENT           PIC 9(09)V9(09).
         03  LOAN              PIC 9(09)V9(09).
         03  INTEREST-MONTH    PIC 9(02)V9(09).
      ****************************************************************
       LINKAGE                 SECTION.
      ****************************************************************
       01  LNK-LOAN            PIC 9(09).  
       01  LNK-INTEREST-RATE   PIC 9(02)V9(03).
       01  LNK-PERIODS         PIC 9(04).
       01  LNK-PAYMENT         PIC 9(09).
      ****************************************************************
       PROCEDURE               DIVISION
                               USING    LNK-LOAN,
                                        LNK-INTEREST-RATE,
                                        LNK-PERIODS,
                                        LNK-PAYMENT.
      ****************************************************************
       HAJIME.
           INITIALIZE WK-AREA
                      COMPUTE-AREA.
       MAIN-000.
           MOVE    LNK-LOAN          TO LOAN.
           MOVE    LNK-INTEREST-RATE TO INTEREST-RATE.
           MOVE    LNK-PERIODS       TO PERIODS.
       MAIN-100.
           COMPUTE INTEREST-YEAR   = INTEREST-RATE / 100.
           COMPUTE INTEREST-MONTH  = INTEREST-YEAR / 12.
      *  ñàâÒÇÃï‘çœäz = (éÿì¸ã‡äz * åéóò * ((1 + åéóò) ** (ï‘çœâÒêî))) 
      *               / ((1 + åéóò) ** (ï‘çœâÒêî) - 1)
           COMPUTE PAYMENT =
                  (LOAN * INTEREST-MONTH *
             ((1 + INTEREST-MONTH) ** (PERIODS))) /
             ((1 + INTEREST-MONTH) ** (PERIODS) - 1).
       MAIN-900.
           MOVE    PAYMENT           TO LNK-PAYMENT.
       OWARI.
           GOBACK.

      *--------------------<< END OF PROGRAM >>-----------------------*

