return {
  "vague2k/vague.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("vague").setup({
      transparent = true,
      bold = true,
      italic = false,
      style = {
        boolean = "bold",
        number = "none",
        float = "none",
        error = "bold",
        comments = "none",
        conditionals = "none",
        functions = "none",
        headings = "bold",
        operators = "none",
        strings = "none",
        variables = "none",

        -- keywords
        keywords = "none",
        keyword_return = "none",
        keywords_loop = "none",
        keywords_label = "none",
        keywords_exception = "none",

        -- builtin
        builtin_constants = "bold",
        builtin_functions = "none",
        builtin_types = "bold",
        builtin_variables = "none",
      },
    })
  end
}
