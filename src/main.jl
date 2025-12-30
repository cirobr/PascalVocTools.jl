const vec_classes = vcat(0:20)


const vec_classnames = [
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

const vec_colormap = [
    [0, 0, 0],          # 0
    [128, 0, 0],        # 1
    [0, 128, 0],        # 2
    [128, 128, 0],      # 3
    [0, 0, 128],        # 4
    [128, 0, 128],      # 5
    [0, 128, 128],      # 6
    [128, 128, 128],    # 7
    [64, 0, 0],         # 8
    [192, 0, 0],        # 9
    [64, 128, 0],       # 10
    [192, 128, 0],      # 11
    [64, 0, 128],       # 12
    [192, 0, 128],      # 13
    [64, 128, 128],     # 14
    [192, 128, 128],    # 15
    [0, 64, 0],         # 16
    [128, 64, 0],       # 17
    [0, 192, 0],        # 18
    [128, 192, 0],      # 19
    [0, 64, 128]        # 20
]

# [224, 224, 192]   # border
# [138, 138, 119]


const classnumbers = sort( Dict(zip(vec_classes, vec_classnames)) )
function voc_classnumbers(class::Int)
    return get(classnumbers, class, "ignore")
end
const voc_classnumber2classname = voc_classnumbers


const classnames = sort( Dict(zip(vec_classnames, vec_classes)); byvalue=true )
function voc_classnames(name::String)
    return get(classnames, name, 255)   # 255 is ignore class
end
const voc_classname2classnumber = voc_classnames


const colormaps = sort( Dict(zip(vec_colormap, vec_classes)); byvalue=true )
function voc_colormaps(colormap::AbstractVector{<:Integer})
    return get(colormaps, colormap, 255)   # 255 is ignore class
end
const voc_colormaps2classnumbers = voc_colormaps
const voc_colormap2classnumber   = voc_colormaps


const classnumbers2colormaps = sort( Dict(zip(vec_classes, vec_colormap)) )
function voc_classnumbers2colormaps(class::Int)
    return get(classnumbers2colormaps, class, [255, 255, 255])   # 255 is ignore class
end
const voc_classnumber2colormap = voc_classnumbers2colormaps


function voc_rgb2classes(mask::AbstractArray{RGB{N0f8}, 2})
    h, w = size(mask)
    X = Matrix{Int}(undef, (h,w))
    m = channelview(mask) .* 255 .|> Int   # CHW

    for i in 1:h; for j in 1:w
        X[i,j] = voc_colormaps2classnumbers([m[1,i,j], m[2,i,j], m[3,i,j]])
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
