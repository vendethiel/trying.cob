       identification division.
       program-id. dico.

       environment division.
         input-output section.
           file-control.
           select word assign to 'dico.txt'
           organization is line sequential.

       data division.
         file section.
           fd word.
           01 word-file pic A(25).

         working-storage section.
           01 ws-word pic A(25).
           01 ws-eof pic A(1).

       procedure division.
           open input student.
           perform until ws-eof='Y'
             read student into ws-student
               at end move 'Y' to ws-eof
               not at end display ws-student
             end-read
           end-perform.
           close student.
           stop run.
