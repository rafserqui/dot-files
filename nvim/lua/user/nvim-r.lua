--M = {}
--local status_ok, nvimr = pcall(require, "Nvim-R")
--if not status_ok then
--	return
--end
--
--nvimr.setup({
--    options = {
--      R_assign = 0
--  }
--})

vim.g["R_assign"] = '0'
vim.g["R_disable_cmds"] = {'RSendFunction', 'RESendFunction', 'RDSendFunction',
        'RSendMBlock', 'RESendMBlock', 'RDSendMBlock', 'REDSendMBlock'}
vim.g["R_rconsole_width"] = '0' -- Always split horizontally
