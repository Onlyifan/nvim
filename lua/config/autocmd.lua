local autocmd = vim.api.nvim_create_autocmd

autocmd('BufNewFile', {
  --pattern = {'*.h', '*.hh', '*.hpp'},
  pattern = '*.{h,hh,hpp}',
  callback = function()
    local filename_base = vim.fn.expand("%:t:r")
    local uppercased_name = vim.fn.toupper(filename_base)
    local ext = vim.fn.expand('%:e'):gsub('[.]', ''):upper()

    local macro_suffix = '_' .. ext .. '_'

    local lines = {
      "#ifndef _" .. uppercased_name .. macro_suffix,
      "#define _" .. uppercased_name .. macro_suffix,
      "",
      "",
      "",
      "",
      "",
      "#endif // _" .. uppercased_name .. macro_suffix,
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
    vim.cmd('normal! 5G$')
  end
})


autocmd('BufNewFile', {
  pattern = '*.c',
  callback = function()
    local lines = {
      '#include <myselfc.h>',
      '',
      'int main(int argc, char *argv[]){',
      '    ',
      '    ',
      '    return 0;',
      '}',
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
    vim.cmd('normal! 4G$')
    -- 有BUG, 添加下行后打开新文件自动补全失效
    --vim.cmd('startinsert!')
  end
})


autocmd('BufNewFile', {
  --pattern = '*.{cc,cpp}',
  pattern = '*.cc',
  callback = function()
    local lines = {
      '#include <iostream>',
      '#include <string>',
      'using std::cout;',
      'using std::endl;',
      'using std::string;',
      '',
      'int main(void){',
      '    ',
      '    ',
      '    return 0;',
      '}',
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
    vim.cmd('normal! 8G$')
    -- 有BUG, 添加下行后打开新文件自动补全失效
    --vim.cmd('startinsert!')
  end
})


autocmd('BufNewFile', {
  pattern = '*.cpp',
  callback = function()
    local lines = {
      '#include <leetcode.h>',
      'using namespace std;',
      '',
      '',
      '',
    }
    vim.api.nvim_buf_set_lines(0, 0, -1, true, lines)
    vim.cmd('normal! G$')
    -- 有BUG, 添加下行后打开新文件自动补全失效
    --vim.cmd('startinsert!')
  end
})


--autocmd("FileType", {
--  pattern = { "c", "cpp" },
--  callback = function()
--    vim.opt_local.tabstop = 4
--    vim.opt_local.shiftwidth = 4
--  end
--})
--

autocmd("FileType", {
  pattern = { "lua" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})
