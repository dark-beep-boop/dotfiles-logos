-- painted theme
-- by dark-beep-boop

local colors = {
  base00 = '#011837',
  base01 = '#022c64',
  base02 = '#033e8c',
  base03 = '#0450b4',
  base04 = '#378cfb',
  base05 = '#4b97fb',
  base06 = '#5fa3fc',
  base07 = '#9bc5fd',
  base08 = '#ff1f1f',
  base09 = '#fd3d25',
  base0A = '#fa5c2b',
  base0B = '#f87a31',
  base0C = '#f59937',
  base0D = '#f3b73d',
  base0E = '#e28fbb',
  base0F = '#e28fbb',
}

return {
  normal = {
    a = { bg = colors.base02, fg = colors.base06, gui = 'bold' },
    b = { bg = colors.base01, fg = colors.base06 },
    c = { bg = colors.base00, fg = colors.base05 }
  },
  insert = {
    a = { bg = colors.base0D, fg = colors.base00, gui = 'bold' },
    b = { bg = colors.base01, fg = colors.base06 },
    c = { lg = colors.base00, fg = colors.base05 }
  },
  visual = {
    a = { bg = colors.base07, fg = colors.base00, gui = 'bold' },
    b = { bg = colors.base01, fg = colors.base06 },
    c = { bg = colors.base00, fg = colors.base05 }
  },
  replace = {
    a = { bg = colors.base0B, fg = colors.base00, gui = 'bold' },
    b = { bg = colors.base01, fg = colors.base06 },
    c = { bg = colors.base00, fg = colors.base05 }
  },
  command = {
    a = { bg = colors.base08, fg = colors.base00, gui = 'bold' },
    b = { bg = colors.base01, fg = colors.base06 },
    c = { bg = colors.base00, fg = colors.base05 }
  },
  inactive = {
    a = { bg = colors.base01, fg = colors.base06, gui = 'bold' },
    b = { bg = colors.base01, fg = colors.base06 },
    c = { bg = colors.base01, fg = colors.base06 }
  }
}

-- vim: ts=2 sts=2 sw=2 et
