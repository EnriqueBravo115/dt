return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  config = function()
    vim.cmd("let g:mkdp_highlight_css='/home/nullboy/.config/nvim/resources/my.css'")
    vim.cmd("let g:mkdp_theme='light'")
    vim.cmd("let g:mkdp_page_title = '${name}'")
  end
}
