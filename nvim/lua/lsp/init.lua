-- https://github.com/neovim/nvim-lspconfig
local on_attach = function(client, bufnr)
    local rm = vim.api.nvim_buf_set_keymap

    local signature = require('lsp_signature')

    signature.on_attach({
        bind = true,
        hint_enable = true,
        floating_window = true,
        hint_prefix = " ",
        hint_scheme = "String",
        handler_opts = {border = "single"}
    })

    local opts = {noremap = true, silent = true}
    rm(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    rm(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    rm(bufnr, 'n', "<localleader>ff", "<cmd>lua vim.lsp.buf.formatting()<CR>",
       opts)

    -- vim already has builtin docs
    if vim.bo.ft ~= "vim" then
        rm(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    end

    rm(bufnr, 'n', '<localleader>wa',
       '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    rm(bufnr, 'n', '<localleader>wr',
       '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    rm(bufnr, 'n', '<localleader>wl',
       '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
       opts)

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
    augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
    ]], false)
    end

end

-- Configure lua language server for neovim development
local lua_conf = {
    Lua = {
        runtime = {
            -- LuaJIT in the case of Neovim
            version = 'LuaJIT',
            path = vim.split(package.path, ';')
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'}
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
            }
        }
    }
}

local py_conf = {
    python = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
        },
        venvPath = os.getenv('MAMBA_VENV_PATH')
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- send actions with hover request
capabilities.experimental = {hoverActions = true}

-- enable snippet support
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- enable auto import
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}

-- config that activates keymaps and enables snippet support
local config = {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach
}

-- get all installed servers
require"lspinstall".setup()
local servers = require"lspinstall".installed_servers()

-- ... and add manually installed servers
servers[#servers + 1] = 'clangd'
servers[#servers + 1] = 'pyright'
servers[#servers + 1] = 'denols'

for k = 1, #servers do
    -- lua is the only lsp which is installed by lspinstall
    -- and is configured by ourselves
    if servers[k] == 'lua' then
        config.settings = lua_conf
        require"lspconfig"['lua'].setup(config)
    elseif servers[k] == 'pyright' then
        config.settings = py_conf
        require"lspconfig"[servers[k]].setup(config)
    else
        config.settings = {}
        require"lspconfig"[servers[k]].setup(config)

    end
end

require('lsp.saga')
require('lsp.handlers')
require('lsp.symbols')
