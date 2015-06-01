       identification division.
       program-id. read-until-we-die.

       data division.
         working-storage section.
           01 user-input pic 9(10).
           01 total pic 9(10).

       procedure division.
           perform forever
             display "Enter a number, or empty to stop"
             accept user-input
             if user-input = 0
               exit perform
             end-if
             add user-input to total
           end-perform
           display "The sum is " total
           .
