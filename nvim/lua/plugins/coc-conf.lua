vim.o.cmdheight = 2
vim.o.updatetime = 300
-- vim.cmd('set shortmess+=c')

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.wo.signcolumn = 'yes'

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
vim.api.nvim_set_keymap('i', '<TAB>', [[pumvisible() ? "<C-n>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()]], { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', [[pumvisible() ? "<C-p>" : "<C-h>"]], { noremap = true, silent = true, expr = true })

function _G.check_back_space()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match('%s')) and true
end

-- Use <c-space> to trigger completion.
vim.api.nvim_set_keymap('i', '<c-space>', [[coc#refresh()]], { noremap = true, silent = true, expr = true })

-- Make <CR> auto-select the first completion item and notify coc.nvim to
-- format on enter, <cr> could be remapped by other vim plugin
vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><C-r>=coc#on_enter()<CR>"]], { noremap = true, silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window.
vim.api.nvim_set_keymap('n', 'K', 'v:lua.show_documentation()', { silent = true })

function _G.show_documentation()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.cmd('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- Highlight the symbol and its references when holding the cursor.
vim.cmd([[autocmd CursorHold * silent call CocActionAsync('highlight')]])

-- Symbol renaming.
vim.api.nvim_set_keymap('n', '<Leader>rn', '<Plug>(coc-rename)', {})

-- Formatting selected code.
vim.api.nvim_set_keymap('x', '<Leader>f', '<Plug>(coc-format-selected)', {})
vim.api.nvim_set_keymap('n', '<Leader>f', '<Plug>(coc-format-selected)', {})

vim.cmd([[
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
]])

-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap('x', '<Leader>a', '<Plug>(coc-codeaction-selected)', {})
vim.api.nvim_set_keymap('n', '<Leader>a', '<Plug>(coc-codeaction-selected)', {})

-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('n', '<Leader>ac', '<Plug>(coc-codeaction)', {})
-- Apply AutoFix to problem on the current line.
vim.api.nvim_set_keymap('n', '<Leader>qf', '<Plug>(coc-fix-current)', {})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', {})
vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', {})
vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', {})
vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', {})
vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', {})
vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', {})
vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', {})
vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', {})

-- Remap <C-f> and <C-b> for scroll float windows/popups.
vim.api.nvim_set_keymap('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { noremap = true, silent= true, expr = true })
vim.api.nvim_set_keymap('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { noremap = true, silent= true, expr = true })
vim.api.nvim_set_keymap('i', '<C-f>', 'coc#float#has_scroll() ? "<C-r>=coc#float#scroll(1)<CR>" : "<Right>"', { noremap = true, silent= true, expr = true })
vim.api.nvim_set_keymap('i', '<C-b>', 'coc#float#has_scroll() ? "<C-r>=coc#float#scroll(0)<CR>" : "<Left>"', { noremap = true, silent= true, expr = true })
vim.api.nvim_set_keymap('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', { noremap = true, silent= true, expr = true })
vim.api.nvim_set_keymap('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', { noremap = true, silent= true, expr = true })

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- Add `:Format` command to format current buffer.
vim.cmd([[command! -nargs=0 Format :call CocAction('format')]])

-- Add `:Fold` command to fold current buffer.
vim.cmd([[command! -nargs=? Fold :call     CocAction('fold', <f-args>)]])

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd([[command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')]])

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.cmd([[set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}]])

-- Mappings for CoCList
-- Show all diagnostics.
vim.api.nvim_set_keymap('n', '<Leader>a', ':<C-u>CocList diagnostics<CR>', { noremap = true, silent = true })
-- Manage extensions.
vim.api.nvim_set_keymap('n', '<Leader>e', ':<C-u>CocList extensions<CR>', { noremap = true, silent = true })
-- Show commands.
vim.api.nvim_set_keymap('n', '<Leader>c', ':<C-u>CocList commands<CR>', { noremap = true, silent = true })
-- Find symbol of current document.
vim.api.nvim_set_keymap('n', '<Leader>o', ':<C-u>CocList outline<CR>', { noremap = true, silent = true })
-- Search workspace symbols.
vim.api.nvim_set_keymap('n', '<Leader>s', ':<C-u>CocList -I symbols<CR>', { noremap = true, silent = true })
-- Do default action for next item.
vim.api.nvim_set_keymap('n', '<Leader>j', ':<C-u>CocNext<CR>', { noremap = true, silent = true })
-- Do default action for previous item.
vim.api.nvim_set_keymap('n', '<Leader>k', ':<C-u>CocPrev<CR>', { noremap = true, silent = true })
-- Resume latest coc list.
vim.api.nvim_set_keymap('n', '<Leader>p', ':<C-u>CocListResume<CR>', { noremap = true, silent = true })

