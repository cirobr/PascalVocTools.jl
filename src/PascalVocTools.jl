module PascalVocTools


export pv_classnumbers, pv_classnames, pv_colormap, pv_rgb2class

import DataStructures
import ImageCore
import Colors: RGB, Gray, N0f8
import FLoops: @floop
import Downloads


include("./main.jl")
include("./pv_download.jl")


end
