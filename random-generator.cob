       identification division.
       program-id. random-generator.

       data division.
       working-storage section.
           copy "cobrand-data.copy".

       procedure division.
           call 'cobrand' using init-status, randed, cur-date
           display "The sum is " randed
           call 'cobrand' using init-status, randed, cur-date
           display "The sum is " randed
           call 'cobrand' using init-status, randed, cur-date
           display "The sum is " randed
           .
