       identification division.
       program-id. cobrand.

       data division.
       linkage section.
           copy "cobrand-data.copy".

       procedure division using ls-result.
           if ls-did-not-init then
             set ls-did-init to true
             move function current-date to ls-current-date-data
           end-if
           compute ls-result = function random ()
           goback
           .
