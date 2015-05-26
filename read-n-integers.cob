       identification division.
       program-id. read-n-integers.

       data division.
       working-storage section.
       01 i pic 9(3).
       01 cnt pic 9(3).
       01 user-input pic 9(10).
       01 total pic 9(10).

       procedure division.
           display "Enter the number of integers you want read"
           accept cnt
           perform varying i from 1 by 1 until i > cnt
             display "Enter the number #" i
             accept user-input
             add user-input to total
           end-perform
           display "The sum is " total
           .
