local status_ok, rnvim = pcall(require, "r")
if not status_ok then
    return
end

rnvim.setup({
    rconsole_width = 0,
    disable_cmds = {
        'RSendFunction', 'RESendFunction', 'RDSendFunction',
        'RSendMBlock', 'RESendMBlock', 'RDSendMBlock',
        'REDSendMBlock'
    },
    pipe_keymap = ""
})
