return {
  'booperlv/nvim-gomove',
  opts = {
    -- whether or not to vim.keymap.set default key bindings, (true/false)
    map_defaults = true,
    -- whether or not to reindent lines moved vertically (true/false)
    reindent = true,
    -- whether or not to undojoin same direction moves (true/false)
    undojoin = true,
    -- whether to not to move past end column when moving blocks horizontally, (true/false)
    move_past_end_col = false,
  }
}
