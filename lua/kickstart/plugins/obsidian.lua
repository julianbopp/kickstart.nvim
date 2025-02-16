return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = os.getenv 'OBSIDIAN_DIR',
      },
    },
    notes_subdir = 'inbox',
    new_notes_location = 'notes_subdir',

    preferred_link_style = 'markdown',
    disable_frontmatter = false,
    ---@return table
    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end

      local out = { filename = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
          if k == 'filename' then
            out[k] = note.id
          end
        end
      end

      return out
    end,

    templates = {
      subdir = 'templates',
      date_format = '%d-%m-%Y',
      time_format = '%H:%M:%S',
    },

    completion = {
      nvim_cmp = true,
      min_chars = 0,
    },

    daily_notes = {
      date_format = '%d-%m-%Y',
      default_tags = {
        'daily-note',
      },
      template = nil,
    },

    attachements = {
      img_folder = 'Attachements',
    },

    -- see below for full list of options 👇
  },
}
