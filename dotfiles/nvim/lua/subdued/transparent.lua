local transparent = {}

-- Groups whose background is stripped so the terminal emulator shows through.
-- Only backgrounds (not text) are removed; CursorLine, Visual, Search, etc.
-- keep their backgrounds on purpose.
local no_bg_groups = {
  'Normal',
  'NormalFloat',
  'EndOfBuffer',
  'Folded',
  'FloatBorder',
  'FloatTitle',
  'StatusLine',
  'StatusLineNC',
  'WinBar',
  'WinBarNC',
  'TabLine',
  'TabLineSel',
  'MsgSeparator',
  'DiagnosticFloatingError',
  'DiagnosticFloatingHint',
  'DiagnosticFloatingInfo',
  'DiagnosticFloatingOk',
  'DiagnosticFloatingWarn',
  'MiniFilesTitleFocused',
  'MiniMapNormal',
  'MiniStatuslineDevinfo',
  'MiniStatuslineFileinfo',
  'MiniStatuslineFilename',
  'MiniTablineCurrent',
  'MiniTablineHidden',
  'MiniTablineModifiedCurrent',
  'MiniTablineModifiedHidden',
  'MiniTablineModifiedVisible',
  'MiniTablineTabpagesection',
  'MiniTablineTrunc',
  'MiniTablineVisible',
}

transparent.apply = function()
  for _, group in ipairs(no_bg_groups) do
    local hl = vim.api.nvim_get_hl(0, { name = group })
    hl.link = nil
    hl.bg = 'NONE'
    vim.api.nvim_set_hl(0, group, hl)
  end
end

transparent.setup = function()
  -- Re-apply on every colorscheme change, so any scheme (including nvim's
  -- built-in `default`) stays transparent.
  Config.new_autocmd('ColorScheme', '*', transparent.apply, 'Keep background transparent')
  transparent.apply()
end

return transparent