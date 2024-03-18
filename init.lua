
-- 载入基本配置
require("config.options")
require("config.keymap")
require("config.autocmd")

-- lazy.nvim插件管理器
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = require("config.plugins")
require("lazy").setup(plugins, opts)

-- 载入所有插件的配置信息
require("plugins.loader")
