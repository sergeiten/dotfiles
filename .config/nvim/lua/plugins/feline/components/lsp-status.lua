local colors = require("utils.colors")
local loading = require("ui.loading")

local lsp_status = nil

vim.api.nvim_create_autocmd("User", {
	callback = function()
		lsp_status = vim.lsp.status()
	end,
})

return {
	provider = function()
		if lsp_status ~= "" then
			local status = lsp_status
			-- local message = status.title

			-- if not loading.state.is_running then
			-- 	loading.start()
			-- end
			--
			-- if status.done then
			-- 	loading.stop()
			--
			-- 	return ""
			-- end
			--
			-- if status.title == "diagnostics" then
			-- 	message = "Analyzing"
			-- end
			--
			-- if status.title == "formatting" then
			-- 	message = "Formatting"
			-- end
			--
			-- if status.title == "diagnostics_on_open" then
			-- 	message = "Starting"
			-- end
			--
			-- if status.title == "code_action" then
			-- 	message = "Getting Actions"
			-- end

			-- return "  " .. "[" .. status.name .. "] " .. message .. " " .. loading.state.current_spinner
			return "  " .. "[" .. status .. "] " .. loading.state.current_spinner
		end

		return ""
	end,
	hl = {
		fg = colors.white,
		bg = colors.background,
	},
}
