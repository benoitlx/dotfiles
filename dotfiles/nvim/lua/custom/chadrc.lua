---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

-- Path to ascii art for nvdash
local ascii = require "custom.ascii"

M.ui = {
  theme = "solarized_dark",
  theme_toggle = { "solarized_dark", "everforest_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  transparency = false,

  -- nvdash (dashboard)
  nvdash = {
    load_on_startup = true,

    header = ascii.ansi_shadow,

    -- buttons = {
    --   { "  Find File", "Spc f f", "Telescope find_files" },
    --   { "  Recent Files", "Spc f o", "Telescope oldfiles" },
    --   { "  Find Word", "Spc f w", "Telescope live_grep" },
    --   { "  Bookmarks", "Spc b m", "Telescope marks" },
    --   { "  Themes", "Spc t h", "Telescope themes" },
    --   { "  Mappings", "Spc c h", "NvCheatsheet" },
    -- },
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

-- toggleterm
-- M.toggleterm = require "custom.configs.toggleterm"

return M
