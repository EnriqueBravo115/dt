return {
  {
    "Olical/conjure",
    ft = { "clojure", "fennel", "scheme", "racket", "lisp", "lua", "python" },
    dependencies = {
      "tpope/vim-dispatch",
      "clojure-vim/vim-jack-in",
    },
  },
  { "clojure-vim/vim-jack-in", ft = "clojure" },
  { "tpope/vim-dispatch",      cmd = { "Dispatch", "Make", "Focus", "Start" } },
}
