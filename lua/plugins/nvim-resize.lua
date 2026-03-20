return {
  "simeji/winresizer",
  cmd = {
    "WinResizerStartResize",
    "WinResizerStartMove",
    "WinResizerStartFocus",
  },
  keys = function()
    local function resize_once(direction)
      return function()
        vim.cmd("WinResizerStartResize")
        local keys = vim.api.nvim_replace_termcodes(direction .. "<CR>", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
      end
    end

    return {
      { "<leader>wr", "<cmd>WinResizerStartResize<CR>", desc = "WinResizer: resize mode" },
      { "<leader>wj", resize_once("j"), desc = "Resize down" },
      { "<leader>wk", resize_once("k"), desc = "Resize up" },
      { "<leader>wh", resize_once("h"), desc = "Resize left" },
      { "<leader>wl", resize_once("l"), desc = "Resize right" },
    }
  end,
  init = function()
    vim.g.winresizer_vert_resize = 3
    vim.g.winresizer_horiz_resize = 3
  end,
}
