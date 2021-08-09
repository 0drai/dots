-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/d0pa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/d0pa/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/d0pa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/d0pa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/d0pa/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["commented.nvim"] = {
    config = { "\27LJ\2\nf\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16keybindings\1\0\0\1\0\3\6n\agc\anl\bgcc\6v\agc\nsetup\14commented\frequire\0" },
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/commented.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["feline.nvim"] = {
    config = { "require('plugins.feline')" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/feline.nvim",
    wants = { "gitsigns.nvim" }
  },
  ["format.nvim"] = {
    commands = { "Format", "FormatWrite" },
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.format\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/format.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('plugins.gitsigns')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17indent_bline\19plugins.others\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    wants = { "nvim-treesitter" }
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["material.nvim"] = {
    after = { "gitsigns.nvim", "indent-blankline.nvim", "feline.nvim" },
    loaded = true,
    only_config = true
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.nvim-autopairs\frequire\0" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    wants = { "nvim-treesitter" }
  },
  ["nvim-compe"] = {
    after = { "tabout.nvim", "nvim-autopairs", "orgmode.nvim" },
    after_files = { "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "require('plugins.compe')" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-compe",
    wants = { "LuaSnip" }
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.lint\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n#\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\blsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    wants = { "nvim-lspinstall" }
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim-tree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    wants = { "nvim-web-devicons" }
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-rainbow" },
    config = { "require('plugins.treesitter')" },
    loaded = false,
    needs_bufread = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.orgmode\frequire\0" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["registers.nvim"] = {
    keys = { { "", "<c-r>" }, { "", '"' } },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/registers.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim"
  },
  ["suda.vim"] = {
    commands = { "SudaWrite" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tabout\frequire\0" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  tabular = {
    after_files = { "/home/d0pa/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    commands = { "Tabularize" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["telescope-bibtex.nvim"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/telescope-bibtex.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gwrite", "Gedit", "Gvdiffsplit" },
    loaded = false,
    needs_bufread = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\fmatchup\19plugins.others\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-matchup",
    wants = { "nvim-treesitter" }
  },
  ["vim-repeat"] = {
    keys = { { "", "." } },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vrooter\19plugins.others\frequire\0" },
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\rnvim_lsp\28vista_default_executive\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/vista.vim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\bzen\19plugins.others\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/d0pa/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vrooter\19plugins.others\frequire\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: commented.nvim
time([[Config for commented.nvim]], true)
try_loadstring("\27LJ\2\nf\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\16keybindings\1\0\0\1\0\3\6n\agc\anl\bgcc\6v\agc\nsetup\14commented\frequire\0", "config", "commented.nvim")
time([[Config for commented.nvim]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.material\frequire\0", "config", "material.nvim")
time([[Config for material.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd gitsigns.nvim ]]

-- Config for: gitsigns.nvim
require('plugins.gitsigns')

vim.cmd [[ packadd indent-blankline.nvim ]]

-- Config for: indent-blankline.nvim
try_loadstring("\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\17indent_bline\19plugins.others\frequire\0", "config", "indent-blankline.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gedit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gedit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gvdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gvdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tabularize lua require("packer.load")({'tabular'}, { cmd = "Tabularize", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SudaWrite lua require("packer.load")({'suda.vim'}, { cmd = "SudaWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'format.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'format.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> " <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "\"", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <c-r> <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "<lt>c-r>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown'}, { ft = "md" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'tabout.nvim', 'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'dashboard-nvim', 'feline.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-lspconfig'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'nvim-ts-rainbow', 'vim-matchup'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'LuaSnip', 'friendly-snippets'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'nvim-treesitter'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-lint'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/d0pa/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
