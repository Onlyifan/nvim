local opt = vim.opt


opt.updatetime = 1000 -- 自动检测文件是否被外部更改的时间间隔

-- 设置行号显示相关
--opt.guifont = "JetBrainsMono Nerd Font:h12"
opt.relativenumber = true -- 显示相对行号
opt.number = true         -- 显示绝对行号


-- 设置缩进相关
opt.tabstop = 4       -- 一个制表符代表的空格数
opt.shiftwidth = 4    -- 自动缩进和手动缩进时使用的空格数
opt.expandtab = true  -- 将制表符(Tab)转换为空格
opt.autoindent = true -- 根据上一行自动缩进当前行
opt.smartindent = true


-- 设置文本显示相关
opt.wrap = true -- 长行自动折行


-- 设置光标相关
opt.scrolloff = 4     -- 上下移动时光标周围保留4行
opt.sidescrolloff = 8 -- 左右移动时光标周围保留8个字符
opt.cursorline = true -- 高亮显示当前行
vim.cmd               -- 高亮显示复制的内容
[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=350 }
augroup END
]]


-- 设置鼠标相关
opt.mouse = "a" -- 启用鼠标的所有模式
-- 映射鼠标右键点击为粘贴操作
vim.keymap.set("n", "<RightMouse>", '"+p', { noremap = true })
vim.keymap.set("v", "<RightMouse>", '"+p', { noremap = true })
vim.keymap.set("i", "<RightMouse>", "<C-R>+", { noremap = true })


-- 设置剪贴板相关
opt.clipboard = "unnamedplus" -- 允许Vim使用系统剪贴板


-- 设置窗口分割相关
opt.splitright = true -- 新分割的窗口出现在当前窗口的右侧
opt.splitbelow = true -- 新分割的窗口出现在当前窗口的下方


-- 设置搜索相关
opt.ignorecase = true -- 搜索时忽略大小写
opt.smartcase = true  -- 如果搜索内容包含大写字母，则不忽略大小写
opt.incsearch = true  -- 实时搜索，一边输入一边显示匹配结果


-- 设置外观相关
opt.termguicolors = true -- 使用GUI颜色
opt.signcolumn = "auto"  -- 设置符号列的显示方式
opt.syntax = "yes"       -- 开启自带语法高亮
opt.conceallevel = 1     -- 开启文本替换功能，如将制表符显示为特殊字符
