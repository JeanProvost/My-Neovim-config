return {
  "sphamba/smear-cursor.nvim",
  opts = {
    smear_between_buffers = true,

    -- Smear cursot when moving within line or neighbor lines 
    smear_between_neighbor_lines = true,

    -- Draw smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,

    -- Smears will blend better on all backgrounds
    legacy_computing_symbols_support = false,
    smear_insert_mode = true,
  },
}
