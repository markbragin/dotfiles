local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

local create_floating_window = function(opts)
  opts = opts or {}
  local width = opts.with or math.floor(vim.o.columns * 0.8)
  local height = opts.with or math.floor(vim.o.lines * 0.8)


  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    border = "rounded"
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_floating_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
    vim.cmd.startinsert()
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command('FloatingTerminal', toggle_floating_terminal, {})
vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_floating_terminal)
