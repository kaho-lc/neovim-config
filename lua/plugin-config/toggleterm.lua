---@diagnostic disable: missing-parameter
local status, toggleterm = pcall(require, "toggleterm")
if not status then
  vim.notify("没有找到 toggleterm")
  return
end

toggleterm.setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  layout_config = {
    width = 0.98,
    preview_cutoff = 1
  },

  shell = "pwsh -nologo",
  start_in_insert = true,
})

local Terminal = require("toggleterm.terminal").Terminal

local ta = Terminal:new({
  direction = "float",
  close_on_exit = true,
})

local tb = Terminal:new({
  direction = "vertical",
  close_on_exit = true,
})

local tc = Terminal:new({
  direction = "horizontal",
  close_on_exit = true,
})

local M = {}

M.toggleA = function()
  if ta:is_open() then
    ta:close()
    return
  end
  tb:close()
  tc:close()
  ta:open()
end

M.toggleB = function()
  if tb:is_open() then
    tb:close()
    return
  end
  ta:close()
  tc:close()
  tb:open()
end

M.toggleC = function()
  if tc:is_open() then
    tc:close()
    return
  end
  ta:close()
  tb:close()
  tc:open()
end

M.toggleG = function()
  lazygit:toggle()
end

require("keybindings").mapToggleTerm(M)
