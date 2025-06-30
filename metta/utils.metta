; utility functions

; maximum
(= (max $x $y) (if (< $x $y) $y $x))
; minimum
(= (min $x $y) (if (< $x $y) $x $y))

; find element-wise maximum of two lists
(=(maximum $lst1 $lst2)

    (if (or (== $lst1 ()) (== $lst2 ()))
        ()
        (let*
            (
                (($h1 $t1) (decons-atom $lst1))
                (($h2 $t2) (decons-atom $lst2))
                ($max (max $h1 $h2))
                ($res (maximum $t1 $t2))
            )
            (cons-atom $max $res)
        )
    )
)

; find element-wise minimum of two lists
(=(minimum $lst1 $lst2)

    (if (or (== $lst1 ()) (== $lst2 ()))
        ()
        (let*
            (
                (($h1 $t1) (decons-atom $lst1))
                (($h2 $t2) (decons-atom $lst2))
                ($min (min $h1 $h2))
                ($res (minimum $t1 $t2))
            )
            (cons-atom $min $res)
        )
    )
)

; reverse
(=(reverse $list $acc)  
    (if(== $list ()) $acc
    (let ($head $tail ) (decons-atom $list) (reverse $tail (cons-atom $head $acc) ))
    )
)


; elementwise difference of two lists
(=(difference $lst1 $lst2)

    (if (or (== $lst1 ()) (== $lst2 ()))
        ()
        (let*
            (
                (($h1 $t1) (decons-atom $lst1))
                (($h2 $t2) (decons-atom $lst2))
                ($dif (- $h1 $h2))
                ($res (difference $t1 $t2))
            )
            (cons-atom $dif $res)
        )
    )
)

