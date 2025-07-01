!(bind! random-gauss (py-atom random.gauss))


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


;   ------------------------------ CROSS OVER function -----------------

; sbx crossover
(=(sbx $h1 $h2 $t1 $t2 $eta $crossover-rate $acc1 $acc2)
    (let*
        (
            ($x1 (min $h1 $h2))
            ($x2 (max $h1 $h2)) 
            ($rand (random-float 0 1))
            ($beta (+ 1.0 (/ (* 2.0 $x1) (- $x2 $x1))))
            ($alpha (- 2.0 (pow-math $beta (* -1 (+ $eta 1) ))))
            ($betaq (if (<= $rand (/ 1.0 $alpha)) (pow-math (* $rand $alpha) (/ 1.0 (+ $eta 1))) (pow-math (/ 1.0 (- 2.0 (* $rand $alpha))) (/ 1.0 (+ $eta 1)))))
            ($c1' (* 0.5 (- (+ $x2 $x1) (* $betaq (- $x2 $x1)))))
            ($c2' (* 0.5 (+ (+ $x2 $x1) (* $betaq (- $x2 $x1)))))
            ($cc1 (min (max $c1' 0.0) 1.0))
            ($cc2 (min (max $c2' 0.0) 1.0))
            ($c1 (cons-atom $cc1 $acc1))
            ($c2 (cons-atom $cc2 $acc2))
            (($res1 $res2)  (crossover $t1 $t2 $eta $crossover-rate $c1 $c2)) ; crossover happened
        )
        ($res1 $res2)
    )
)

; copy from parent without crossover
(= (copygene $h1 $h2  $t1 $t2 $eta $crossover-rate $acc1 $acc2)
    (let* 
        (
            ($c1 (cons-atom $h1 $acc1))
            ($c2 (cons-atom $h2 $acc2))
            (($res1 $res2) (crossover $t1 $t2 $eta $crossover-rate $c1 $c2))
        )
        ($res1 $res2)    
    )
)


(=(crossover $p1 $p2 $eta $crossover-rate $acc1 $acc2)
    (if (or (== $p1 ()) (== $p2 ())) ((reverse $acc1 ()) (reverse $acc2 ()))
        (let* ( 
                (($h1 $t1) (decons-atom $p1))
                (($h2 $t2) (decons-atom $p2))
            )

            (if (<= (random-float 0 1) 0.5) 
                (if (> (abs-math (- $h1 $h2)) 1e-14)
                    (sbx $h1 $h2 $t1 $t2 $eta $crossover-rate $acc1 $acc2)
                    (copygene $h1 $h2 $t1 $t2 $eta $crossover-rate $acc1 $acc2)
                )
                (copygene $h1 $h2 $t1 $t2 $eta $crossover-rate $acc1 $acc2)
            )              
        )
    )
)


;crossover based on crossover rate
(=(sbx-crossover $p1 $p2 $eta $crossover-rate $acc1 $acc2)
    

        (if (> (random-float 0 1) $crossover-rate)
            ($p1 $p2) 

            (crossover $p1 $p2 $eta $crossover-rate $acc1 $acc2)
        )
    
)



;   ---------------------- MUTATION function---------------------

(= (mutate $individual $mutation-std $mutation-rate $acc)
    (if (== $individual ())
        $acc
        (let*
            (
                (($gene $tail) (decons-atom $individual))
                ($rand (random-float 0 1))
                ($mutated-gene (if (< $rand $mutation-rate)
                                    (min (max (+ $gene (random-gauss 0 $mutation-std)) 0.0) 1.0)
                                    (min (max $gene 0.0) 1.0)
                                   ))
                ($mutated (union-atom $acc ($mutated-gene)))
            )
            (mutate $tail $mutation-std $mutation-rate $mutated)
        )
    )
)


;-------------------------- SELECTION function---------------------
(= (roulette-stochastic-acceptance $population $fitnesses)
    (let*
        (
            ($w-max (max-atom $fitnesses))
            ($n (size-atom $population))
            ($i (random-int 0 $n))
            ($rand (random-float 0 1))
            ($fit-i (index-atom $fitnesses $i))
            ; ($_ (println! ($i)))
        )
        (if (< $rand (/ $fit-i $w-max))
            (index-atom $population $i)
            (roulette-stochastic-acceptance $population $fitnesses)
        )
    )
)