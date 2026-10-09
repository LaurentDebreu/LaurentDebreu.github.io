---
layout: page
title: Software
---

## AGRIF: Adaptive Grid Refinement In Fortran

AGRIF provides adaptive mesh refinement for numerical models built on structured grids and written in Fortran. A source-to-source translator extends an existing model to operate on a hierarchy of grids, while a Fortran library manages grid hierarchy, time integration, and transfers between grids. The translator runs at compile time, helping integrate refinement into large existing codes; the library is designed to remain flexible with respect to the model equations and numerical methods.

[AGRIF website](http://agrif.imag.fr) · [Source code on GitLab](https://gitlab.inria.fr/ldebreu/agrif) · Distributed under the CeCILL-C licence.

### Integrations and use

AGRIF has been integrated into ocean and atmospheric models including [NEMO](https://www.nemo-ocean.eu/), [CROCO](http://www.croco-ocean.org), MARS3D, and MESO-NH. Operational simulations using AGRIF are produced at IFREMER along the French coast and by the French Navy; JPL/NASA has also used it for high-resolution simulations on the US West Coast. More than 200 papers have used AGRIF for local mesh refinement ([publication list](https://drive.google.com/file/d/1o_SmHODzIpcAjnvq2fPObvFV6CosNv8_/view?usp=sharing)).

### Publications using AGRIF

The following figures illustrate the international use of AGRIF and the number of related publications over time.

<div class="software-figure-pair" markdown="0">
<figure class="software-figure">
<a href="{{ '/assets/images/agrif-countries.png' | relative_url }}"><img src="{{ '/assets/images/agrif-countries.png' | relative_url }}" alt="Bibliometric map showing countries represented in publications using AGRIF, across Europe, the Americas, Africa, Asia, and Oceania."></a>
<figcaption>Countries represented in publications using AGRIF.</figcaption>
</figure>
<figure class="software-figure">
<a href="{{ '/assets/images/agrif-publications-per-year.png' | relative_url }}"><img src="{{ '/assets/images/agrif-publications-per-year.png' | relative_url }}" alt="Bar chart of AGRIF-related publications per year from 2003 to 2026."></a>
<figcaption>AGRIF-related publications per year.</figcaption>
</figure>
</div>

## Contributions to other modeling systems

- [CROCO](http://www.croco-ocean.org) — contributions to development of a regional and coastal ocean-modeling system.
- [NEMO](https://www.nemo-ocean.eu/) — contributions to development of a European ocean-modeling framework for large-scale and climate simulations.
