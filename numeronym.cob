       identification division.
       program-id. numeronym-main.

       data division.
       working-storage section.
       01 ws-word pic A(50).
       01 ws-res-word pic A(4).

       procedure division.
       main-line.
           move "internationalization" to ws-word
           perform display-numeronym
           move "hey" to ws-word
           perform display-numeronym
           move "I" to ws-word
           perform display-numeronym
           move "record" to ws-word
           perform display-numeronym
           goback
           .
       display-numeronym.
           call "calculate-numeronym"
             using content ws-word, reference ws-res-word
           display ws-res-word
           .
       end program numeronym-main.


       identification division.
       program-id. calculate-numeronym.

       data division.
       local-storage section.
      * implem details:
       01 ws-count-glob.
           05 ws-count-spc pic 99.
           05 ws-bare-count pic 99.
           05 ws-count pic 99.
           05 ws-count-str redefines ws-count pic AA.

       linkage section.
       01 ws-word pic A(50) value "internationalization".
       01 ws-res-word pic A(4).

       procedure division using ws-word, ws-res-word.
           inspect ws-word tallying ws-count-spc for trailing space.
           compute ws-bare-count =
             function length(ws-word) - ws-count-spc
           compute ws-count = ws-bare-count - 2
           if ws-count <= 1 then
             move ws-word to ws-res-word
           else
      * remove 2, the starting letters
             string ws-word(1:1)
                    ws-count-str
                    ws-word(ws-bare-count:ws-bare-count)
                    into ws-res-word
           end-if.
       goback.
