-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

local color = {
  blue = "#61afef",
  green = "#98c379",
  red = "#e06c75",
}
-- configure/enable gitsigns
gitsigns.setup({
  signs = {
    add = { text = "│", hl = "GitSignsAdd", numhl = "GitSignsAddNr" },
    change = { text = "│", hl = "GitSignsChange", numhl = "GitSignsChangeNr" },
    delete = { text = "_", hl = "GitSignsDelete", numhl = "GitSignsDeleteNr" },
    topdelete = { text = "‾", hl = "GitSignsDelete", numhl = "GitSignsDeleteNr" },
    changedelete = { text = "~", hl = "GitSignsChange", numhl = "GitSignsChangeNr" },
  },
  numhl = false,
  linehl = false,
  keymaps = {},
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil,
})

vim.cmd("highlight GitSignsAdd guifg=" .. color.green .. " guibg=NONE")
vim.cmd("highlight GitSignsChange guifg=" .. color.blue .. " guibg=NONE")
vim.cmd("highlight GitSignsDelete guifg=" .. color.red .. " guibg=NONE")
