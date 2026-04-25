local avante_system_prompt = [[
You are a code editor. 
Your ONLY task is to output the modified code for the provided file snippet.
Do NOT explain the code. Do NOT say "Sure" or "Understood".
Output the results in the following format:
```language
modified code here
]]

return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "ollama",
    auto_suggestions_provider = nil, -- Optional: use it for copilot-like suggestions
    providers = {
      ollama = {
        endpoint = "http://192.168.0.185:11434", -- Base URL only
        -- model = "deepcoder:1.5b",            -- Your choice from your list
        -- model = "qwen2.5-coder:1.5b",            -- Your choice from your list
        model = "deepcoder:14b",            -- Your choice from your list
        -- model = "qwen2.5-coder:0.5b",            -- Your choice from your list
        -- model = "qwen2.5-coder:3b",            -- Your choice from your list
        timeout = 60000,                        -- 30 seconds
        temperature = 0,                        -- Better for coding
        -- disable_tools = true,
        max_tokens = 4096,
        system_prompt = "You are a helpful coding assistant. Respond ONLY with code blocks or brief explanations. Do not attempt to use any tools or JSON commands like 'write_to_file' or 'attempt_completion'.",
        extra_request_body = {
          num_ctx = 8192,
          temperature = 0,
        },
      },
    },
    -- provider = "ollama",
  },
  vendors = {
    ["qwen_2b"] = {
      __inherited_from = "openai",
      endpoint = "http://192.168.0.10:11434/v1",
      model = "qwen3.5:2b",
      api_key_name = "",
    },
    ["qwen_3b"] = {
      __inherited_from = "openai",
      endpoint = "http://192.168.0.10:11434/v1",
      model = "qwen2.5-coder:1.5b",
      api_key_name = "",
    },
    ["qwen_1.5b"] = {
      __inherited_from = "openai",
      endpoint = "http://192.168.0.10:11434/v1",
      model = "qwen2.5-coder:1.5b",
      api_key_name = "",
      system_prompt = avante_system_prompt,
    },
    ["qwen_0.5b"] = {
      __inherited_from = "openai",
      endpoint = "http://192.168.0.10:11434/v1",
      model = "qwen2.5-coder:0.5b",
      api_key_name = "",
      system_prompt = avante_system_prompt,
    },
    ["deepcoder"] = {
      __inherited_from = "openai",
      endpoint = "http://192.168.0.10:11434/v1",
      model = "deepcoder:1.5b",
      api_key_name = "",
      system_prompt = avante_system_prompt,
    },
  },
  behaviour = {
    auto_suggestions = false,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = true,
    support_paste_from_clipboard = false,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
