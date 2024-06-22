![alt text](https://github.com/cirobr/TinyMachines.jl/blob/main/images/logo-name-tm.png?raw=true)

# PascalVocTools.jl

[![Build Status](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml?query=branch%3Amain)

Toolset for handling PascalVOC-2012 dataset

## Usage
using PascalVocTools

* voc_download:               Download dataset
* voc_classnumber2classname:  Dictionary with class numbers (keys) and names (values)
* voc_classname2classnumber:  Dictionary with class names (keys) and numbers (values)
* voc_colormap2classnumber:   Dictionary with RGB colormaps (keys) and numbers (values)
* voc_classnumber2colormap

* voc_rgb2classes(mask::Matrix{RGB{N0f8}}):\
Function that accepts a mask from SegmentationClass folder as input, and outputs an array of same dimension where each pixel is the numeric integer corresponding to the class number
