local cfg = {
  bind = true,
  handler_opts = {
    border = 'rounded'
  },
  max_height = 24,
  close_timeout = 0,
  hint_enable = false,

}
require "lsp_signature".setup(cfg)
