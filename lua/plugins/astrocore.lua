-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

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
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        -- H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- Imported from VSCode configuration by ChatGPT
        -- ["j"] = { "gj", desc = "Move down visually" },
        -- ["k"] = { "gk", desc = "Move up visually" },
        ["J"] = { "5j", desc = "Move down 5 lines visually" },
        ["K"] = { "5k", desc = "Move up 5 lines visually" },
        ["H"] = { "^", desc = "Move to the start of the line" },
        ["L"] = { "$", desc = "Move to the end of the line" },
        ["U"] = { "<C-r>", desc = "Redo" },
        -- [";"] = { "<leader><leader>/", desc = "Leader Leader Search" },
        ["n"] = { "nzz", desc = "Find next with recenter" },
        ["N"] = { "Nzz", desc = "Find previous with recenter" },
        -- ["<Leader>q"] = { ":q<cr>", desc = "Quit" },
        -- ["<Leader>w"] = { ":w<cr>", desc = "Save file" },
        -- ["<Leader>s"] = { ":w<cr>", desc = "Save file" },
        -- ["<Leader>S"] = { ":noautocmd w<cr>", desc = "Save file without formatting" },
        -- ["<Leader>z"] = { ":TZAtarctica<cr>", desc = "Toggle Zen Mode" },
        -- ["<Leader>/"] = { ":noh<cr>", desc = "Clear search highlights" },
        ["<Leader>j"] = { "J", desc = "Join lines" },
        -- ["<Leader>l"] = { "<C-w><C-w>", desc = "Switch windows" },
        ["<Leader>v"] = { "<cmd>vsp<cr>", desc = "Split window vertically" },
        ["<Leader>h"] = { "<cmd>sp<cr>", desc = "Split window horizontally" },
        -- ["<Leader>k"] = { "<cmd>lua require('hover').hover()<cr>", desc = "Show hover" },
        -- ["<Leader>f"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Quick fix" },
        -- ["<Leader>c"] = { "<cmd>ToggleChat<cr>", desc = "Toggle chat sidebar" },
        -- ["<Leader>x"] = { "<cmd>StartInlineChat<cr>", desc = "Start inline chat" },

        -- Manually defined mapping
        ["<Leader>tt"] = { [[<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>]], desc = "ToggleTerm Open multiple horizontal terminals side-by-side" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        ["<esc>"] = { [[<C-\><C-N>]], desc = "ToggleTerm Leave TERMINAL mode" },
      },
      v = {
        -- Imported from VSCode configuration by ChatGPT
        ["J"] = { "5j", desc = "Move down 5 lines" },
        ["K"] = { "5k", desc = "Move up 5 lines" },
        ["H"] = { "^", desc = "Move to start of line" },
        ["L"] = { "$", desc = "Move to end of line" },
        -- [";"] = { "<leader><leader>/", desc = "Leader Leader Search" },
        -- ["<Leader>s"] = { ":w<cr>", desc = "Save file" },
        -- ["<Leader>S"] = { ":noautocmd w<cr>", desc = "Save file without formatting" },
      },
    },
  },
}
