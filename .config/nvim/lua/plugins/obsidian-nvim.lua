return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required.
  },
  opts = {
    workspaces = {
      {
        name = "knowledge",
        path = "~/notes",
      },
      {
        name = "personal",
        path = "~/pnotes",
      },
    },
    ui = {
      enable = true,
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "daily",
    },
    attachments = {
      img_folder = "attachments",  -- This is the default
    },
  },
}
