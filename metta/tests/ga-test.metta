!(register-module! ../../../Genetic-Algorithm)
!(import! &self Genetic-Algorithm:metta:utils)
!(import! &self Genetic-Algorithm:metta:ga)

!(fitness (0.9  0.9  0.5  0.9  1.0  0.9  0.9  0.8) (0.9  0.9  0.0  0.8  0.2  0.9  0.7  0.7) (0.8  0.2  1.0  0.3  0.9  0.4  0.6  0.3) 8)
!(sbx-crossover (0.9  0.9  0.0  0.8  0.2  0.9  0.7  0.7) (0.8  0.2  1.0  0.3  0.9  0.4  0.7  0.3) 2 0.9 () ())
!(mutate (0.9  0.9  0.0  0.8  0.2  0.9  0.7  0.7) 0.5 0.2 ())
!(roulette-stochastic-acceptance ((1.0 0.9 0.7 0.9 1.0 0.5 0.1 0.9) (0.9  0.9  0.0  0.8  0.2  0.9  0.7  0.7) (0.8  0.2  1.0  0.3  0.9  0.4  0.6  0.3)) (0.4 0.5 0.6))
!(initialize-population 5 8 ())


