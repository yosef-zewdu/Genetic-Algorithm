from ga import * 

INPUT_A = [0.9, 0.9, 0.0, 0.8, 0.2, 0.9, 0.7, 0.7]
INPUT_B = [0.8, 0.2, 1.0, 0.3, 0.9, 0.4, 0.7, 0.3]
candidate = [0.9,  0.9,  0.5,  0.9,  1.0,  0.9,  0.9,  0.8]
population = [ [1.0, 0.9, 0.7, 0.9, 1.0, 0.5, 0.1, 0.9], 
              [0.9,  0.9,  0.0,  0.8,  0.2,  0.9,  0.7,  0.7], 
              [0.8,  0.2,  1.0,  0.3,  0.9,  0.4,  0.6,  0.3]] 
fitnesses = [0.4, 0.5, 0.6]

# === Parameters ===
POP_SIZE = 5
GENES = 8
GENERATIONS = 30
ELITE_COUNT = 3
CROSSOVER_RATE = 0.9
MUTATION_RATE = 0.1
INITIAL_MUTATION_STD = 0.5  # High initial value
MUTATION_DECAY = 0.95       # Decay factor per generation
INITIAL_SBX_ETA = 2
SBX_ETA_GROWTH = 1.05       # SBX eta increases each generation


print(f'candidate fitness: {fitness(candidate)}')

print(f'cross over: {sbx_crossover(INPUT_A, INPUT_B, INITIAL_SBX_ETA)}')

print(f'mutation: {mutate(INPUT_A, INITIAL_MUTATION_STD)}')

print(f'selection: {roulette_stochastic_acceptance(population, fitnesses)}')

print(f'population initialization: {initialize_population()}')