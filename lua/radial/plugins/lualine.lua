return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' },
    },
    event = "VeryLazy",
    opts = function()
        local colors = require("tokyonight.colors").setup()
        -- local theme = require("tokyonight.themes").setup({ transform = true })

        local theme = {
            normal = {
                a = { bg = colors.blue, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.blue },
                c = { bg = colors.bg, fg = colors.fg_sidebar },
            },
            insert = {
                a = { bg = colors.green, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.green },
            },
            command = {
                a = { bg = colors.yellow, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.yellow },
            },
            visual = {
                a = { bg = colors.magenta, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.magenta },
            },
            replace = {
                a = { bg = colors.red, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.red },
            },
            terminal = {
                a = { bg = colors.green1, fg = colors.black },
                b = { bg = colors.fg_gutter, fg = colors.green1 },
            },
            inactive = {
                a = { bg = colors.bg, fg = colors.blue },
                b = { bg = colors.bg, fg = colors.fg_gutter }, --, gui = "bold" },
                c = { bg = colors.bg, fg = colors.fg_gutter },
            },
        }

        local space = {
            function()
                return " "
            end,
            color = { bg = colors.bg, fg = colors.blue },
        }

        local filename = {
            'filename',
            color = { bg = colors.blue, fg = colors.bg_highlight },
            separator = { left = "", right = "" },
        }

        local filetype = {
            "filetype",
            icon_only = true,
            colored = true,
            color = { bg = colors.bg_highlight },
            separator = { left = "", right = "" },
        }

        -- local filetype_tab = {
        --     "filetype",
        --     icon_only = true,
        --     colored = true,
        --     color = { bg = colors.bg_highlight },
        -- }

        local buffers = {
            'buffers',
            buffers_color = {
                active = { bg = colors.blue, fg = colors.terminal_black },
                inactive = { bg = colors.terminal_black, fg = colors.blue },
            },
            -- color = { bg = colors.blue, fg = colors.bg },
            separator = { left = "", right = "" },
            on_click = nil,

            filetype_names = {
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                packer = 'Packer',
                fzf = 'FZF',
                alpha = 'Alpha',
                toggleterm = 'terminal',
                NvimTree = 'File Tree',
            }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

            symbols = {
                modified = ' ●', -- Text to show when the buffer is modified
                alternate_file = '', -- Text to show to identify the alternate file
                directory = '', -- Text to show when the buffer is a directory
            },

        }

        -- local tabs = {
        --     'tabs',
        --     -- require 'tabline'.tabline_tabs,
        --     separator = { left = "", right = "" },
        -- }

        local fileformat = {
            'fileformat',
            color = { bg = colors.purple, fg = colors.bg_highlight },
            separator = { left = "", right = "" },
        }

        local encoding = {
            'encoding',
            color = { bg = colors.bg_highlight, fg = colors.purple },
            separator = { left = "", right = "" },
        }

        local branch = {
            'branch',
            color = { bg = colors.teal, fg = colors.bg_highlight },
            separator = { left = "", right = "" },
        }

        local diff = {
            "diff",
            colored = true, -- Displays a colored diff status if set to true
            -- diff_color = {
            --     -- Same color values as the general color option can be used here.
            --     added    = 'DiffAdd', -- Changes the diff's added color
            --     modified = 'DiffChange', -- Changes the diff's modified color
            --     removed  = 'DiffDelete', -- Changes the diff's removed color you
            -- },
            symbols = { added = '+', modified = '~', removed = '-' },
            color = { bg = colors.bg_highlight, fg = colors.teal },
            -- diff_color = { added = colors.git.add, modified = colors.git.change, removed = colors.git.delete },
            separator = { left = "", right = "" },
        }

        local progress = {
            'progress',
            separator = { left = "", right = "" },
            color = { bg = colors.bg_highlight, fg = colors.cyan },
        }

        local location = {
            'location',
            separator = { left = "", right = "" },
            color = { bg = colors.cyan, fg = colors.bg_highlight },
        }

        local modes = {
            'mode',
            separator = { left = "", right = "" },
            color = { fg = colors.bg_highlight },
        }

        local function getLspName()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return "  " .. client.name
                end
            end
            return "  " .. msg
        end

        local dia = {
            'diagnostics',
            color = { bg = colors.bg_highlight, fg = colors.red },
            separator = { left = "", right = "" },
        }

        local lsp = {
            function()
                return getLspName()
            end,
            separator = { left = "", right = "" },
            color = { bg = colors.red, fg = colors.bg_highlight },
        }

        return {
            options = {
                icons_enabled = true,
                theme = theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                -- component_separators = { left = '', right = '' },
                -- section_separators = { left = '', right = '' },
                -- component_separators = { '', '' },
                -- section_separators = { '', '' },
                disabled_filetypes = {
                    { "alpha", "NvimTree", "TelescopePrompt" },
                },
                ignore_focus = { "NvimTree" },
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            -- sections = {
            --     lualine_a = { 'mode' },
            --     lualine_b = { 'branch', 'diff', 'diagnostics' },
            --     lualine_c = { 'filename' },
            --     lualine_x = { 'encoding', 'fileformat', 'filetype' },
            --     lualine_y = { 'progress' },
            --     lualine_z = { 'location' }
            -- },
            sections = {
                lualine_a = {
                    modes,
                },
                lualine_b = {
                    space,
                },
                lualine_c = {
                    filename,
                    filetype,
                    space,
                    branch,
                    diff,
                },
                lualine_x = {
                    encoding,
                    fileformat,
                    space,
                },
                lualine_y = {
                    progress,
                    location,
                    space,
                },
                lualine_z = {
                    dia,
                    lsp,
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                -- lualine_c = { 'filename' },
                lualine_c = {},
                -- lualine_x = { 'location' },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = {
                    space,
                    buffers,
                },
                lualine_b = {
                    -- filetype_tab,
                },
                lualine_c = {
                },
                lualine_x = {
                },
                lualine_y = {
                },
                lualine_z = {
                },
            },
            winbar = {},
            inactive_winbar = {},
            extensions = { 'nvim-tree', 'toggleterm' }
        }
    end,
    config = function(_, opts)
        require('lualine').setup(opts)

        -- vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
        -- vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
    end,
}
