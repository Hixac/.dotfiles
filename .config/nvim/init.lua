local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- NEED TO DOWNLOAD LUAROCKS
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors=true
vim.opt.signcolumn="yes"
vim.opt.colorcolumn="100"
vim.opt.showmatch=true
vim.opt.matchtime=2
vim.opt.cmdheight=1
vim.opt.completeopt="menuone,noinsert,noselect"
vim.opt.showmode=false
vim.opt.pumheight=10
vim.opt.pumblend=10
vim.opt.winblend=0
vim.opt.conceallevel=0
vim.opt.concealcursor=""
vim.opt.lazyredraw=true
vim.opt.synmaxcol=300

vim.opt.backup = false                             -- Don't create backup files
vim.opt.writebackup = false                        -- Don't create backup before writing
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.undofile = true                            -- Persistent undo
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")  -- Undo directory
vim.opt.updatetime = 300                           -- Faster completion
vim.opt.timeoutlen = 500                           -- Key timeout duration
vim.opt.ttimeoutlen = 0                            -- Key code timeout
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false                          -- Don't auto save

vim.opt.hidden = true                              -- Allow hidden buffers
vim.opt.errorbells = false                         -- No error bells
vim.opt.backspace = "indent,eol,start"             -- Better backspace behavior
vim.opt.autochdir = false                          -- Don't auto change directory
vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.path:append("**")                          -- include subdirectories in search
vim.opt.selection = "exclusive"                    -- Selection behavior
vim.opt.mouse = "a"                                -- Enable mouse support
vim.opt.clipboard:append("unnamedplus")            -- Use system clipboard
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.encoding = "UTF-8"                         -- Set encoding

vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.opt.foldmethod = "expr"                             -- Use expression for folding
-- vim.wo.vim.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- Use treesitter for folding
vim.opt.foldlevel = 99                                  -- Start with all folds open

vim.opt.splitbelow = true                          -- Horizontal splits go below
vim.opt.splitright = true                          -- Vertical splits go right

vim.g.mapleader = " "                              -- Set leader key to space
vim.g.maplocalleader = " "                         -- Set local leader key (NEW)

vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" }) -- change later
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
vim.opt.diffopt:append("linematch:60")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.list = true
vim.opt.listchars = { tab = "»-", trail = "·", nbsp = "␣" }

-- ============================================
-- USEFUL FUNCTIONS
-- ============================================

-- Copy full file-path
vim.keymap.set("n", "<leader>pa", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end)

-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})


-- ============================================================================
-- STATUSLINE
-- ============================================================================

vim.opt.laststatus = 0 -- :)

-- ============================================================================
-- TABS
-- ============================================================================

-- Tab display settings
vim.opt.showtabline = 1  -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
vim.opt.tabline = ''     -- Use default tabline (empty string uses built-in)

-- Transparent tabline appearance
vim.cmd([[
  hi TabLineFill guibg=NONE ctermfg=242 ctermbg=NONE
]])

-- Alternative navigation (more intuitive)
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })

-- Tab moving
vim.keymap.set('n', '<leader>tm', ':tabmove<CR>', { desc = 'Move tab' })
vim.keymap.set('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Move tab right' })
vim.keymap.set('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Move tab left' })

-- Function to open file in new tab
local function open_file_in_tab()
  vim.ui.input({ prompt = 'File to open in new tab: ', completion = 'file' }, function(input)
    if input and input ~= '' then
      vim.cmd('tabnew ' .. input)
    end
  end)
end

-- Function to duplicate current tab
local function duplicate_tab()
  local current_file = vim.fn.expand('%:p')
  if current_file ~= '' then
    vim.cmd('tabnew ' .. current_file)
  else
    vim.cmd('tabnew')
  end
end

-- Function to close tabs to the right
local function close_tabs_right()
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr('$')

  for i = last_tab, current_tab + 1, -1 do
    vim.cmd(i .. 'tabclose')
  end
end

-- Function to close tabs to the left
local function close_tabs_left()
  local current_tab = vim.fn.tabpagenr()

  for i = current_tab - 1, 1, -1 do
    vim.cmd('1tabclose')
  end
end

-- Enhanced keybindings
vim.keymap.set('n', '<leader>tO', open_file_in_tab, { desc = 'Open file in new tab' })
vim.keymap.set('n', '<leader>td', duplicate_tab, { desc = 'Duplicate current tab' })
vim.keymap.set('n', '<leader>tr', close_tabs_right, { desc = 'Close tabs to the right' })
vim.keymap.set('n', '<leader>tL', close_tabs_left, { desc = 'Close tabs to the left' })

-- Function to close buffer but keep tab if it's the only buffer in tab
local function smart_close_buffer()
  local buffers_in_tab = #vim.fn.tabpagebuflist()
  if buffers_in_tab > 1 then
    vim.cmd('bdelete')
  else
    -- If it's the only buffer in tab, close the tab
    vim.cmd('tabclose')
  end
end
vim.keymap.set('n', '<leader>bd', smart_close_buffer, { desc = 'Smart close buffer/tab' })

-- ============================================================================
-- LSP 
-- ============================================================================

-- Function to find project root
local function find_root(patterns)
  local path = vim.fn.expand('%:p:h')
  local root = vim.fs.find(patterns, { path = path, upward = true })[1]
  return root and vim.fn.fnamemodify(root, ':h') or path
end

vim.lsp.config["bashls"] = {
  cmd = {'bash-language-server', 'start'},
  filetypes = {'sh', 'bash', 'zsh'},
  root_dir = find_root({'.git', 'Makefile'}),
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command)"
    }
  }
}

vim.lsp.config["clangd"] = {
  cmd = {'clangd', "-j=4", "--log=error", "--malloc-trim", "--clang-tidy",
                  "--completion-style=detailed", "--background-index",
                  "--pch-storage=memory", "--header-insertion=never",
                  "--header-insertion-decorators=0" }, 
  filetypes = {'cpp', 'hpp', 'c', 'h'},
  root_dir = find_root({'.git', 'Makefile', '.tup'}),
  settings = {}
}

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importEnforceGranularity = true,
                importPrefix = 'crate',
            },
            cargo = {
                allFeatures = true,
            },
            inlayHints = { locationLinks = false },
            diagnostics = {
                enable = true,
                experimental = {
                    enable = true,
                },
            },
        }
    }
})

vim.lsp.enable("clangd")
vim.lsp.enable("bashls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("hls")
vim.lsp.enable("basedpyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("neocmake")


-- formatting
local function format_code()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  local filetype = vim.bo[bufnr].filetype

  -- Save cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  if filetype == 'python' or filename:match('%.py$') then
    if filename == '' then
      print("Save the file first before formatting Python")
      return
    end

    local black_cmd = "black --quiet " .. vim.fn.shellescape(filename)
    local black_result = vim.fn.system(black_cmd)

    if vim.v.shell_error == 0 then
      vim.cmd('checktime')
      vim.api.nvim_win_set_cursor(0, cursor_pos)
      print("Formatted with black")
      return
    else
      print("No Python formatter available (install black)")
      return
    end
  end

  if filetype == 'sh' or filetype == 'bash' or filename:match('%.sh$') then
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local content = table.concat(lines, '\n')

    local cmd = {'shfmt', '-i', '2', '-ci', '-sr'}  -- 2 spaces, case indent, space redirects
    local result = vim.fn.system(cmd, content)

    if vim.v.shell_error == 0 then
      local formatted_lines = vim.split(result, '\n')
      if formatted_lines[#formatted_lines] == '' then
        table.remove(formatted_lines)
      end
      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, formatted_lines)
      vim.api.nvim_win_set_cursor(0, cursor_pos)
      print("Shell script formatted with shfmt")
      return
    else
      print("shfmt error: " .. result)
      return
    end
  end

  print("No formatter available for " .. filetype)
end

vim.api.nvim_create_user_command("FormatCode", format_code, {
  desc = "Format current file"
})

vim.keymap.set('n', '<leader>fm', format_code, { desc = 'Format file' })

-- LSP keymaps 
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf }) -- Enable for the specific buffer
        end

        local opts = {buffer = event.buf}

        -- Navigation
        vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

        -- Information
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

        -- Code actions
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        -- Diagnostics
        vim.keymap.set('n', '<leader>nd', function() 
            vim.diagnostic.jump({count = 1, float = true}) 
        end, opts)
        vim.keymap.set('n', '<leader>pd', function() 
            vim.diagnostic.jump({count = -1, float = true}) 
        end, opts)
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

        vim.keymap.set('n', '<leader>rr', ':lsp restart<CR>')
    end,
})

-- Better LSP UI
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "🗣️",
      [vim.diagnostic.severity.WARN] = "👀",
      [vim.diagnostic.severity.INFO] = "👉",
      [vim.diagnostic.severity.HINT] = "💡",
    }
  }
})

vim.api.nvim_create_user_command('LspInfo', function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    print("No LSP clients attached to current buffer")
  else
    for _, client in ipairs(clients) do
      print("LSP: " .. client.name .. " (ID: " .. client.id .. ")")
    end
  end
end, { desc = 'Show LSP client info' })

-- ============================================
-- PACKAGES 
-- ============================================

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    { "neovim/nvim-lspconfig" },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',

            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                  expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                  end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                  { name = 'nvim_lsp' },
                  { name = 'vsnip' },
                }, {
                  { name = 'buffer' },
                })
              })
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            -- required 
            "nvim-lua/plenary.nvim",
             -- optional - Diff integration
            "sindrets/diffview.nvim",
        },
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = { },
        config = function()
            vim.keymap.set("n", "<leader>ff", ":FzfLua files<CR>")
            vim.keymap.set("n", "<leader>ls", ":FzfLua live_grep<CR>")
--            require('fzf-lua').setup({
--                keymap = {
--                    builtin = {
--                        ["<C-d>"] = "preview-half-page-down",
--                        ["<C-u>"] = "preview-half-page-up",
--                    },
--                },
--            })
        end
    },
--     {
--        "Shatur/neovim-ayu",
--        config = function()
--           local colors = require('ayu.colors')
--           colors.generate() -- Pass `true` to enable mirage
-- 
--           require("ayu").setup({
--                 mirage = false,
--                 terminal = false,
--                 overrides = {
--                     LineNrAbove = { fg = "#50406D" },
--                     LineNr = { fg = "#100000" },
--                     LineNrBelow = { fg = "#6D4050" },
--                 }
--           })
-- 
--           vim.cmd.colorscheme("ayu")
--           vim.cmd([[
--               highlight Cursor guifg=#ffffff guibg=#ff0000
--               highlight lCursor guifg=#ffffff guibg=#ff0000
--             ]])
--        end,
--     },
    {
       'nvim-treesitter/nvim-treesitter',
       lazy = false,
       build = ':TSUpdate',
       config = function()
          require("nvim-treesitter").setup({
                install_dir = vim.fn.stdpath('data') .. '/site',
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query" }, -- Install parsers for these languages
                highlight = {
                   enable = true, -- Enable Treesitter highlighting
                },
                indent = {
                   enable = true, -- Enable Treesitter-based indentation
                },
          })
          vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'c', 'rs', 'cpp', 'h', 'hpp' },
                callback = function() vim.treesitter.start() end,
          })
       end
    },
    {
        'Vimjas/vim-python-pep8-indent'
    },
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
        end
    },
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
        config = function()
            vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
            require("oil").setup({
                default_file_explorer = true,
                skip_confirm_for_simple_edits = true,
                columns = {
                    "icon",
                    "size",
                    "mtime"
                },
                view_options = {
                    show_hidden = true,
                    natural_order = "fast",
                    case_insensitive = false,
                },
                win_options = {
                    wrap = true
                },
            })
        end
    },
    {
        'mrcjkb/rustaceanvim',
        -- To avoid being surprised by breaking changes,
        -- I recommend you set a version range
        version = '^9',
        -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
        -- No need for lazy.nvim to lazy-load it.
        lazy = false,
        config = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        -- rust-analyzer language server configuration
                        ['rust-analyzer'] = {
                            check = {
                                command = "check",
                            },
                            checkOnSave = true,
                        },
                    },
                }
            }
        end
    },
    {
        "karb94/neoscroll.nvim",
        opts = {
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            duration_multiplier = 0.4,   -- Global duration multiplier
            easing = 'sine',           -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
            ignored_events = {           -- Events ignored while scrolling
                'WinScrolled', 'CursorMoved'
            },
        },
    },
  }, -- specs
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = {  },
  -- automatically check for plugin updates
  checker = { enabled = false, notify = false },
})


-- ============================================
-- FILETYPES
-- ============================================


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function()
    vim.bo.cindent = true
    vim.opt_local.cinoptions:append("l1,0,g0,(0,Ws")
  end,
})


vim.cmd.colorscheme("ample")
