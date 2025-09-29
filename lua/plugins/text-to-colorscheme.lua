
-- lua/plugins/text-to-colorscheme.lua
return {
  "svermeulen/text-to-colorscheme",
  lazy = false,

  config = function()
    vim.o.background = "dark"
    require("text-to-colorscheme").setup({
      ai = {
        openai_api_key = os.getenv("OPENAI_API_KEY"),
        gpt_model = "gpt-4.1",
      },
        hex_palettes = {
          {
            name = "C-Moon",
            background_mode = "dark",
            background = "#0b0c12",
            foreground = "#ccdaff",
            accents = {
               "#9da2ff",
               "#6479ff",
               "#5bfff0",
               "#8affa2",
               "#ffee58",
               "#ff8bdf",
               "#5869ff",
            },
         },
         {
            name = "Gold Experience Jojo's",
            background_mode = "dark",
            background = "#2a1e13",
            foreground = "#ffe9a3",
            accents = {
               "#ffd700",
               "#b08d57",
               "#e5c07b",
               "#a259e6",
               "#f7a8b8",
               "#6bc473",
               "#5fa8d3",
            },
         },
         {
            name = "Jotaro",
            background_mode = "dark",
            background = "#11131d",
            foreground = "#d8e4ff",
            accents = {
               "#2f58bd",
               "#a0b6ff",
               "#ffe457",
               "#724398",
               "#1c917f",
               "#ffab29",
               "#ff3f4f",
            },
         },
      },
      default_palette = "Jotaro",
    })
    vim.api.nvim_set_keymap('n', '<f7>', ':T2CAddContrast -0.1<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<f8>', ':T2CAddContrast 0.1<cr>', {noremap = true, silent = true})

    vim.api.nvim_set_keymap('n', '<f10>', ':T2CAddSaturation -0.1<cr>', {noremap = true, silent = true})
    vim.api.nvim_set_keymap('n', '<f12>', ':T2CAddSaturation 0.1<cr>', {noremap = true, silent = true})
    vim.cmd.colorscheme("text-to-colorscheme")
  end,
}

