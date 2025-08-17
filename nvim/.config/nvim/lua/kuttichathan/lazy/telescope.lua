return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local telescope_themes = require("telescope.themes")

			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
				},

				pickers = {
					find_files = {
						find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("file_browser")

			local set = vim.keymap.set

			local nmap = function(keys, func, desc)
				set("n", keys, func, { desc = desc })
			end

			nmap("<leader>ff", builtin.find_files, "[F]ind [F]iles")
			nmap("<leader>fg", builtin.live_grep, "[F]ind by [G]rep")
			nmap("<leader>fb", builtin.buffers, "[F]ind open [B]uffers")
			nmap("<leader>fh", builtin.help_tags, "[F]ind [H]elp tags")
			nmap("<leader>/", function()
				builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown({ winblend = 10, previewer = true }))
			end, "[/] Fuzzy search in current buffer")
			nmap("<leader>gs", builtin.git_status, "[G]it [S]tatus")
			nmap("<leader>ft", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "[F]ile [T]ree")
		end,
	},
}
