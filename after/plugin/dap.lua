local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

local venv = "./.venv/bin/python"
if vim.fn.executable(venv) == 1 then
    require("dap-python").setup(venv)
else
    require("dap-python").setup("python3") -- fallback to system python
end


vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
vim.keymap.set('n', '<Leader>dr', dap.repl.open)
vim.keymap.set('n', '<Leader>dl', dap.run_last)
vim.keymap.set('n', '<Leader>du', dapui.toggle)

vim.cmd("hi DapBreakpointColor guifg=#fa4848")
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
