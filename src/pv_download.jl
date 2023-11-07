function voc_download(folder::String)
    pv_data_folder = folder
    if pv_data_folder[end] == "/"   pv_data_folder = pv_data_folder[1:end-1]   end
    mkpath(pv_data_folder)
    
    # download coco data
    if !isfile(pv_data_folder * "/VOCtrainval_11-May-2012.tar")
        @info "Downloading PascalVOC-2012 data..."
        Downloads.download("http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar",
                            pv_data_folder * "/VOCtrainval_11-May-2012.tar")
    end

    
    # unzip coco data
    # run(`unzip $(coco_data_folder)/train2017.zip -d $(coco_data_folder)`)
    run(`tar -xvf $(pv_data_folder)/VOCtrainval_11-May-2012.tar -C $(pv_data_folder)`)
end