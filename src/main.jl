const vec_classes = 0:20


const vec_classnames = ["background",     # 0
                        "aeroplane",      # 1
                        "bicycle",        # 2
                        "bird",           # 3
                        "boat",           # 4
                        "bottle",         # 5
                        "bus",            # 6
                        "car",            # 7
                        "cat",            # 8
                        "chair",          # 9
                        "cow",            # 10
                        "diningtable",    # 11
                        "dog",            # 12
                        "horse",          # 13
                        "motorbike",      # 14
                        "person",         # 15
                        "potted plant",   # 16
                        "sheep",          # 17
                        "sofa",           # 18
                        "train",          # 19
                        "tv/monitor"]     # 20


const vec_colormap = [[0, 0, 0],          # 0
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
                      [0, 64, 128]]       # 20

# [224, 224, 192]   # border
# [138, 138, 119]


const voc_classnumbers = sort( Dict(zip(vec_classes, vec_classnames)) )

const voc_classnames   = sort( Dict(zip(vec_classnames, vec_classes)); byvalue=true )

const voc_colormap2classnumbers = sort( Dict(zip(vec_colormap, vec_classes)); byvalue=true )

const voc_classnumbers2colormap = sort( Dict(zip(vec_classes, vec_colormap)) )


function voc_rgb2class(mask::AbstractArray{RGB{N0f8}, 2})
    h, w = size(mask)
    # X    = zeros(Int, (h,w))
    X    = Matrix{Int}(undef, (h,w))
    m    = ImageCore.channelview(mask) .* 255 .|> Int   # CHW

    @floop begin
        for i in 1:h; for j in 1:w
            # X[i,j] = pv_colormap[ [m[1, i, j], m[2, i, j], m[3, i, j]] ]
            X[i,j] = get(voc_colormap2classnumbers, ([m[1, i, j], m[2, i, j], m[3, i, j]]), 0)
        end; end
    end

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
