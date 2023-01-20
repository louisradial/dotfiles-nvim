return {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufReadPost',
    opts = {
        char = '┊',
        show_trailing_blankline_indent = false,
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
        filetype_exclude = {
            'help',
            'alpha',
            'NvimTree',
        }
    }
}
