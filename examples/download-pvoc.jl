using Pkg
envpath = expanduser("../")
Pkg.activate(envpath)
using PascalVocTools; pv=PascalVocTools

path = expanduser("~/datasets/pascalvoc/")
pv.voc_download(path)
