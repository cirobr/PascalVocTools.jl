module PascalVocTools


export voc_classnumber2classname, voc_classname2classnumber,
       voc_colormap2classnumber, voc_classnumber2colormap,
       voc_rgb2classes,
       voc_download

import Images: RGB, Gray, N0f8
import DataStructures
import Downloads


include("./main.jl")


end
