       identification division.
       program-id. cobrand.

       data division.
       linkage section.
           copy "cobrand-data.copy".

       procedure division using ls-result.
           if ls-did-init not equal "Y" then
             set ls-did-init to "Y"
             move function current-date to ls-current-date-data
           end-if
           compute ls-result = function random ()
           goback
           .
