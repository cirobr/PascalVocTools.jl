module PascalVocTools


export voc_classnumbers, voc_classnames,
       voc_colormaps2classnumbers, voc_classnumbers2colormaps,
       voc_rgb2classes,
       voc_download

import Images: RGB, Gray, N0f8, channelview
import DataStructures
import Downloads


include("./main.jl")


end
