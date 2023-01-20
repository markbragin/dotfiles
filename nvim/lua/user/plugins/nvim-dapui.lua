local dapui_status, dapui = pcall(require, "dapui")
if not dapui_status then
  print("Can't load nvim-dap-ui")
  return
end

-- mappings
-- vim.keymap.set("n", "<F3>", "<cmd>lua require('dapui').toggle()<CR>")
vim.keymap.set("n", "E", "<cmd>lua require('dapui').eval()<CR>")
vim.keymap.set("n", "<leader>r", "<cmd>lua require('dapui').float_element('repl')<CR>")

-- autotoggle
local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- setup
dapui.setup({
  -- general mappings
  mappings = {},
  -- Use this to override mappings for specific elements
  element_mappings = {},
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        "stacks",
        "scopes",
        "breakpoints",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "console",
      },
      size = 0.35,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "rounded", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})

