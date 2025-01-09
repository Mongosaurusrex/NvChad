local dap = require("dap")

-- Debugger keymaps
-- F5 start new debugging session
-- F10, F11, F12 move through
-- <leader>b to toggle breakpoint on line
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)


-- Signs
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })

local dap_utils = require("dap.utils")
local dap_vscode_js = require("dap-vscode-js")

dap_vscode_js.setup({
  node_path = "node",
  debugger_path = os.getenv("HOME") .. "/.local/share/nvim/lazy/vscode-js-debug",
  adapters = { "pwa-node", "node-terminal", "pwa-extensionHost" }
})

local exts = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
}

for _, ext in ipairs(exts) do
  dap.configurations[ext] = {
    -- Attach to processId
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach Program (pwa-node, select pid)",
      cwd = vim.fn.getcwd(),
      processId = 9925,
      skipFiles = {
        "<node_internals>/**",
        "node_modules/**"
      },
    },
  }
end
