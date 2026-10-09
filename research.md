---
layout: page
title: Research
---

Numerical ocean models support climate research, seasonal and short-term forecasting, and applications such as marine biogeochemistry, carbon-cycle studies, and fisheries. Ocean dynamics span a wide range of interacting spatial and temporal scales. At the same time, the computational cost of these models limits how many scales can be resolved explicitly. Numerical methods must therefore represent unresolved processes while controlling truncation errors and preserving important physical properties of the flow. My work in applied mathematics focuses on three-dimensional, non-homogeneous ocean models, in which stratification, Earth's rotation, and complex bathymetry affect both the governing equations and their discretisation.

## Multiresolution ocean modeling

Most regional and large-scale three-dimensional ocean models use structured grids. Local refinement on structured grids instead requires carefully designed exchanges between fine and coarse grids; adaptive refinement also requires criteria for changing the grid and procedures for reinitialising the solution.

I have developed two-way nesting and adaptive refinement methods that account for features specific to ocean-model equations and discretisations. These include staggered grids and the separation of fast barotropic and slow baroclinic modes, which makes it difficult to combine spatial and temporal refinement. In particular, coupling fine and coarse grids at the fast barotropic time step helped make realistic applications possible. The methods have been integrated into models including NEMO, CROCO, MARS3D, HYCOM through the AGRIF refinement library. Related work has addressed data assimilation on locally refined grids and multigrid methods for variational assimilation and optimisation.

<div class="research-figure-pair" markdown="0">
  <figure class="research-figure">
    <img src="{{ '/assets/images/research-grid-hierarchy.png' | relative_url }}" alt="Three nested grid levels covering the Bay of Biscay." />
    <figcaption>Two refinement levels in the Bay of Biscay.</figcaption>
  </figure>
  <figure class="research-figure">
    <img src="{{ '/assets/images/research-surface-temperature.png' | relative_url }}" alt="Sea-surface temperature across the nested model grids in the Bay of Biscay." />
    <figcaption>Sea-surface temperature at the second refinement level from the corresponding multiresolution simulation.</figcaption>
  </figure>
</div>

## Numerical methods for ocean models

Numerical dissipation can distort ocean flows, for example by causing artificial mixing across surfaces of constant density. I have studied how to control this mixing in advection schemes, as well as dissipation associated with the coupling of fast barotropic and slow baroclinic modes.

I have also worked on representing complex bathymetry in structured-grid models using Brinkman volume penalisation. By combining porosity and friction, the method can better represent the seafloor in both geopotential and terrain-following coordinates. It has been implemented in CROCO and NEMO and tested in realistic simulations, including low-resolution modelling of Gulf Stream separation.

<figure class="research-figure" markdown="0">
  <img src="{{ '/assets/images/research-brinkman-penalization.png' | relative_url }}" alt="Gulf Stream separation in three simulations: a high-resolution reference, a low-resolution terrain-following simulation, and a low-resolution simulation with Brinkman penalization." />
  <figcaption>Gulf Stream separation: high-resolution reference (left), low-resolution terrain-following simulation (centre), and low-resolution simulation with Brinkman penalization (right). Joint work with N. Kevlahan and P. Marchesiello.</figcaption>
</figure>


## Model coupling

Coupling models raises distinct mathematical questions depending on the systems involved. For the ocean–atmosphere coupling problem, I used Schwarz waveform relaxation to derive and analyse coupling conditions, initially for idealised diffusion equations representing the oceanic and atmospheric boundary layers. In ensemble simulations, iterative coupling with these Schwarz iterative algorithms produced more stable solutions and reduced sensitivity to initial conditions.

Another challenge is coupling hydrostatic and non-hydrostatic ocean models, for example when moving between regions where different spatial resolutions make different physical approximations appropriate. The two systems have different wave dispersion relations, so standard strong coupling conditions are not generally suitable. Vertical normal-mode decompositions provide a way to analyse the interface and break the problem into simpler coupling problems, supported by theoretical results for the modes.

<figure class="research-figure research-figure--coupling" markdown="0">
  <img src="{{ '/assets/images/research-ocean-atmosphere-coupling.png' | relative_url }}" alt="Sea-surface temperature and surface wind around Cyclone Erica in a coupled ROMS–WRF simulation." />
  <figcaption>Example of Schwarz-method ocean–atmosphere coupling (ROMS–WRF) for Cyclone Erica. Joint work with F. Lemarié. </figcaption>
</figure>