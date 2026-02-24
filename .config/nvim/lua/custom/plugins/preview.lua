return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && npm install",
  config = function()
    vim.g.mkdp_highlight_css = "/home/nullboy/.config/nvim/preview.css"
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_page_title = "${name}"
  end,
}
