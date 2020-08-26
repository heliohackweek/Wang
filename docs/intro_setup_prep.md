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

### Collatorative working on the project's Github repository
- `git clone https://github.com/heliohackweek/plasma_closure.git`
- Check out the [resource page](https://github.com/edmondb/helio_info)
- [git cheatsheet](https://education.github.com/git-cheat-sheet-education.pdf)
- It is preferred to work on your own branch, then merge back to the master. For example,
  ```
  git checkout -b NEW_BRANCH
  # make changes & commit
  git checkout master
  git pull
  git merge NEW_BRANCH
  git push
  ```

### View/run the Jupyter Notebooks
We rely on Jupyter Notebooks for interactive coding and demonstration. After 
```
cd plasma_closure/
conda activate tf
jupyter-notebook
```
A browser tab will pop up and open the url like http://localhost:8889/tree . If not, check the on-screen information shown after you run `jupyter-notebook` in the terminal and look for something like
```
Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://localhost:8890/?token=39a518ee2c5a09fca01ea256afbbf097d29ae82e6038dbe6
```
Here, you may open a browser and manually enter the url http://localhost:8890/?token=39a518ee2c5a09fca01ea256afbbf097d29ae82e6038dbe6


### Working on the Rapids system
```
log into the nvidia cluster; otka must have been setup already
a web browser window will pop up and you need to enter the user
name and password you used when you signed up (not the crazy
random strings)
sft ssh raplab-hackathon

# copy the singularity docker image
cp /mnt/shared/helio_hackweek/helio-hackweek2020_latest.sif .

# copy the script to start a jupyter server on the gpu node
cp /mnt/shared/helio_hackweek/start_jupyter.sh .

# in start_jupyter.sh, replace  the port number 8888 with a port
# that has no conflict with others, say, 8895

# request a job with gpu support
srun --pty --gpus 1 bash -i

# hostname command returns node name, say, dgx0183
hostname

# run the singularity image
singularity shell --nv helio-hackweek2020_latest.sif

# activate the conda environment
source activate rapids

# in start_jupyter.sh, replace dxg0180 with the  current node name, say dgx0183, and
# modify the port number 8888 with a port that has no conflict with others, say, 8895

# run the Jupyter server
./start_jupyter.sh
```
```
# in your local laptop terminal, run the following command, with dgx0183 replaced
# by the node name, and 8895 replaced by the port number you chose
sft ssh -L localhost:8895:dgx0183:8895 raplab-hackathon
# in your local laptop terminal, open http://localhost:8895
```
One may also use the adapted [start_jupyter.sh script](../scripts/start_jupyter.sh)
that automatically prints the full sft command to be used with the correct hostname
and ports.
