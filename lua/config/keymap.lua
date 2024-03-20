local setmap = vim.keymap.set
local opt = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- 在所有模式下生效的映射
setmap("i", 'jk', '<Esc>', { noremap = true }) -- 在插入模式下按下 jk 退出插入模式

-- 只在可视模式下生效的映射
setmap('v', '>', '>gv', { noremap = true }) -- 增强型右移操作：视觉选择后增加缩进并保持选择状态
setmap('v', '<', '<gv', { noremap = true }) -- 增强型左移操作：视觉选择后减少缩进并保持选择状态

-- 只在普通模式下生效的映射
setmap('n', '<Space>q', ':q<CR>', { noremap = true })

setmap('n', '<leader>t', ':NvimTreeToggle<CR>', opt) -- 打开文件树
setmap('n', '<leader>n', ':bn<CR>', opt)             -- 跳转到下一个窗口
setmap('n', '<leader>m', ':bp<CR>', opt)             -- 跳转到前一个窗口
setmap('n', '<leader>x', ':bd<CR>', opt)             -- 关闭当前窗口
setmap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opt)
setmap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opt)

-- 开关实时内联提示信息
local hint = vim.lsp.inlay_hint
if hint then
  setmap(
    "n",
    "<leader>h",
    function()
      if hint.is_enabled(0) then
        hint.enable(0, false)
      else
        hint.enable(0, true)
      end
    end,
    { desc = "Toggle Inlay Hints" }
  )
end


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
setmap('n', '<leader>d', vim.diagnostic.open_float)
setmap('n', '[d', vim.diagnostic.goto_prev)
setmap('n', ']d', vim.diagnostic.goto_next)
setmap('n', '<leader>D', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    setmap('n', 'gD', vim.lsp.buf.declaration, opts)
    setmap('n', 'gd', vim.lsp.buf.definition, opts)
    setmap('n', 'gd', vim.lsp.buf.type_definition, opts)
    setmap('n', 'gr', vim.lsp.buf.references, opts)
    setmap('n', 'K', vim.lsp.buf.hover, opts)
    setmap('n', 'gi', vim.lsp.buf.implementation, opts)
    setmap('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    setmap('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    setmap('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    setmap('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    setmap('n', '<leader>rn', vim.lsp.buf.rename, opts)
    setmap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    setmap('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
      vim.cmd("w")
    end, opts)
  end,
})
