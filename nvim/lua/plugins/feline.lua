-- powerlinish, I guess
local colors = {
    bg = '#121212',
    fg = '#ffffff',
    yellow = '#ffaf00',
    cyan = '#56b6c2',
    darkblue = '#2aa198',
    green = '#afdf00',
    orange = '#ff8700',
    violet = '#875fdf',
    magenta = '#d33682',
    blue = '#268bd2',
    red = '#df0000'
}

local vi_mode_utils = require 'feline.providers.vi_mode'
local lsp = require 'feline.providers.lsp'

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.blue,
    REPLACE = colors.violet,
    VISUAL = colors.magenta,
    COMMAND = colors.violet,
    TERM = colors.darkblue,
    NONE = colors.yellow
}

local icons = {
    unix = ' ',
    errs = ' ',
    warns = ' ',
    infos = ' ',
    hints = ' ',
    git = '',
    right_sep = '',
    left_sep = ''
}

-- Funcs

local function file_osinfo()
    local os = vim.bo.fileformat:lower()
    return icons[os] .. os
end

local function diag_enable(f, s)
    return function()
        local diag = f()[s]
        return diag and diag ~= 0
    end
end

local function diag_of(f, s)
    local icon = icons[s]
    return function()
        local diag = f()[s]
        return icon .. diag
    end
end

local function vimode_hl()
    return {fg = colors.bg, bg = vi_mode_utils.get_mode_color()}
end

local function lsp_diagnostics_info()
    return {
        errs = lsp.get_diagnostics_count('Error'),
        warns = lsp.get_diagnostics_count('Warning'),
        infos = lsp.get_diagnostics_count('Information'),
        hints = lsp.get_diagnostics_count('Hint')
    }
end

-- LuaFormatter off

-- Layout

local comps = {
    vi_mode = {
        left = {
            provider = function()
                return " " .. vi_mode_utils.get_vim_mode() .. " "
            end,
            hl = vimode_hl,
            right_sep = icons.right_sep
        },
        right = {
            provider = function()
                return string.format(' %d:%-d ', vim.fn.line('.'), vim.fn.col('.'))
            end,
            hl = vimode_hl,
            left_sep = icons.left_sep
        }
    },
    function_info = {
      provider = function()

        if not packer_plugins["nvim-treesitter"].loaded then return " " end
        local l = vim.fn['nvim_treesitter#statusline']({90})
        if l == nil or l == vim.NIL then
          return " "
        end
        return string.format(" %s ", l)
      end,
    },

    file = {
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        info = {
            provider = 'file_info',
            hl = {
                fg = colors.white,
                style = 'bold'
            }
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },

        readonly = {
          provider = function ()
          if vim.opt.readonly:get() then
              return '🔒'
          else
              return ''
          end
                end

        }
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = function()
            return {
                fg = vi_mode_utils.get_mode_color()
            }
        end
    },
    lsp = {
        name = {
            provider = 'lsp_client_names',
            left_sep = ' ',
            icon = icons.lsp,
            hl = {
                fg = colors.yellow
            }
        }
    },
    diagnos = {
        err = {
            provider = diag_of(lsp_diagnostics_info, 'errs'),
            left_sep = ' ',
            enabled = diag_enable(lsp_diagnostics_info, 'errs'),
            hl = {
                fg = colors.red
            }
        },
        hint = {
            provider = diag_of(lsp_diagnostics_info, 'hints'),
            left_sep = ' ',
            enabled = diag_enable(lsp_diagnostics_info, 'hints'),
            hl = {
                fg = colors.cyan
            }
        },
        info = {
            provider = diag_of(lsp_diagnostics_info, 'infos'),
            left_sep = ' ',
            enabled = diag_enable(lsp_diagnostics_info, 'infos'),
            hl = {
                fg = colors.blue
            }
        },
        warn = {
            provider = diag_of(lsp_diagnostics_info, 'warns'),
            left_sep = ' ',
            enabled = diag_enable(lsp_diagnostics_info, 'warns'),
            hl = {
                fg = colors.yellow
            }
        },
  },
    git = {
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = colors.green
            }
        },
        branch = {
            provider = 'git_branch',
            icon = icons.git,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            },
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = colors.red
            }
        }
    },
    space = {
        -- provider = ' '
        provider = '  '
    }
}

local properties = {
    force_inactive = {
        filetypes = {
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}

local components = {
    left = {
        active = {
            comps.vi_mode.left,
            comps.space,
            comps.file.readonly,
            comps.file.info,
            comps.lsp.name,
            comps.space,
            comps.diagnos.err,
            comps.diagnos.warn,
            comps.diagnos.hint,
            comps.diagnos.info,
        },
        inactive = {
            comps.vi_mode.left,
            comps.space,
            comps.file.info
        }
    },
    mid = {
        active = {},
        inactive = {}
    },
    right = {
        active = {
            comps.function_info,
            comps.space,
            comps.git.add,
            comps.git.change,
            comps.git.remove,
            comps.file.os,
            comps.git.branch,
            comps.space,
            comps.vi_mode.right,
        },
        inactive = {}
    }
}

-- LuaFormatter on

require'feline'.setup {
    default_bg = colors.bg,
    default_fg = colors.fg,
    components = components,
    properties = properties,
    vi_mode_colors = vi_mode_colors
}
