local g = vim.g

-- vim.o.termguicolors = true

g.material_style = 'deep ocean'
g.material_italic_comments = true
g.material_italic_keywords = true
g.material_italic_functions = true
g.material_contrast = true
g.material_borders = true
g.material_italic_functions = true

-- make it extra dark
g.material_custom_colors = {bg = "#000000"}

-- Load the colorscheme
require('material').set()
