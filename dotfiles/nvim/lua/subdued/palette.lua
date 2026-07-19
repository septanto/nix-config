-- Kanagawa-inspired dark palette (low contrast)
-- Source: https://github.com/rebelot/kanagawa.nvim
local dark = {
  bg_edge2 = '#16161D',
  bg_edge  = '#181820',
  bg       = '#1F1F28',
  bg_mid   = '#2A2A37',
  bg_mid2  = '#363646',

  fg_edge2 = '#F0ECD5',
  fg_edge  = '#E8E3C8',
  fg       = '#DCD7BA',
  fg_mid   = '#C8C093',
  fg_mid2  = '#AEA89A', -- was #A09A8A; lightened to clear 4.5:1 on bg_mid2 (MatchParen bg)

  accent    = '#7E9CD8',
  accent_bg = '#223249',

  red    = '#E8758A', -- was #E46876; lightened for ~5.7:1 on bg (PreProc, DiagnosticError)
  orange = '#DCA561',
  yellow = '#E6C384',
  green  = '#98BB6C',
  cyan   = '#7AA89F',
  azure  = '#7FB4CA', -- distinct from accent (#7E9CD8): aqua-leaning blue for Function/Directory
  blue   = '#A992C8', -- was #957FB8; lightened for ~5.8:1 on bg (PreProc, @parameter)
  purple = '#B8B4D0',

  red_bg    = '#43242B',
  orange_bg = '#3A3520', -- RenderMarkdownH1Bg
  yellow_bg = '#3B3318', -- DiffText: darker amber tint, distinct from orange_bg
  green_bg  = '#2B3328',
  cyan_bg   = '#252535', -- DiffChange
  azure_bg  = '#1E2D3D', -- RenderMarkdownH5Bg: blue-tinted, distinct from cyan_bg
  blue_bg   = '#2A2040', -- RenderMarkdownH6Bg: violet-tinted, distinct from accent_bg
  purple_bg = '#2E2040', -- MarkviewPalette7Bg: deeper violet, distinct from blue_bg
}

-- Dayfox-inspired light palette (high contrast)
-- Source: https://github.com/EdenEast/nightfox.nvim
local light = {
  bg_edge2 = '#FCFAF8',
  bg_edge  = '#FAF7EF',
  bg       = '#F6F2EE',
  bg_mid   = '#E4DCD4',
  bg_mid2  = '#D3C7BB',

  fg_edge2 = '#1A1030',
  fg_edge  = '#2A1C3E',
  fg       = '#3D2B5A',
  fg_mid   = '#5A3E6E',
  fg_mid2  = '#6A4E60', -- darkened for ~6.6:1 on bg, 5.4:1 on bg_mid (comments legible)

  accent    = '#2848A9',
  accent_bg = '#C8D0DC', -- blue-tinted surface, distinct from bg_mid2 (#D3C7BB)

  red    = '#A5222F',
  orange = '#884200', -- darkened for ~6.7:1 on bg
  yellow = '#875000',
  green  = '#396847',
  cyan   = '#1C6070', -- darkened for ~6.4:1 on bg
  azure  = '#144A88', -- darkened for ~8:1 on bg; teal-leaning to stay distinct from accent
  blue   = '#6E33CE',
  purple = '#8A309A', -- darkened for ~6.8:1 on bg

  red_bg    = '#F0D8D8',
  orange_bg = '#F0E0D0',
  yellow_bg = '#F0ECD0',
  green_bg  = '#D8ECD0',
  cyan_bg   = '#D0E8EC',
  azure_bg  = '#D0DCEC',
  blue_bg   = '#D8D0EC',
  purple_bg = '#ECD0E8',
}

return function()
  if vim.o.background == 'dark' then
    return vim.deepcopy(dark)
  else
    return vim.deepcopy(light)
  end
end
