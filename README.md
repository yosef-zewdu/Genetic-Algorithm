# Genetic-Algorithm

This project implements and compares different genetic algorithm (GA) methods for solving optimization problems using Python and port the functions to MeTTa.

## Features

### MeTTa Implemetation

- Fitness
- Roulette Stochastic Acceptance
- Simulated Binary Crossover (SBX)
- Gaussian Mutation
- Population Initialization

### Python Implemetation

- **Selection Methods:**  
  - Roulette Stochastic Acceptance  
  - Roulette Wheel Selection  
  - Tournament Selection

- **Crossover Methods:**  
  - Simulated Binary Crossover (SBX)  
  - Uniform Crossover  
  - Single Point Crossover

- **Mutation Methods:**  
  - Gaussian Mutation  
  - Uniform Mutation  
  - Swap Mutation

- **Experimentation:**  
  - Automated experiments to compare the effect of different selection, crossover, and mutation methods  
  - Measures and plots mean best fitness and runtime for each method  
  - Results visualized using matplotlib

## Project Structure

```plaintext
Genetic-Algorithm/
 ├── python/ 
 │ ├── ga.py # Main Python implementation 
 │ ├── ga-test.py # Test scripts 
 │ ├── ga.ipynb # Jupyter notebook for experiments and plots 
 ├── metta/ 
 │ ├── ga.metta # MeTTa implementation of GA 
 │ ├── utils.metta # Utility functions 
 │ └── tests/ 
 │  ├── ga-test.metta 
 │  └── utils-test.metta 
 ├── requirements.txt # dependencies to install 
 └── README.md # Project documentation
```

## How to Run

### Python

1. Clone the repository:

   ```bash
   git clone https://github.comyosef-zewdu/Genetic-Algorithm.git
   cd Genetic-Algorithm


2. Create a virtual environment (optional but recommended):

   ```bash
   python -m venv venv
   source venv\bin\activate 
   

3. Install the required packages:

   ```bash
   pip install -r requirements.txt

4. **Run experiments in Jupyter Notebook:**  

   Open `python/ga.ipynb` and run all cells to reproduce the experiments and plots.

5. **Run from command line:**  
   run `python ga.py` or test scripts for execution.

### MeTTa

- MeTTa scripts are in the `metta/` directory.  
- See `metta/tests/` for example usage and tests.

## Results

- The notebook (`ga.ipynb`) compares the performance of different GA operators.
- For each method, it reports:
  - Mean best fitness over multiple runs
  - Total and average runtime
  - Plots for visual comparison

---

## References

- [Genetic Algorithm python Implementation](https://github.com/eyasubirhanu/GA)
