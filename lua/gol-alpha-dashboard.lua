local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local width, height = 40, 15
local second_last_grid = {}
local last_grid = {}
local current_grid = {}

local function grids_equal(g1, g2)
	if not g1 or not g2 or #g1 ~= #g2 then
		return false
	end
	for i = 1, width * height do
		if g1[i] ~= g2[i] then
			return false
		end
	end
	return true
end

local function init_grid()
	math.randomseed(os.time())
	for y = 1, height do
		for x = 1, width do
			local index = ((y - 1) * width) + x
			if y == 1 or y == height or x == 1 or x == width then
				current_grid[index] = 0
			else
				current_grid[index] = math.random(0, 1)
			end
		end
	end
	second_last_grid = {}
	last_grid = {}
end

local function count_neighbors(x, y)
	local n = 0

	for row = y - 1, y + 1 do
		for col = x - 1, x + 1 do
			if row == y and col == x then
				goto continue
			end

			local index = ((row - 1) * width) + col
			if current_grid[index] == 1 then
				n = n + 1
			end
			::continue::
		end
	end
	return n
end

local function update_life()
	local next_grid = {}

	for i = 1, width * height do
		next_grid[i] = 0
	end

	for y = 2, height - 1 do
		for x = 2, width - 1 do
			local n = count_neighbors(x, y)
			local index = ((y - 1) * width) + x
			if n == 3 then
				next_grid[index] = 1
			elseif n == 2 then
				next_grid[index] = current_grid[index]
			else
				next_grid[index] = 0
			end
		end
	end

	second_last_grid = last_grid
	last_grid = current_grid
	current_grid = next_grid
end

local function grid_to_lines()
	local lines = {}
	for y = 1, height do
		local line = ""
		for x = 1, width do
			line = line .. (current_grid[((y - 1) * width) + x] == 1 and "██" or "  ")
		end
		table.insert(lines, line)
	end
	return lines
end

local timer = vim.uv.new_timer()

local function start_simulation(bufnr)
	init_grid()

	timer:start(
		0,
		500,
		vim.schedule_wrap(function()
			if not vim.api.nvim_buf_is_valid(bufnr) or vim.api.nvim_get_current_buf() ~= bufnr then
				timer:stop()
				return
			end

			if grids_equal(last_grid, current_grid) or grids_equal(second_last_grid, current_grid) then
				init_grid()
				return
			end

			update_life()
			dashboard.section.header.val = grid_to_lines()

			pcall(alpha.redraw)
		end)
	)
end

vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function(ev)
		start_simulation(ev.buf)
	end,
})
