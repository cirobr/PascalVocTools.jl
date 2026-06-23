class_numbers = vcat(0:20, 255)

class_names = [
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
    "void",             # 255
]

classnumbers = sort( Dict(zip(class_numbers, class_names)) )
function classnumber2classname(class::Int)
    return get(classnumbers, class, "void")
end

classnames = sort( Dict(zip(class_names, class_numbers)); byvalue=true )
function classname2classnumber(name::String)
    return get(classnames, name, 255)   # 255 is void class
end
