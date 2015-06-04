       identification division.
       program-id. cobrand.

       data division.
       linkage section.
           copy "cobrand-data.copy".

       procedure division using init-status, randed, cur-date.
           if init-status = "N" then
             set did-init to true
             move function current-date to cur-date
             compute randed = function random (current-minute * 1000 +
              current-second)
           else
             display ":v"
             compute randed = function random ()
           end-if
           goback
           .
