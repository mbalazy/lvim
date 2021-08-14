-- Setup formatters for JavaScript family
lvim.lang.javascript.formatters = { {exe = "prettierd"} }
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters

-- Setup linters for JavaScript family
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
lvim.lang.vue.linters = lvim.lang.javascript.linters

-- Setup linters for css/html
lvim.lang.css.formatters = { { exe = 'prettierd' } }
lvim.lang.html.formatters = lvim.lang.css.formatters
lvim.lang.scss = lvim.lang.css
