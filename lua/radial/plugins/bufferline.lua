return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "BufReadPost",
    opts = {
        options = {
            numbers = 'none',
            -- diagnostics = 'nvim_lsp',
            separator_style = "thin",
            always_show_bufferline = false,
            -- show_tab_indicators = true,
            -- indicator = { style = 'underline' },
            show_buffer_close_icons = false,
            show_close_icon = false,
            offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = 'center' } },
            enforce_regular_tabs = true,
            -- highlight = {
            --     indicator_selected = {
            --         fg = '#f7cab8',
            --         bg = '#1e2430',
            --         -- sp = '#ff80a0',
            --         bold = true,
            --         underline = true,
            --         -- underdouble = true,
            --     },
            -- },
        },
    },
}
