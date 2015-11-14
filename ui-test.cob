       identification division.
       program-id. test-ui.


       data division.
       working-storage section.
       01 ws-name pic A(10) value "YO YO YO".

       screen section.
       01 main-screen.
         02 line 2 col 20 value "feow XD XD XD".
         02 line 3 col 20 pic A(10) using ws-name.
         02 line 4 col 15 value "heyo".

       procedure division.
           move "hey you" to ws-name.
           display main-screen.
           goback.         
