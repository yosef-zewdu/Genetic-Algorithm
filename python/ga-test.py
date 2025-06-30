import sys
import os
# sys.path.append(os.path.abspath('../scripts'))
from ga import * 

INPUT_A = [0.9, 0.9, 0.0, 0.8, 0.2, 0.9, 0.7, 0.7]
INPUT_B = [0.8, 0.2, 1.0, 0.3, 0.9, 0.4, 0.6, 0.3]
candidate = [0.9,  0.9,  0.5,  0.9,  1.0,  0.9,  0.9,  0.8]

print(f'candidate fitness: {fitness(candidate)}')