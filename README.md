## Machine learning of plasma fluid closures

In this Hackweek project, we first build a simple [machine learning model for plasma fluid closures](intro_physics.md). We enhance the model's performance and extend the its capability, during which we learn about basic machine learning techniques and best practices.


### Tentative project tasks
__Note: Please suggest any topics in machine learning or python GPU that you find potentially useful for space science (for example, for your own work).__
- Set up a handy Python environment and clone this repository following the [introduction](intro_setup_prep.md).
- We will first build a simple model to learn the closure given by equation (1).
  - The input/feature data T consists sinusoidal modes of random phases and amplitudes.
  - The output/label data q will be computed from the closure equation (1).
  - The model has only three fully-connected (dense) layers, i.e., only one hidden layer.
  - The model is implemented using TensorFlow and is demonstrated in the [Jupyter notebook](notebooks/fluid_closure_learning-1d-000.ipynb)
- We will enhance the simple model. Tentative tasks are
  - Learn how to apply a model learned from data of lower-resolution to data of higher-resolution.
  - Learn and try [Convolutional Neural Networks(CNN)](https://stanford.edu/~shervine/teaching/cs-230/cheatsheet-convolutional-neural-networks).
  - Learn how to train data batch-by-batch.
  - Learn how to find optimal hyper-parameters, i.e., those related to machine learning algorithms.
  - Learn how to accelerate the code using GPU.
  - Learn the saved model weights etc. and possibly how to use them outside of TensorFlow.
  - Learn to use PyTorch.
  - Extend the code to 2d using CNN and GPU.
- Other tasks
  - Accelerate non-ML codes using Numba and cupy, and possibly Dask. A base example can be found [here](notebooks/cupy.001.ipynb).
  - Make interactive plots using bokeh or plotly.
  - Learn common open-source software license.
  - Build a pip or anaconda distributable package.
  - Build an affiliated website using Github Pages.


### Team
- David Hall (Nvidia; Support)
- Sheng Huang (Boston University)
- Colin Komar (NASA/GSFC)
- Jian Li (NASA/GSFC; Support)
- Ryan McGranaghan (ASTRA)
- Saumitra Mukherjee (Jawaharlal Nehru University)
- Lutz Rastaetter (NASA/GSFC)
- Liang Wang (Princeton University; Team lead)
- Yihua Zheng (NASA/GSFC)

### Project folder structure
- `notebooks`: Demo Jupyter Notebooks.
- `contirbutors`: Folder to store stuff for individual contributors.
