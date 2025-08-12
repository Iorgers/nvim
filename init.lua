require "remap"
require "options"
require "autocmds"
require "plugins"
require "git"
require "textobjects"
require "colorscheme"

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules", ".git", "vendor" },
    },
    border = false,
    winblend = 50,
}

-- Automatically reload init.lua when saved
local reload_group = vim.api.nvim_create_augroup("ReloadInit", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = reload_group,
  pattern = "init.lua",
  callback = function()
    vim.cmd("source %")
  end,
})

-- Load custom config file if it exists in the current working directory
-- Useful for project-specific configurations
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local config = vim.fn.getcwd() .. "/.nvim.lua"
    if vim.fn.filereadable(config) == 1 then
      dofile(config)
    end
  end,
})

-- Auto update Neovim config from a git repository on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local config_path = vim.fn.stdpath("config")
    local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD"):gsub("\n", "")

    local cmd = {
      "bash",
      "-c",
      string.format(
        "cd %s && git fetch origin %s > /dev/null 2>&1 && git checkout %s 2>&1 && git pull --ff-only origin %s 2>&1",
        config_path,
        branch,
        branch,
        branch
      )
    }

    vim.fn.jobstart(cmd, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_stdout = function(_, data)
        if data and #data > 0 then
          local filtered = {}
          for _, line in ipairs(data) do
            if line:match("%S") then
              table.insert(filtered, line)
            end
          end
          if #filtered > 0 then
            vim.notify(table.concat(filtered, "\n"), vim.log.levels.INFO)
          end
        end
      end,
      on_stderr = function(_, data)
        if data and #data > 0 then
          local filtered = {}
          for _, line in ipairs(data) do
            if line:match("%S") then
              table.insert(filtered, line)
            end
          end
          if #filtered > 0 then
            vim.notify(table.concat(filtered, "\n"), vim.log.levels.ERROR)
          end
        end
      end,
    })
  end,
})
