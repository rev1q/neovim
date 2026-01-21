return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup{
      size = 20,                     -- size can be a number or function which is passed the current terminal
      open_mapping = [[<leader>tt]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      hide_numbers = true,           -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      autochdir = false,             -- when neovim changes it current directory the terminal will change it's own when next it's opened
      shade_terminals = true,        -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
      start_in_insert = true,
      insert_mappings = true,        -- whether or not the open mapping applies in insert mode
      terminal_mappings = true,      -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      persist_mode = true,           -- if set to true (default) the previous terminal mode will be remembered
      direction = 'horizontal',
      close_on_exit = true,          -- close the terminal window when the process exits
      clear_env = false,             -- use only environmental variables from `env`, passed to jobstart()
       -- Change the default shell. Can be a string or a function returning a string
      shell = vim.o.shell,
      auto_scroll = true,            -- automatically scroll to the bottom on terminal output
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        border = 'curved',
        winblend = 3,
        title_pos = 'center',
      },
      winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
          return term.name
        end
      },
    }
    -- ここでlazygitを開く設定を追加している
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    local float_term = Terminal:new({ hidden = true, direction = "float" })
    local vertical_term = Terminal:new({ hidden = true, direction = "vertical", size = 80 })
    local horizontal_term = Terminal:new({ hidden = true, direction = "horizontal", size = 20 })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set("n", "<leader>lg", function() _lazygit_toggle() end, { desc = "ToggleTerm lazygit" })
    vim.keymap.set("n", "<leader>tf", function() float_term:toggle() end, { desc = "ToggleTerm float" })
    vim.keymap.set("n", "<leader>tv", function() vertical_term:toggle() end, { desc = "ToggleTerm vertical" })
    vim.keymap.set("n", "<leader>th", function() horizontal_term:toggle() end, { desc = "ToggleTerm horizontal" })

  end
}
