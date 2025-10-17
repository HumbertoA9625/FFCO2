CO₂ SIMULATION ON MRST

This repository contains a workflow for simulating CO₂ injection using the Matlab Reservoir Simulation Toolbox (MRST).
The setup is based by the FluidFlower experimental configuration and demonstrates.

STRUCTURE

experiment_to_mesh/
Contains figures illustrating how to transition from the experimental setup to the computational grid. These examples are derived directly from the FluidFlower medium.

mrstExample/
Includes the main MATLAB scripts and input files for the simulation.
The primary script is exampleCO2inj, which is commented and also available as a .mlx file for better visualization.


MRST CORE MODULE

Includes

Geological description: structured and unstructured grids

Petrophysical properties (porosity, permeability, etc.)

Drive mechanisms (wells, boundary conditions)

Reservoir state (pressures, saturations, fluxes, etc.)

----------------------------------------------------------------------------------------
STEPS

Open MATLAB

Run the startup.m file located in your MRST folder

Change the path to the folder

Run the script exampleCO2inj.m

Download a matlab module for Simulation on section 6 (DONT REMEMBER WHICH, AMGCL*)

The first time you run the model, MATLAB will prompt you to download and set up AMGCL and Boost.
NECCESARYY

----------------------------------------------------------------------------------------
MODEL COMPONENTS
1. Mesh

Predefined meshes (coarse or fine) are loaded from the provided directory.
Each region (reservoir, caprock, fault) is color-coded for visualization.

2. Rock Properties

Porosity and permeability are assigned per region.
Values differ depending on the simulation depth (surface or 1km).

3. Fluids

Fluid properties are initialized from ECLIPSE-type .DATA files, including:
Formation volume factors (FVF), Capillary pressure, Relative permeability, Compressibility and surface densities

Thermodynamic models follow formulations from:

Duan & Sun (2003), Chemical Geology, Spycher et al. (2003), Geochimica et Cosmochimica Acta, Hassanzadeh et al. (2008), IJGGC

4. Initialization

Hydrostatic pressure distribution and initial saturations are computed numerically, assuming full water saturation.

5. Wells

Injection wells are defined with variable injection rates, depth options, and total simulation times (ranging from minutes to years, depending on the case).

6. Model Setup

The GenericBlackOilModel is configured with adaptive nonlinear solvers (CPR preconditioning, line search, timestep strategy).
  6.1 Boundary Conditions
For surface cases: constant pressure on top faces, For 1 km depth cases: no-flow boundaries with open aquifer approximation
  6.2 Schedule
Injection schedules include ramp-up, constant injection, and ramp-down phases.
  6.3 Simulation 
Simulations are packaged and executed using:
[ok, status] = simulatePackedProblem(problem);
All outputs — reports, states, and well solutions — are saved automatically to the directory defined in outputDir.
  6.4 Results 
Post-processing includes pressure evolution, saturation fronts, and 3D visualizations
