![alt text](https://github.com/cirobr/TinyMachines.jl/blob/main/images/logo-name-tm.png?raw=true)

# PascalVocTools.jl

[![Build Status](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml?query=branch%3Amain)

Toolset for handling PascalVOC-2012 dataset

Download URRL: http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar

### Usage
```
using PascalVocTools; pvt=PascalVocTools

pvt.classnumber2classname(10)
pvt.classname2classnumber("cow")
```
