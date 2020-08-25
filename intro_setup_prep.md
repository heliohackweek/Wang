## Getting started on your personal computer

- Helio Hackweek 2020 [resources](https://github.com/edmondb/helio_info), including [courses](https://astg606.github.io/py_courses/helio_hw2020/)

### Setting up the Python environment
- Install miniconda
  - Anaconda/miniconda allows you to set up a clean Python environment easily. You can create multiple of them with different packages/configurations and switch between them.
  - Download a Python 3.7/3.8 installer from [here](https://docs.conda.io/en/latest/miniconda.html) and follow the [instructions](https://conda.io/projects/conda/en/latest/user-guide/install/index.html) to install.
- Create a new Python enviornment and install packages needed. Following example creates an env called `tf`:
  ```
  conda create -n tf tensorflow jupyter h5py matplotlib pandas tqdm seaborn
  ```
- Activate the conda python environment you created and check if you are using the conda typing `python` from command line:
  ```
  [~]$ conda activate tf
  (tf) [~]$ which python
  ~/miniconda3/envs/tf/bin/python
  (tf) [~]$ python
  Python 3.6.9 |Intel Corporation| (default, Sep 11 2019, 16:40:08) 
  [GCC 4.8.2 20140120 (Red Hat 4.8.2-15)] on linux
  Type "help", "copyright", "credits" or "license" for more information.
  Intel(R) Distribution for Python is brought to you by Intel Corporation.
  Please check out: https://software.intel.com/en-us/python-distribution
  >>> 
  ```
- You may add more packages later when you are in a specific env:
  ```
  [~]$ conda activate tf
  [~]$ conda install -c bokeh bokeh
  ```
  Here, `-c bokeh` specifiy the channel in conda for the package `bokeh`. Sometimes, it is not necessary to specify the channel. If you are not sure about the channel or any specifics, it is usually useful to search for it in Google or https://anaconda.org/.

### Clone the project's Github repository
`git clone https://github.com/heliohackweek/plasma_closure.git`


### View/run the Jupyter Notebooks
We rely on Jupyter Notebooks for interactive coding and demonstration. After 
```
[~/src]$ cd plasma_closure/
[~/src/plasma_closure]$ conda activate tf
(tf) [~/src/plasma_closure]$ jupyter-notebook
```
A browser tab will pop up and open the url like http://localhost:8889/tree . If not, check the on-screen information shown after you run `jupyter-notebook` in the terminal and look for something like
```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8890/?token=39a518ee2c5a09fca01ea256afbbf097d29ae82e6038dbe6
```
Here, you may open a browser and manually enter the url http://localhost:8890/?token=39a518ee2c5a09fca01ea256afbbf097d29ae82e6038dbe6
