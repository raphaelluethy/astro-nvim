-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
      mousescroll = "ver:3,hor:0",
      mouse = "a",
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = true,
        list = true,
        tabstop = 4,
        shiftwidth = 4,
        textwidth = 80,
        linebreak = true,
        colorcolumn = "80",
        breakindent = true,
        undofile = true,
        ignorecase = true,
        smartcase = true,
        updatetime = 250,
        timeoutlen = 300,
        splitright = true,
        splitbelow = true,
        cursorline = true,
        scrolloff = 10,
        inccommand = "split",
        listchars = {
          tab = "▸ ",
          trail = "•",
          space = "·",
          extends = ">",
          precedes = "<",
        },
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        have_nerd_font = true,
      },
      -- Schedule clipboard setting to avoid startup issues
      vim.schedule(function() vim.opt.clipboard = "unnamedplus" end),
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        ["<Esc>"] = { ":nohlsearch<CR>", desc = "Clear search" },
        ["gh"] = { vim.diagnostic.open_float, desc = "Show diagnostics" },
        -- ["<C-h>"] = { "<C-w><C-h>", desc = "Move focus to the left window" },
        -- ["<C-l>"] = { "<C-w><C-l>", desc = "Move focus to the right window" },
        -- ["<C-j>"] = { "<C-w><C-j>", desc = "Move focus to the lower window" },
        -- ["<C-k>"] = { "<C-w><C-k>", desc = "Move focus to the upper window" },
        -- ["<Leader>sv"] = { "<CMD>vsplit<CR>", desc = "[S]plit [V]ertically" },

        ["c"] = { '"_c', desc = "Change to blackhole register" },
        ["C"] = { '"_C', desc = "Change to blackhole register" },

        ["<C-d>"] = { "<C-d>zz", desc = "Scroll down" },
        ["<C-u>"] = { "<C-u>zz", desc = "Scroll up" },
        ["<Leader>fg"] = { require("telescope.builtin").live_grep, desc = "Live grep" },
        ["<Leader>sf"] = { require("telescope.builtin").find_files, desc = "[S]earch [F]iles" },
        ["<Leader>sp"] = { require("telescope.builtin").git_files, desc = "[S]earch [P]roject" },
        ["<Leader>sa"] = {
          function()
            require("telescope.builtin").find_files { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } }
          end,
          desc = "[S]earch [A]ll Files",
        },
      },
      v = {
        ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move line down" },
        ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move line up" },
        ["<"] = { "<gv", desc = "Reselect after indent" },
        [">"] = { ">gv", desc = "Reselect after indent" },
        ["c"] = { '"_c', desc = "Change to blackhole register" },
        ["C"] = { '"_C', desc = "Change to blackhole register" },
      },
    },
  },
}
