---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

local run_cmds = {
  python = "python3 " .. vim.fn.expand('%'),
  ocaml = "exit 0;;\ncls\nocaml -init " .. vim.fn.expand('%'),
  c = "gcc -Wall -g -fsanitize=address " .. vim.fn.expand('%'),
}

local launch_interpretor = {
  python = "ipython",
  ocaml = "eval `opam config env`\nutop",
}

local pio_init = "pio project init --board %s --ide vim --sample-code\npio run -t compiledb"
local pio_build = "pio run"
local pio_upload = "pio run -t upload"
local pio_clean = "pio run -t clean"
local pio_home = "pio home"



M.pio = {
  n = {
    ["<leader>pi"] = {
      function ()
        local board = vim.fn.input("Board: ")
        require("nvterm.terminal").send(string.format(pio_init, board))
      end,
      "Initialize a pio project"
    },

    ["<leader>pb"] = {
      function ()
        require("nvterm.terminal").send(pio_build)
      end,
      "Build project"
    },

    ["<leader>pu"] = {
      function ()
        require("nvterm.terminal").send(pio_upload)
      end,
      "Upload to board"
    },

    ["<leader>pc"] = {
      function ()
        require("nvterm.terminal").send(pio_clean)
      end,
      "Clean .pio"
    },

    ["<leader>ph"] = {
      function ()
        require("nvterm.terminal").send(pio_home)
      end,
      "Pio server"
    },
  },
}


M.nvterm = {
  plugin = true,

  n = {
    -- execute the file in terminal
    ["<leader>rr"] = {
      function ()
        require("nvterm.terminal").send(run_cmds[vim.bo.filetype])
      end,
      "Run the file in terminal"
    },

    -- launch interpretor in terminal 
    ["<leader>i"] = {
      function ()
        require("nvterm.terminal").send(launch_interpretor[vim.bo.filetype])
      end,
      "Launch interpretor"
    },
  },

  v = {
    -- send visual selection to terminal
    ["<leader>s"] = {
      function ()
        -- get the current selection
        vim.cmd.normal{'"zy', bang = true}
        local selection = vim.fn.getreg("z")

        require("nvterm.terminal").send(selection)
      end,
      "Send selection"
    }
  },
}

-- more keybinds!

return M
