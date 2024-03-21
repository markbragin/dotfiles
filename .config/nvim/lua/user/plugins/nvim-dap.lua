return {
  'mfussenegger/nvim-dap',
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio"
  },
  config = function ()
    local dap = require('dap')
    -- default adapters
    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/delbik/.local/share/nvim/mason/bin/OpenDebugAD7'
    }

    dap.adapters.debugpy = {
      id = 'debugpy',
      type = 'executable',
      command = '/home/delbik/.local/share/nvim/mason/bin/debugpy-adapter'
    }

    -- mapping (:h dap-mapping)
    vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<CR>")
    vim.keymap.set("n", "<leader><F5>", "<cmd>lua require('dap').terminate()<CR>")
    vim.keymap.set("n", "<F9>", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
    vim.keymap.set("n", "<leader><F9>", "<cmd>lua require('dap').clear_breakpoints()<CR>")
    vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>")
    vim.keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>")
    vim.keymap.set("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>")
    vim.keymap.set("n", "<F6>", "<cmd>lua require('dap').restart()<CR>")
    -- vim.keymap.set("n", "<leader><F3>", "<cmd>lua require('dap.ext.vscode').load_launchjs(vim.fn.getcwd() .. '/.launch.json', { cppdbg = {'cpp'} })<CR>")

    -- autoload .launch.json config
    vim.cmd("lua require('dap.ext.vscode').load_launchjs(vim.fn.getcwd() .. '/.launch.json', { cppdbg = {'cpp'} })")

    -- default external terminal
    -- dap.defaults.fallback.force_external_terminal = true
    -- dap.defaults.fallback.external_terminal = {
    --   command = '/usr/bin/alacritty';
    --   args = {'-e'};
    -- }

    -- default configurations
    dap.configurations.cpp = {
      {
        type = "cppdbg",
        name = "cmake",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = "${workspaceFolder}/bin/debug/${fileBasenameNoExtension}",
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb",
      },
      {
        type = "cppdbg",
        name = "raw",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = "${fileBasenameNoExtension}",
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb",
      },
    }

    dap.configurations.python = {
      {
        type = "debugpy",
        name = "raw",
        request = "launch",
        cwd = "${workspaceFolder}",
        program = "${file}",
        -- MIMode = "gdb",
        -- miDebuggerPath = "/usr/bin/gdb",
      },
    }
  end
}

