return {
  on_attach = function(client, buf_id)
    -- Populate quickfix with diagnostics on save
    vim.api.nvim_create_autocmd('BufWritePost', {
      buffer = buf_id,
      callback = function()
        vim.diagnostic.setqflist({ open = false })
      end,
      desc = 'Update quickfix list from diagnostics',
    })
  end,
  cmd = { 'clangd', '--background-index' },
}
