#!/bin/sh

# install prerequisites
sudo apt install build-essential gfortran liboctave-dev libboost-graph-dev libgsl-dev libmatio-dev libslicot-dev libslicot-pic libsuitesparse-dev flex bison autoconf automake lmodern python3-sphinx libjs-mathjax doxygen x13as

# clone repo
git clone --recurse-submodules https://git.dynare.org/Dynare/dynare.git
cd dynare
autoreconf -si

# Configure the build tree 
./configure --with-matlab="/usr/local/MATLAB/R2021b" MATLAB_VERSION=R2020a --disable-octave

# For faster compilation
make -j$((`nproc`+1))

# For regular slow compilation use only
# make

# Make tests for stochastic simulations only with Matlab
cd /tests/
make m/stochastic_simulations
