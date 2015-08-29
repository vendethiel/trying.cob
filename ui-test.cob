       identification division.
       program-id. test-ui.


       data division.
       working-storage section.
       77 ws-name pic A(10) value "YO YO YO".

       screen section.
       01 main-screen blank screen.
         02 line 1 col 5 pic A(10) from ws-name.
         02 line 2.
           03 col 1 value "hey".
           03 col 32 value "???".

       procedure division.
           display main-screen
           end-display.
           call "C$SLEEP" using 5 end-call.
