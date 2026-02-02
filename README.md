![alt text](https://github.com/cirobr/TinyMachines.jl/blob/main/images/logo-name-tm.png?raw=true)

# PascalVocTools.jl

[![Build Status](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml?query=branch%3Amain)

Toolset for handling PascalVOC-2012 dataset

## Usage
using PascalVocTools

* voc_download(): Download dataset
* voc_classnumber2classname()
* voc_classname2classnumber()
* voc_colormap2classnumber()
* voc_classnumber2colormap()
* voc_colors(): Colormap for classes 0:20
* voc_rgb2classes()
