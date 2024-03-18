require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "cmake",
    "autotools_ls",
    --"jsonls" -- should install npm first
  }
})
require('lspconfig').cmake.setup {}
--require('lspconfig').autotools_ls.setup {}
require('lspconfig').autotools_ls.setup {}
require('lspconfig').clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp" },
  cmd = {
    "clangd",
    "--header-insertion=never",    -- 禁止在编辑时自动插入头文件
    "--pch-storage=memory",        -- 在内存中存储预编译头信息
    "--background-index",          -- 启用后台索引
    "--clang-tidy",                -- 如果安装了clang-tidy，则启用代码风格检查和修复建议
    "--completion-style=detailed", -- 使用详细的补全提示
    --"--query-driver=/usr/bin/clang",
  },
  root_markers = {},
  --root_markers = { ".git/", "compile_commands.json",".clangd" },

  settings = {
    clangd = {
      --compileCommands = "${workspaceFolder}/build/compile_commands.json",   -- 默认的索引路径
      index = {
        threads = 0,                      -- 使用所有可用的硬件线程
        background = true,                -- 在后台进行索引
        c = true,
        cxx = true,                       -- 索引C++代码
        paths = { "${workspaceFolder}" }, -- 要索引的路径
      },
      -- 代码完成
      completion = {
        detailed = true,    -- 显示详细的完成信息
        placeholder = true, -- 显示占位符
        signatures = true,  -- 显示函数签名的补全
      },
      signatures = {
        enabled = true,                  -- 启用自动签名补全
        insertfullSignature = true,      -- 插入完整的签名
        inserttrailingWhitespace = true, -- 在签名后插入空格
      },
      -- 诊断
      diagnostics = {
        enable = true,                  -- 启用诊断
        warningsAsErrors = "None",      -- 将警告视为错误
        SuppressSystemWarnings = false, -- 抑制系统头文件中的警告
      },
      -- 格式化
      format = {
        style = "file", -- 让 clangd 自动查找项目目录下的 .clang-format 文件
      },
    },
  },
}


require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      hint = { enable = true },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
