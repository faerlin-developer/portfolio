# N-Body Simulation with MPI

!!! note ""

    :simple-github: [Click here for GitHub repository](https://github.com/faerlin-developer/n-body)

This application simulates the motion of bodies in an N-body system. 

<div align="center">
  <img class="animated-gif" src="../assets/n-body/sample.gif" width="400">
  <br/>
  <figcaption style="font-size: 0.9em;">Figure 2. Simulation of 1000 particles.</figcaption>
</div>

Particle trajectories are animated with the [SFML][sfml-url] library, while computations are distributed across multiple [MPI][mpi-url] processes that share a single array of particles using MPI-3 shared memory. Each process updates a segment of the array, with the restriction that all MPI ranks must run within the same memory domain (single node). The simulation supports two modes of force calculation: a brute-force O(n²) approach where each particle interacts with all others, and an optimized Barnes–Hut–style method using a quadtree to approximate distant groups of particles. The system dynamics follow Newton’s laws of gravity and motion, with particle positions updated through Euler integration.

## Built With

* [![cpp][cpp]][cpp-url]
* [SFML][sfml-url] (lightweight library for creating 2D graphics)
* [MPI][mpi-url] (library for distributed-memory parallel programming)

<!-- MARKDOWN LINKS & IMAGES -->

[cpp]: https://img.shields.io/badge/C++-00599C?style=flat-square&logo=C%2B%2B&logoColor=white
[cpp-url]: https://cplusplus.com/
[sfml-url]: https://www.sfml-dev.org/
[mpi-url]: https://www.mpi-forum.org/
