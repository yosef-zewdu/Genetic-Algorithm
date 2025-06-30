
; fitness function
(=(fitness $candidate $in-a $in-b $gene)

    (let*
        (
            ($emerg (difference $candidate (maximum $in-a $in-b)))
            ($emergence (reverse (collapse (max 0 (superpose $emerg))) ())) ; clamp negative emergence to 0
            ($contr (contribution $in-a $in-b $emergence))
            ($total (foldl-atom $contr 0 $acc $x (+ $acc $x)))
        )
    
        (min (/ $total $gene) 1.0)
    )
)

