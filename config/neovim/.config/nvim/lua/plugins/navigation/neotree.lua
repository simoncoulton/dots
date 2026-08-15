return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		hide_root_node = true,
		retain_hidden_root_indent = true,
		filesystem = {
			filtered_items = {
				show_hidden_count = false,
				visible = true,
				hide_dotfiles = false,
				never_show = {
					".DS_Store",
				},
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
		},
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
			{
				event = "neo_tree_window_opened",
				handler = function()
					-- Custom cursor line color (teal/cyan works well with catppuccin-frappe)
					vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { bg = "#303347", bold = true })
				end,
			},
		},
	},
	keys = {
		{
			"<leader>[",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					source = "filesystem",
					position = "left",
				})
			end,
			desc = "Buffers (root dir)",
		},
	},
}
