classes = vcat(0:20)

classnames = [
    "background",       # 0
    "aeroplane",        # 1
    "bicycle",          # 2
    "bird",             # 3
    "boat",             # 4
    "bottle",           # 5
    "bus",              # 6
    "car",              # 7
    "cat",              # 8
    "chair",            # 9
    "cow",              # 10
    "diningtable",      # 11
    "dog",              # 12
    "horse",            # 13
    "motorbike",        # 14
    "person",           # 15
    "pottedplant",      # 16
    "sheep",            # 17
    "sofa",             # 18
    "train",            # 19
    "tvmonitor",        # 20
]

v1 = [
    (0, 0, 0),          # 0
    (128, 0, 0),        # 1
    (0, 128, 0),        # 2
    (128, 128, 0),      # 3
    (0, 0, 128),        # 4
    (128, 0, 128),      # 5
    (0, 128, 128),      # 6
    (128, 128, 128),    # 7
    (64, 0, 0),         # 8
    (192, 0, 0),        # 9
    (64, 128, 0),       # 10
    (192, 128, 0),      # 11
    (64, 0, 128),       # 12
    (192, 0, 128),      # 13
    (64, 128, 128),     # 14
    (192, 128, 128),    # 15
    (0, 64, 0),         # 16
    (128, 64, 0),       # 17
    (0, 192, 0),        # 18
    (128, 192, 0),      # 19
    (0, 64, 128),       # 20
]
void_color = (224, 224, 192)
v2 = [void_color for i in 21:255]
colormap = vcat(v1, v2)
colors = [RGB{N0f8}(r/255, g/255, b/255) for (r,g,b) in colormap]


function voc_colors(class::Int)
    @assert class ∈ 0:255 || error("Class not in 0:255 range")
    c = class + 1
    return colors[c]
end


classnumbers = sort( Dict(zip(classes, classnames)) )
function voc_classnumber2classname(class::Int)
    return get(classnumbers, class, "void")
end


classnames = sort( Dict(zip(classnames, classes)); byvalue=true )
function voc_classname2classnumber(name::String)
    return get(classnames, name, 255)   # 255 is void class
end


colormaps = sort( Dict(zip(colormap, classes)); byvalue=true )
function voc_colormap2classnumber(colormap::Tuple{Int,Int,Int})
    return get(colormaps, colormap, 255)   # 255 is void class
end


classnumbers2colormaps = sort( Dict(zip(classes, colormap)) )
function voc_classnumber2colormap(class::Int)
    return get(classnumbers2colormaps, class, void_color)
end


function voc_rgb2classes(mask::AbstractArray{RGB{N0f8}, 2})
    h, w = size(mask)
    X = Matrix{Int}(undef, (h,w))
    m = channelview(mask) .* 255 .|> Int   # CHW

    for i in 1:h; for j in 1:w
        X[i,j] = voc_colormap2classnumber((m[1,i,j], m[2,i,j], m[3,i,j]))
    end; end

    return X
end


function voc_download(folder::String)
    # create folder
    voc_data_folder = folder
    if voc_data_folder[end] == "/"   voc_data_folder = voc_data_folder[1:end-1]   end
    mkpath(voc_data_folder)
    
    # download data
    if !isfile(voc_data_folder * "/VOCtrainval_11-May-2012.tar")
        @info "Downloading PascalVOC-2012 data..."
        Downloads.download("http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar",
                            voc_data_folder * "/VOCtrainval_11-May-2012.tar")
    end
    
    # unzip data
    run(`tar -xvf $(voc_data_folder)/VOCtrainval_11-May-2012.tar -C $(voc_data_folder)`)
end
