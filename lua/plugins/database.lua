return {
  {
    'kristijanhusak/vim-dadbod-ui',
    -- dependencies = {}
    cmd = {
      'DBUI',
      'DBUIToggle',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_connections = {
        {
          name = "Project_PG",
          url = "postgresql://myuser:password@localhost:5432/database" --TODO: Change once a db is configured
        }, -- Add more connections in this context
      }
    end,
  }
}
