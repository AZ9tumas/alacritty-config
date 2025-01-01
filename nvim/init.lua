-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- theme selection
--vim.cmd("colorscheme onedark_dark")
-- vim.cmd("colorscheme tokyodark")
--vim.cmd("colorscheme onelight")
--vim.cmd("colorscheme onedark")

math.randomseed(os.time())
local themes_arr = { "onedark_dark", "tokyodark", "onedark" }
local random_n = math.random(1, #themes_arr) -- Select a random number based on the themes array length

-- Notify the selected theme
vim.notify(("Selected theme: [%d] %s"):format(random_n, themes_arr[random_n]), "info", { title = "Theme Selector" })

-- Set the colorscheme
vim.cmd("colorscheme " .. themes_arr[random_n])


-- TypeScript and JavaScript setup
local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    -- Disable formatting because we use other tools for that
  end,
  filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact" },
})

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    -- Disable formatting because we use other tools for that
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

vim.opt.relativenumber = false
vim.opt.number = true
vim.opt.tabstop = 4        -- Number of spaces a <Tab> counts for
vim.opt.shiftwidth = 4     -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true   -- Convert tabs to spaces
