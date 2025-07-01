
; fitness function
(=(fitness $candidate $in-a $in-b $gene)

    (let*
        (
            ($emergence (emergence $candidate $in-a $in-b))
            ($contr (contribution $in-a $in-b $emergence))
            ($total (foldl-atom $contr 0 $acc $x (+ $acc $x)))
        )
    
        (min (/ $total $gene) 1.0)
    )
)

