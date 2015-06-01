       identification division.
       program-id. depending-on.

       data division.
         working-storage section.
           copy "cobrand-data.copy".

           01 randomresult PIC S9V9(10).

       procedure division.
           call 'cobrand' using randomresult
           display "The sum is " randomresult
           .
