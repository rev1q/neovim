return {
  "akinsho/toggleterm.nvim",
  version = "*",

  opts = {
    -- サイズ指定（水平分割の場合の高さ、垂直分割の場合の幅）
    size = 20,
    -- ターミナルを開くためのキー（ここでは <C-\> つまり Ctrl + \ ）
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
    close_on_exit = true,
    shell = vim.o.shell,
    -- 浮き出しウィンドウの設定
    float_opts = {
      border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
      winblend = 3,
    },
  },

  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- ターミナル内専用のキーマップ設定
    function _G.set_terminal_keymaps()
      local map_opts = { buffer = 0 }
      -- Esc 2回押しでターミナル内のノーマルモードへ（戻りやすくするため）
      vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], map_opts)
      -- ターミナル間やウィンドウ間の移動を楽にする設定
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], map_opts)
      -- vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], map_opts)
      -- vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], map_opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], map_opts)
    end

    -- ターミナルが開かれた時だけ上記のキーマップを有効にする
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- カスタムキーマップ（お好みで追加してください）
    -- <leader>f で浮き出しターミナルをトグル
    vim.keymap.set("n", "<leader>f", "<cmd>ToggleTerm direction=float<cr>", { desc = "浮き出しターミナル" })
    -- <leader>h で水平分割ターミナルをトグル
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ターミナル（水平分割）" })
  end,
}
