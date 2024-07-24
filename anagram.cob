       IDENTIFICATION DIVISION.
       PROGRAM-ID. ANAGRAM.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-SUBJECT PIC X(20).
       01 WS-CANDIDATES-COUNT PIC 9.
       01 WS-CANDIDATES-TABLE.
           02 WS-CANDIDATES OCCURS 1 TO 20
                            DEPENDING ON WS-CANDIDATES-COUNT.
              05 WS-CANDIDATE PIC X(20).
       01 WS-RESULT-LIST PIC X(48) VALUE SPACES.

       LOCAL-STORAGE SECTION.
       01 LS-I USAGE IS INDEX.
       01 LS-LC PIC X(20).
       01 LS-OK PIC 1 VALUE 0.

       01 LS-TALLY-CUR PIC X(20).
       01 LS-TALLY-I USAGE IS INDEX.
       01 LS-PHASE-I USAGE IS INDEX.
       01 LS-EQ-COUNT PIC 99.
       01 LS-TALLY-ASCII PIC A.
       01 LS-TALLY-TABLE.
         02 LS-TALLY-PHASE OCCURS 2 TIMES.
           03 LS-TALLY OCCURS 26 TIMES.
              05 LS-TALLY-COUNT PIC 999.

       PROCEDURE DIVISION.

       FIND-ANAGRAMS.
           move spaces to WS-RESULT-LIST
           move function lower-case (WS-SUBJECT) to WS-SUBJECT
           perform ADD-IF-VALID
             varying LS-I
             from 1 by 1
             until LS-I > WS-CANDIDATES-COUNT
           .

       ADD-IF-VALID.
           move function lower-case(WS-CANDIDATE(LS-I)) to LS-LC
           perform CHECK-ANAGRAM
           if LS-OK = 1 then
            perform ADD-WORD
           end-if
           .
       
       ADD-WORD.
           if WS-RESULT-LIST = spaces then
            string WS-CANDIDATE(LS-I) into WS-RESULT-LIST
           else
            string WS-RESULT-LIST delimited by space
                   ","
                   WS-CANDIDATE(LS-I)
                   into WS-RESULT-LIST
           end-if
           .

       CHECK-ANAGRAM.
           move 0 to LS-OK
           if WS-SUBJECT not = LS-LC then
            move LS-LC to LS-TALLY-CUR
            move 1 to LS-PHASE-I

            perform TALLY-CHARACTERS
            move WS-SUBJECT to LS-TALLY-CUR
            move 2 to LS-PHASE-I
            perform TALLY-CHARACTERS

            perform CHECK-PHASES
           end-if
           .
       
       TALLY-CHARACTERS.
           perform TALLY-CHARACTER
             varying LS-TALLY-I
             from 1 by 1
             until LS-TALLY-I > 26
           .
       
       TALLY-CHARACTER.
           move 0 to LS-TALLY-COUNT(LS-PHASE-I, LS-TALLY-I)
           move function char (97 + LS-TALLY-I) to LS-TALLY-ASCII
           inspect LS-TALLY-CUR
             tallying LS-TALLY-COUNT(LS-PHASE-I, LS-TALLY-I)
             for all LS-TALLY-ASCII
           .
       
       CHECK-PHASES.
           move 0 to LS-EQ-COUNT.
           perform
             varying LS-TALLY-I
             from 1 by 1
             until LS-TALLY-I > 26
            if LS-TALLY-COUNT(1, LS-TALLY-I) = LS-TALLY-COUNT(2, LS-TALLY-I) then
             add 1 to LS-EQ-COUNT
            end-if
           end-perform
           if LS-EQ-COUNT = 26 then
            move 1 to LS-OK
           end-if
           .

       END PROGRAM ANAGRAM.
