vim.opt.number = true
vim.opt.relativenumber = true

-- set line num colors
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#89b4fa', bold=false })
        vim.api.nvim_set_hl(0, 'LineNr', { fg='#cba6f7', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#89b4fa', bold=false })
end

LineNumberColors()
