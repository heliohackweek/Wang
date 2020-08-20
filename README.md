## Machine learning of fluid closures

This project is different from most other space physics machine learning projects that are almost exclusively driven by observational data. And it would be the among the first attempts to enhance the underlying physics of a physics-based plasma simulation model.


### Motivation

- Roughly speaking, there are two major types of plasma simulation codes, kinetic and fluid-based.
  - Kinetic models: track motion of many many particles;
    - Keep (almost) all physics; computationally expensive: example: Particle-in-cell
  - Fluid models: solve PDEs for density, velocity, temperature, etc.;
    - Simplify/Lose certain physics; computationally fast; example: MHD
- However, a fluid model inevitably makes certain assumptions, or “closures”.
  - Sometimes, a prescribed closure may give inaccurate results for certain problems.
- Our ultimate goald is to use Machine Learning to extract the more accurate closures from kinetic simulation results.
- Our goal for this Hackweek is a little bit shifted to make the tasks feasible within the time frame.
  - We will use data computed from a known closure, that works well for a certain type of problems (i.e., 1d electrostatic Landau damping).
  - It is highly likely that the same methodology/enhancement will be usable to train data from actual kinetic simulations. This work is a reproduction of the work in a recent [Ma+ 2020 POP](http://arxiv.org/abs/1909.11509).
- If successful in the end, we could greatly enhance the physics capabilities of existing fluid-based plasma models that are widely used in astrophysics, space physics, laboratory plasma physics.
  - For example, a [promising new planetary magnetosphere model](https://www.nas.nasa.gov/SC19/demos/demo7.html) currently uses a simplified closure, which could be a closure model trained with simulation data from expensive kinetic simulations.


#### More on the physics
- As an example, one could evolve a 1d electrostatic plasma using the following fluid equations    
  <img src="https://render.githubusercontent.com/render/math?math=(1)\quad\frac{\partial\rho}{\partial t}+\frac{\partial}{\partial x}\left(\rho u\right)=0">   
  <img src="https://render.githubusercontent.com/render/math?math=(2)\quad\frac{\partial}{\partial t}\left(\rho u\right)+\frac{\partial}{\partial x}\left(\rho u\right)=-\frac{\partial p}{\partial x}+\frac{e}{m}\rho E">  
  <img src="https://render.githubusercontent.com/render/math?math=(3)\quad\frac{\partial p}{\partial t}+\frac{\partial}{\partial x}\left(pu\right)=-2p\frac{\partial u}{\partial x}-\frac{\partial q}{\partial x}">  
  where t is time, ρ is density, u is velocity, p is pressure, q is pressure, E is electric field computed/supplied elsewhere, and m is single particle mass.
- The so-called closure problem here is that we need to specify q which is needed to solve the equations in time.
- In this project, we consider the closure suggested by ([Hammett & Perkins 1990 PRL](https://w3.pppl.gov/~hammett/refs/1990/Hammett_90_PRL_Landau_fluid_corrected.pdf)), which is forumulated in the Fourier space (k-space):  
  <img src="https://render.githubusercontent.com/render/math?math=(4)\quad\tilde{q}_{k}=-n_{0}\chi_{1}\frac{\sqrt{2}v_{t}}{\left|k\right|}ik\tilde{T}_{k}">  
  where <img valign="middle" src="https://render.githubusercontent.com/render/math?math=\tilde{q}"> is the heat flux fluctuation in the k space
  <img valign="middle" src="https://render.githubusercontent.com/render/math?math=\tilde{T}=\left(\tilde{p}-T_{0}\tilde{n}\right)/n_{0},">  is the temperature fluctuation in the k space, <img valign="middle" src="https://render.githubusercontent.com/render/math?math=\chi_{1}=\frac{2}{\sqrt{\pi}}"> is a chosen constant, n0 is the background density, T0 is vt is the background temperature, and <img valign="middle" src="https://render.githubusercontent.com/render/math?math=v_t=\sqrt{T/m}"> is the thermal speed.
- This closure works well for a certain type of problems (i.e., 1d electrostatic Landau damping). There are other closures that work better for other problems.
- There are 2d and 3d versions of such closures that we will also explore if time allows.


### Tentative project tasks
- We will first build a simple model to learn the closure given by equation (1).
  - The input/feature data T consists sinusoidal modes of random phases and amplitudes.
  - The output/label q will be computed from the closure equation (1).
- We will try to understand the simple model and enhance it. Example tasks are
  - Understand the model performance scores.
  - Learn how to find optimal hyper-parameters (i.e., those related to machine learning algorithms).
  - Learn how to apply a model learned from data of lower-resolution to data of higher-resolution.
  - Learn and try some basic structures of neural networks.
  - Learn how to accelerate the code using GPU.
  - Learn how to debug TensorFlow codes.
- We will extend the code to 2d/3d where certain type of neural networks could perform better than the others, and GPU acceleration could be more significant.



### Team
- Daniel da Silva (NASA/GSFC)
- David Hall (Nvidia)
- Sheng Huang (Boston University)
- Colin Komar (NASA/GSFC)
- Ryan McGranaghan (ASTRA)
- Saumitra Mukherjee (NASA/GSFC)
- Lutz Rastaetter (NASA/GSFC)
- Liang Wang (Princeton University; Team lead)
- Yihua Zheng (NASA/GSFC)
- Jian Li (NASA/NCCS)
