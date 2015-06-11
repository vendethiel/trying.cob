       identification division.
       program-id. cobrand.

       environment division.
       configuration section.
       repository.
           function all intrinsic.

       data division.
       linkage section.
           copy "cobrand-data.copy".

       procedure division using init-status, randed, cur-date.
           if init-status = "N" then
             set did-init to true
             move current-date to cur-date
             compute randed = random (current-minute * 1000 +
              current-second)
           else
             display ":v"
             compute randed = random ()
           end-if
           goback
           .
