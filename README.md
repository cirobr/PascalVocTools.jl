# PascalVocTools

[![Build Status](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/cirobr/PascalVocTools.jl/actions/workflows/CI.yml?query=branch%3Amain)

Julia toolset for handling PascalVOC-2012 dataset

## Usage
using PascalVocTools; pv = PascalVocTools

pascalvoc_classnumbers # Dictionary with applicable class numbers (keys) and names (values)
pascalvoc_classnames   # Dictionary with applicable class names (keys) and numbers (values)
pascalvoc_colormap     # Dictionary with applicable RGB colormaps (keys) and numbers (values)

pascalvoc_rgb2class(mask::Matrix{RGB{N0f8}})
Function that accepts a mask from SegmentationClass folder as input, and outputs an array of same dimension where each pixel is the numeric integer corresponding to the class number