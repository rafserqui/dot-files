return {
	"jake-stewart/multicursor.nvim",
	branch = "1.0",
	config = function()
		local mc = require("multicursor-nvim")

		mc.setup()

		-- Add cursors above/below the main cursor.
		vim.keymap.set({ "n", "v" }, "<up>", function()
			mc.addCursor("k")
		end)
		vim.keymap.set({ "n", "v" }, "<down>", function()
			mc.addCursor("j")
		end)

		-- Add a cursor and jump to the next word under cursor.
		vim.keymap.set("v", "<c-d>", function()
			mc.addCursor("*")
		end)

		-- Rotate the main cursor.
		vim.keymap.set({ "n", "v" }, "<left>", mc.nextCursor)
		vim.keymap.set({ "n", "v" }, "<right>", mc.prevCursor)

		-- Delete the main cursor.
		vim.keymap.set({ "n", "v" }, "<leader>m", mc.deleteCursor)

		vim.keymap.set({ "n", "v" }, "<c-q>", function()
			if mc.cursorsEnabled() then
				-- Stop other cursors from moving.
				-- This allows you to reposition the main cursor.
				mc.clearCursors()
			else
				mc.addCursor()
			end
		end)

		-- Align cursor columns.
		vim.keymap.set("n", "<leader>a", mc.alignCursors)

		-- Split visual selections by regex.
		vim.keymap.set("v", "S", mc.splitCursors)

		-- Append/insert for each line of visual selections.
		vim.keymap.set("v", "I", mc.insertVisual)
		vim.keymap.set("v", "A", mc.appendVisual)

		-- Rotate visual selection contents.
		vim.keymap.set("v", "<leader>t", function()
			mc.transposeCursors(1)
		end)
		vim.keymap.set("v", "<leader>T", function()
			mc.transposeCursors(-1)
		end)

		-- Customize how cursors look.
		vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
		vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
		vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
	end,
}
