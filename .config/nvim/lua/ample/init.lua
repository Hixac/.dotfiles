-- Ample themes for Neovim
--
-- A faithful port of the Emacs ample themes by Jordon Biondo:
--   https://github.com/jordonbiondo/ample-theme
--
-- Variants:
--   ample       - "Calm Dark Theme" (the original)
--   ample-light - "Calm Light Theme"
--   ample-flat  - "Flat version of ample" (desaturated dark)
--
-- Each variant is exposed as a normal Neovim colorscheme through
-- colors/ample.lua, colors/ample-light.lua and colors/ample-flat.lua.

local M = {}

local palettes = {
  -- =====================================================================
  -- ample (dark)
  -- =====================================================================
  ample = {
    bg              = "#212121", -- "gray13"
    fg              = "#bdbdb3",
    fringe          = "#1f1f1f",
    region          = "#303030",
    region_dark     = "#252525",
    region_light    = "#303030",
    hl_line         = "#1f1f1f",
    cursor          = "#f57e00",

    green           = "#6aaf50",
    dark_green      = "#057f40",
    blue            = "#5180b3",
    blue_bg         = "#102843",
    light_blue      = "#528fd1",
    lighter_blue    = "#68a5e9",
    orange          = "#df9522",
    tan             = "#bdbc61",
    dark_tan        = "#7d7c61",
    yellow          = "#baba36",
    bright_yellow   = "#fffe0a",
    purple          = "#ab75c3",
    light_gray      = "#858585",
    gray            = "#757575",
    dark_gray       = "#656565",
    darker_gray     = "#454545",
    darkest_gray    = "#252525",
    brown           = "#987654",
    red             = "#cd5542",
    dark_red        = "#9d2512",

    rb0 = "#81b0e3", rb1 = "#a5a5a5", rb2 = "#6190c3",
    rb3 = "#959595", rb4 = "#4170a3", rb5 = "#757575",

    -- mode line
    mode_bg           = "#8b8878", -- "cornsilk4"
    mode_fg           = "#252525",
    mode_inactive_bg  = "#454545",
    mode_inactive_fg  = "#8b8878",

    -- floating windows / popups (Emacs popup-tip-face, company-tooltip)
    popup_bg          = "#bdbdb3",
    popup_fg          = "#212121",
    pmenu_sel_bg      = "#5180b3",
    pmenu_sel_fg      = "#bdbdb3",

    -- diff
    diff_add          = "#284828",
    diff_change       = "#484828",
    diff_delete       = "#482828",
    diff_text         = "#8f8f40",
    diff_refine_add   = "#649694",
    diff_refine_change= "#8f8f40",
    diff_refine_delete= "#694949",

    prompt_fg         = "#fffe0a",

    ansi = {
      "#454545", "#cd5542", "#6aaf50", "#baba36",
      "#5180b3", "#ab75c3", "#68a5e9", "#bdbdb3",
    },
  },

  -- =====================================================================
  -- ample-light
  -- =====================================================================
  ["ample-light"] = {
    bg              = "#cbc9b1",
    fg              = "#6e6e6e", -- "gray43"
    fringe          = "#cbc9b1",
    region          = "#bbb9a1",
    region_dark     = "#aba991",
    region_light    = "#d2d0b1",
    hl_line         = "#d2d0b1",
    cursor          = "#f57e00",

    green           = "#4a8f30",
    dark_green      = "#057f40",
    blue            = "#4170b3",
    blue_bg         = "#bbb9b1",
    light_blue      = "#528fd1",
    lighter_blue    = "#68a5e9",
    orange          = "#ff8512",
    tan             = "#5d5c01",
    dark_tan        = "#7d7c21",
    yellow          = "#787800",
    bright_yellow   = "#bfbe6a",
    purple          = "#9b55c3",
    light_gray      = "#959595",
    gray            = "#959595",
    dark_gray       = "#959595",
    darker_gray     = "#757575",
    darkest_gray    = "#252525",
    brown           = "#987654",
    red             = "#cd5542",
    dark_red        = "#9d2512",

    rb0 = "#215083", rb1 = "#555555", rb2 = "#515003",
    rb3 = "#555555", rb4 = "#215083", rb5 = "#515003",

    mode_bg           = "#bbb9a1",
    mode_fg           = "#6e6e6e",
    mode_inactive_bg  = "#aba991",
    mode_inactive_fg  = "#cbc9b1",

    popup_bg          = "#aba991",
    popup_fg          = "#7d7c21",
    pmenu_sel_bg      = "#aba991",
    pmenu_sel_fg      = "#6e6e6e",

    diff_add          = "#bbc8a1",
    diff_change       = "#bbb9b1",
    diff_delete       = "#cab9a1",
    diff_text         = "#4170b3",
    diff_refine_add   = "#4a8f30",
    diff_refine_change= "#4170b3",
    diff_refine_delete= "#cd5542",

    prompt_fg         = "#9b55c3",

    ansi = {
      "#757575", "#cd5542", "#4a8f30", "#7d7c21",
      "#4170b3", "#9b55c3", "#68a5e9", "#6e6e6e",
    },
  },

  -- =====================================================================
  -- ample-flat (desaturated dark)
  -- =====================================================================
  ["ample-flat"] = {
    bg              = "#262626", -- "gray15"
    fg              = "#bdbdb3",
    fringe          = "#262424",
    region          = "#343030",
    region_dark     = "#302525",
    region_light    = "#343030",
    hl_line         = "#1f1f1f",
    cursor          = "#afffef",

    green           = "#a9df90",
    dark_green      = "#596f50",
    blue            = "#91a0b3",
    blue_bg         = "#002843",
    light_blue      = "#9fbfdf",
    lighter_blue    = "#afcfef",
    orange          = "#cf9570",
    tan             = "#ddbc91",
    dark_tan        = "#7c7565",
    yellow          = "#aaca86",
    bright_yellow   = "#caca86",
    purple          = "#ab85a3",
    light_gray      = "#857575",
    gray            = "#857575",
    dark_gray       = "#706565",
    darker_gray     = "#504545",
    darkest_gray    = "#302525",
    brown           = "#987654",
    red             = "#ad8572",
    dark_red        = "#8d6552",

    rb0 = "#b1b0e3", rb1 = "#a58585", rb2 = "#9190a3",
    rb3 = "#b59585", rb4 = "#7180a3", rb5 = "#957565",

    mode_bg           = "#8b8878", -- "cornsilk4"
    mode_fg           = "#302525",
    mode_inactive_bg  = "#504545",
    mode_inactive_fg  = "#8b8878",

    popup_bg          = "#bdbdb3",
    popup_fg          = "#262626",
    pmenu_sel_bg      = "#91a0b3",
    pmenu_sel_fg      = "#706565",

    diff_add          = "#a9df90",
    diff_change       = "#aaca86",
    diff_delete       = "#ad8572",
    diff_text         = "#8f8f40",
    diff_refine_add   = "#649694",
    diff_refine_change= "#8f8f40",
    diff_refine_delete= "#694949",

    prompt_fg         = "#caca86",

    ansi = {
      "#504545", "#ad8572", "#a9df90", "#aaca86",
      "#91a0b3", "#ab85a3", "#afcfef", "#bdbdb3",
    },
  },
}

local function set_hl(group, spec)
  if spec.link then
    vim.api.nvim_set_hl(0, group, { link = spec.link })
    return
  end

  local opts = {}
  if spec.fg then opts.fg = spec.fg end
  if spec.bg then opts.bg = spec.bg end
  if spec.sp then opts.sp = spec.sp end
  if spec.bold then opts.bold = true end
  if spec.italic then opts.italic = true end
  if spec.underline then opts.underline = true end
  if spec.undercurl then opts.undercurl = true end
  if spec.strikethrough then opts.strikethrough = true end
  if spec.reverse then opts.reverse = true end
  vim.api.nvim_set_hl(0, group, opts)
end

local function build_groups(name, p)
  local hl = set_hl
  local L = function(to) return { link = to } end

  -- ------------------------------------------------------------------
  -- Base UI
  -- ------------------------------------------------------------------
  hl("Normal",            { fg = p.fg, bg = p.bg })
  hl("NormalNC",          { fg = p.fg, bg = p.bg })
  hl("NormalFloat",       { fg = p.popup_fg, bg = p.popup_bg })
  hl("FloatBorder",       { fg = p.gray, bg = p.popup_bg })
  hl("FloatTitle",        { fg = p.green, bold = true })
  hl("FloatFooter",       { fg = p.gray })
  hl("ColorColumn",       { bg = p.region })
  hl("Conceal",           { fg = p.gray })
  hl("Cursor",            { fg = p.bg, bg = p.cursor })
  hl("CursorIM",          L("Cursor"))
  hl("lCursor",           L("Cursor"))
  hl("CursorColumn",      { bg = p.region })
  hl("CursorLine",        { bg = p.hl_line })
  hl("CursorLineNr",      { fg = p.fg, bg = p.hl_line })
  hl("Directory",         { fg = p.blue })
  hl("DiffAdd",           { bg = p.diff_add })
  hl("DiffChange",        { bg = p.diff_change })
  hl("DiffDelete",        { bg = p.diff_delete })
  hl("DiffText",          { bg = p.diff_text })
  hl("EndOfBuffer",       { fg = p.bg })
  hl("ErrorMsg",          { fg = p.red })
  hl("WinSeparator",      { fg = p.darkest_gray, bg = p.darker_gray })
  hl("VertSplit",         { fg = p.darkest_gray, bg = p.darker_gray })
  hl("Folded",            { fg = p.gray, bg = p.bg })
  hl("FoldColumn",        { fg = p.gray, bg = p.fringe })
  hl("SignColumn",        { fg = p.fg, bg = p.fringe })
  hl("LineNr",            { fg = p.gray, bg = p.bg })
  hl("LineNrAbove",       { fg = p.dark_gray })
  hl("LineNrBelow",       { fg = p.dark_gray })
  hl("CursorLineSign",    L("SignColumn"))
  hl("CursorLineFold",    { fg = p.gray, bg = p.hl_line })
  hl("MatchParen",        { bg = p.dark_gray })
  hl("ModeMsg",           { fg = p.fg })
  hl("MoreMsg",           { fg = p.green })
  hl("MsgArea",           { fg = p.fg, bg = p.bg })
  hl("MsgSeparator",      { fg = p.dark_gray })
  hl("NonText",           { fg = p.dark_gray })
  hl("Pmenu",             { fg = p.popup_fg, bg = p.popup_bg })
  hl("PmenuSel",          { fg = p.pmenu_sel_fg, bg = p.pmenu_sel_bg })
  hl("PmenuKind",         { fg = p.purple, bg = p.popup_bg })
  hl("PmenuKindSel",      { fg = p.pmenu_sel_fg, bg = p.pmenu_sel_bg })
  hl("PmenuExtra",        { fg = p.gray, bg = p.popup_bg })
  hl("PmenuExtraSel",     { fg = p.pmenu_sel_fg, bg = p.pmenu_sel_bg })
  hl("PmenuSbar",         { bg = p.darkest_gray })
  hl("PmenuThumb",        { bg = p.dark_gray })
  hl("Question",          { fg = p.green })
  hl("QuickFixLine",      { bg = p.region })
  hl("Search",            { fg = p.bg, bg = p.blue })
  hl("IncSearch",         { fg = p.bg, bg = p.blue, bold = true })
  hl("CurSearch",         { fg = p.bg, bg = p.lighter_blue })
  hl("SpecialKey",        { fg = p.dark_gray })
  hl("SpellBad",          { sp = p.red, undercurl = true })
  hl("SpellCap",          { sp = p.purple, undercurl = true })
  hl("SpellLocal",        { sp = p.yellow, undercurl = true })
  hl("SpellRare",         { sp = p.light_blue, undercurl = true })
  hl("StatusLine",        { fg = p.mode_fg, bg = p.mode_bg })
  hl("StatusLineNC",      { fg = p.mode_inactive_fg, bg = p.mode_inactive_bg })
  hl("StatusLineTerm",    L("StatusLine"))
  hl("StatusLineTermNC",  L("StatusLineNC"))
  hl("TabLine",           { fg = p.gray, bg = p.darker_gray })
  hl("TabLineFill",       { bg = p.bg })
  hl("TabLineSel",        { fg = p.fg, bg = p.region, bold = true })
  hl("TermCursor",        { fg = p.fg, bg = p.bg, reverse = true })
  hl("TermCursorNC",      { fg = p.fg, bg = p.bg })
  hl("Title",             { fg = p.green, bold = true })
  hl("Visual",            { bg = p.region })
  hl("VisualNOS",         { bg = p.region })
  hl("WarningMsg",        { fg = p.orange, bold = true })
  hl("Whitespace",        { fg = p.gray })
  hl("WildMenu",          { fg = p.bg, bg = p.blue })

  -- ------------------------------------------------------------------
  -- Classic Vim syntax (mapped from Emacs font-lock faces)
  -- ------------------------------------------------------------------
  hl("Comment",           { fg = p.gray })
  hl("Constant",          { fg = p.purple })
  hl("String",            { fg = p.tan })
  hl("Character",         { fg = p.purple })
  hl("Number",            { fg = p.purple })
  hl("Boolean",           { fg = p.purple })
  hl("Float",             { fg = p.purple })
  hl("Identifier",        { fg = p.yellow })
  hl("Function",          { fg = p.green })
  hl("Statement",         { fg = p.blue })
  hl("Conditional",       { fg = p.blue })
  hl("Repeat",            { fg = p.blue })
  hl("Label",             { fg = p.blue })
  hl("Operator",          { fg = p.fg })
  hl("Keyword",           { fg = p.blue })
  hl("Exception",         { fg = p.blue })
  hl("PreProc",           { fg = p.orange })
  hl("Include",           { fg = p.orange })
  hl("Define",            { fg = p.orange })
  hl("Macro",             { fg = p.orange })
  hl("PreCondit",         { fg = p.orange })
  hl("Type",              { fg = p.red })
  hl("StorageClass",      { fg = p.red })
  hl("Structure",         { fg = p.red })
  hl("Typedef",           { fg = p.red })
  hl("Special",           { fg = p.purple })
  hl("SpecialChar",       { fg = p.purple })
  hl("Tag",               { fg = p.blue })
  hl("Delimiter",         { fg = p.fg })
  hl("SpecialComment",    { fg = p.gray })
  hl("Debug",             { fg = p.red })
  hl("Underlined",        { fg = p.lighter_blue, underline = true })
  hl("Ignore",            { fg = p.bg })
  hl("Error",             { fg = p.red })
  hl("Todo",              { fg = p.red, bold = true })

  -- ------------------------------------------------------------------
  -- Tree-sitter (@ captures)
  -- ------------------------------------------------------------------
  hl("@comment",              L("Comment"))
  hl("@comment.documentation",{ fg = p.gray, italic = true })
  hl("@error",                L("Error"))
  hl("@preproc",              L("PreProc"))
  hl("@define",               L("Define"))
  hl("@operator",             L("Operator"))
  hl("@punctuation",          L("Delimiter"))
  hl("@punctuation.delimiter",L("Delimiter"))
  hl("@punctuation.bracket",  L("Delimiter"))
  hl("@punctuation.special",  L("Delimiter"))
  hl("@string",               L("String"))
  hl("@string.regex",         L("String"))
  hl("@string.escape",        { fg = p.orange })
  hl("@string.special",       L("String"))
  hl("@string.special.url",   { fg = p.lighter_blue, underline = true })
  hl("@character",            L("Character"))
  hl("@character.special",    L("Character"))
  hl("@boolean",              L("Boolean"))
  hl("@number",               L("Number"))
  hl("@number.float",         L("Float"))
  hl("@float",                L("Float"))
  hl("@function",             L("Function"))
  hl("@function.builtin",     { fg = p.light_blue })
  hl("@function.call",        L("Function"))
  hl("@function.macro",       L("Function"))
  hl("@method",               L("Function"))
  hl("@method.call",          L("Function"))
  hl("@constructor",          L("Type"))
  hl("@parameter",            L("Identifier"))
  hl("@keyword",              L("Keyword"))
  hl("@keyword.function",     L("Keyword"))
  hl("@keyword.operator",     L("Keyword"))
  hl("@keyword.return",       L("Keyword"))
  hl("@conditional",          L("Conditional"))
  hl("@repeat",               L("Repeat"))
  hl("@debug",                L("Debug"))
  hl("@label",                L("Label"))
  hl("@include",              L("Include"))
  hl("@exception",            L("Exception"))
  hl("@type",                 L("Type"))
  hl("@type.builtin",         { fg = p.light_blue })
  hl("@type.definition",      L("Type"))
  hl("@type.qualifier",       L("StorageClass"))
  hl("@storageclass",         L("StorageClass"))
  hl("@attribute",            L("PreProc"))
  hl("@field",                L("Identifier"))
  hl("@property",             L("Identifier"))
  hl("@variable",             L("Identifier"))
  hl("@variable.builtin",     { fg = p.light_blue })
  hl("@constant",             L("Constant"))
  hl("@constant.builtin",     L("Constant"))
  hl("@constant.macro",       L("Macro"))
  hl("@namespace",            { fg = p.purple })
  hl("@symbol",               L("Constant"))
  hl("@text",                 { fg = p.fg })
  hl("@text.strong",          { bold = true })
  hl("@text.emphasis",        { italic = true })
  hl("@text.underline",       { underline = true })
  hl("@text.strike",          { strikethrough = true })
  hl("@text.title",           L("Title"))
  hl("@text.literal",         L("String"))
  hl("@text.quote",           { fg = p.gray, italic = true })
  hl("@text.uri",             { fg = p.lighter_blue, underline = true })
  hl("@text.math",            { fg = p.purple })
  hl("@text.reference",       { fg = p.lighter_blue })
  hl("@text.environment",     L("PreProc"))
  hl("@text.environment.name",L("PreProc"))
  hl("@text.note",            { fg = p.green })
  hl("@text.warning",         { fg = p.orange })
  hl("@text.danger",          { fg = p.red })
  hl("@text.todo",            L("Todo"))
  hl("@text.todo.unchecked",  { fg = p.dark_gray })
  hl("@text.todo.checked",    { fg = p.green })
  hl("@text.diff.add",        L("DiffAdd"))
  hl("@text.diff.delete",     L("DiffDelete"))

  -- ------------------------------------------------------------------
  -- LSP diagnostics
  -- ------------------------------------------------------------------
  hl("DiagnosticError",           { fg = p.red })
  hl("DiagnosticWarn",            { fg = p.orange })
  hl("DiagnosticInfo",            { fg = p.green })
  hl("DiagnosticHint",            { fg = p.light_gray })
  hl("DiagnosticOk",              { fg = p.green })
  hl("DiagnosticUnderlineError",  { sp = p.red, undercurl = true })
  hl("DiagnosticUnderlineWarn",   { sp = p.orange, undercurl = true })
  hl("DiagnosticUnderlineInfo",   { sp = p.green, undercurl = true })
  hl("DiagnosticUnderlineHint",   { sp = p.light_gray, undercurl = true })
  hl("DiagnosticUnderlineOk",     { sp = p.green, undercurl = true })
  hl("DiagnosticVirtualTextError",{ fg = p.red, bg = p.region })
  hl("DiagnosticVirtualTextWarn", { fg = p.orange, bg = p.region })
  hl("DiagnosticVirtualTextInfo", { fg = p.green, bg = p.region })
  hl("DiagnosticVirtualTextHint", { fg = p.light_gray, bg = p.region })
  hl("DiagnosticVirtualTextOk",   { fg = p.green, bg = p.region })
  hl("DiagnosticSignError",       { fg = p.red })
  hl("DiagnosticSignWarn",        { fg = p.orange })
  hl("DiagnosticSignInfo",        { fg = p.green })
  hl("DiagnosticSignHint",        { fg = p.light_gray })
  hl("DiagnosticSignOk",          { fg = p.green })
  hl("DiagnosticFloatingError",   { fg = p.red })
  hl("DiagnosticFloatingWarn",    { fg = p.orange })
  hl("DiagnosticFloatingInfo",    { fg = p.green })
  hl("DiagnosticFloatingHint",    { fg = p.light_gray })
  hl("DiagnosticFloatingOk",      { fg = p.green })
  hl("DiagnosticDeprecated",      { sp = p.red, strikethrough = true })

  -- ------------------------------------------------------------------
  -- LSP (references, signature help, lenses, hints)
  -- ------------------------------------------------------------------
  hl("LspReferenceText",          { bg = p.region })
  hl("LspReferenceRead",          { bg = p.region, underline = true })
  hl("LspReferenceWrite",         { bg = p.region, bold = true })
  hl("LspSignatureActiveParameter", { bg = p.region })
  hl("LspCodeLens",               { fg = p.gray })
  hl("LspCodeLensSeparator",      { fg = p.gray })
  hl("LspInlayHint",              { fg = p.gray, italic = true })

  -- LSP semantic tokens -> treesitter groups
  hl("@lsp.type.class",         L("@type"))
  hl("@lsp.type.enum",          L("@type"))
  hl("@lsp.type.interface",     L("@type"))
  hl("@lsp.type.struct",        L("@type"))
  hl("@lsp.type.type",          L("@type"))
  hl("@lsp.type.typeParameter", L("@type"))
  hl("@lsp.type.parameter",     L("@parameter"))
  hl("@lsp.type.variable",      L("@variable"))
  hl("@lsp.type.property",      L("@property"))
  hl("@lsp.type.enumMember",    L("@constant"))
  hl("@lsp.type.function",      L("@function"))
  hl("@lsp.type.method",        L("@method"))
  hl("@lsp.type.macro",         L("@constant.macro"))
  hl("@lsp.type.keyword",       L("@keyword"))
  hl("@lsp.type.modifier",      L("@keyword"))
  hl("@lsp.type.comment",       L("@comment"))
  hl("@lsp.type.string",        L("@string"))
  hl("@lsp.type.number",        L("@number"))
  hl("@lsp.type.regexp",        L("@string.regex"))
  hl("@lsp.type.operator",      L("@operator"))
  hl("@lsp.type.decorator",     L("@attribute"))
  hl("@lsp.type.event",         L("@type"))
  hl("@lsp.type.namespace",     L("@namespace"))
  hl("@lsp.type.builtinType",   L("@type.builtin"))
  hl("@lsp.mod.readonly",       { fg = p.purple })
  hl("@lsp.mod.deprecated",     { sp = p.red, strikethrough = true })

  -- ------------------------------------------------------------------
  -- Plugin integrations (matched to the user's plugins)
  -- ------------------------------------------------------------------
  -- git signs / gitsigns
  hl("GitSignsAdd",               { fg = p.green })
  hl("GitSignsChange",            { fg = p.orange })
  hl("GitSignsDelete",            { fg = p.red })
  hl("GitSignsAddNr",             { fg = p.green })
  hl("GitSignsChangeNr",          { fg = p.orange })
  hl("GitSignsDeleteNr",          { fg = p.red })
  hl("GitSignsAddLn",             { bg = p.diff_add })
  hl("GitSignsChangeLn",          { bg = p.diff_change })
  hl("GitSignsDeleteLn",          { bg = p.diff_delete })
  hl("GitGutterAdd",              L("GitSignsAdd"))
  hl("GitGutterChange",           L("GitSignsChange"))
  hl("GitGutterDelete",           L("GitSignsDelete"))
  hl("GitGutterAddLine",          L("GitSignsAddLn"))
  hl("GitGutterChangeLine",       L("GitSignsChangeLn"))
  hl("GitGutterDeleteLine",       L("GitSignsDeleteLn"))

  -- diffview / git-diff style groups
  hl("diffAdded",                 { fg = p.green })
  hl("diffRemoved",               { fg = p.red })
  hl("diffChanged",               { fg = p.orange })
  hl("diffOldFile",               { fg = p.red })
  hl("diffNewFile",               { fg = p.green })
  hl("diffFile",                  { fg = p.blue })
  hl("diffLine",                  { fg = p.gray })
  hl("diffIndexLine",             { fg = p.gray })
  hl("diffSubname",               { fg = p.gray })

  -- neogit / magit-style groups
  hl("NeogitDiffAdd",             { fg = p.green })
  hl("NeogitDiffDelete",          { fg = p.red })
  hl("NeogitDiffAddHighlight",    { fg = p.green, bg = p.region })
  hl("NeogitDiffDeleteHighlight", { fg = p.red, bg = p.region })
  hl("NeogitDiffContextHighlight",{ bg = p.region })
  hl("NeogitHunkHeader",          { fg = p.bg, bg = p.blue })
  hl("NeogitHunkHeaderHighlight", { fg = p.bg, bg = p.light_blue })
  hl("NeogitBranch",              { fg = p.orange })
  hl("NeogitRemote",              { fg = p.yellow })
  hl("NeogitDiffContext",         { fg = p.gray })

  -- nvim-cmp
  hl("CmpItemAbbr",               { fg = p.fg })
  hl("CmpItemAbbrDeprecated",     { fg = p.gray, strikethrough = true })
  hl("CmpItemAbbrMatch",          { fg = p.blue, bold = true })
  hl("CmpItemAbbrMatchFuzzy",     { fg = p.blue })
  hl("CmpItemKind",               { fg = p.purple })
  hl("CmpItemMenu",               { fg = p.gray })
  hl("CmpItemKindDefault",        { fg = p.purple })

  -- fzf-lua (full highlight set; matches the ample ivy/helm/vertico treatment)
  hl("FzfLuaNormal",               { fg = p.fg, bg = p.bg })
  hl("FzfLuaBorder",               { fg = p.dark_gray, bg = p.bg })
  hl("FzfLuaTitle",                { fg = p.green, bold = true })
  hl("FzfLuaTitleFlags",           { fg = p.gray })
  hl("FzfLuaBackdrop",             { bg = p.bg })
  hl("FzfLuaCursor",               L("Cursor"))
  hl("FzfLuaCursorLine",           { fg = p.yellow, bg = p.region })
  hl("FzfLuaCursorLineNr",         { fg = p.fg, bg = p.region })
  hl("FzfLuaSearch",               { fg = p.bg, bg = p.blue })
  hl("FzfLuaScrollFloatEmpty",     { bg = p.dark_gray })
  hl("FzfLuaScrollFloatFull",      { bg = p.gray })
  hl("FzfLuaScrollBorderEmpty",    { fg = p.dark_gray })
  hl("FzfLuaScrollBorderFull",     { fg = p.gray })

  hl("FzfLuaHelpNormal",           { fg = p.fg, bg = p.bg })
  hl("FzfLuaHelpBorder",           { fg = p.dark_gray, bg = p.bg })
  hl("FzfLuaPreviewNormal",        { fg = p.fg, bg = p.bg })
  hl("FzfLuaPreviewBorder",        { fg = p.dark_gray, bg = p.bg })
  hl("FzfLuaPreviewTitle",         { fg = p.green, bold = true })

  hl("FzfLuaHeaderText",           { fg = p.green })
  hl("FzfLuaHeaderBind",           { fg = p.orange })
  hl("FzfLuaPathColNr",            { fg = p.gray })
  hl("FzfLuaPathLineNr",           { fg = p.gray })
  hl("FzfLuaBufName",              { fg = p.fg })
  hl("FzfLuaBufId",                { fg = p.gray })
  hl("FzfLuaBufNr",                { fg = p.gray })
  hl("FzfLuaBufLineNr",            { fg = p.gray })
  hl("FzfLuaBufFlagCur",           { fg = p.yellow, bold = true })
  hl("FzfLuaBufFlagAlt",           { fg = p.orange })
  hl("FzfLuaTabTitle",             { fg = p.blue })
  hl("FzfLuaTabMarker",            { fg = p.purple })
  hl("FzfLuaDirIcon",              { fg = p.blue })
  hl("FzfLuaDirPart",              { fg = p.blue })
  hl("FzfLuaFilePart",             { fg = p.fg })
  hl("FzfLuaLivePrompt",           { fg = p.green })
  hl("FzfLuaLiveSym",              { fg = p.purple })
  hl("FzfLuaCmdEx",                L("Statement"))
  hl("FzfLuaCmdBuf",               { fg = p.green })
  hl("FzfLuaCmdGlobal",            L("Directory"))

  -- native fzf rendering groups
  hl("FzfLuaFzfNormal",            L("FzfLuaNormal"))
  hl("FzfLuaFzfCursorLine",        L("FzfLuaCursorLine"))
  hl("FzfLuaFzfMatch",             { fg = p.blue, bg = p.darkest_gray })
  hl("FzfLuaFzfBorder",            L("FzfLuaBorder"))
  hl("FzfLuaFzfScrollbar",         { fg = p.dark_gray })
  hl("FzfLuaFzfSeparator",         { fg = p.dark_gray })
  hl("FzfLuaFzfGutter",            { fg = p.dark_gray })
  hl("FzfLuaFzfHeader",            L("FzfLuaTitle"))
  hl("FzfLuaFzfInfo",              L("NonText"))
  hl("FzfLuaFzfPointer",           L("Special"))
  hl("FzfLuaFzfMarker",            L("FzfLuaFzfPointer"))
  hl("FzfLuaFzfSpinner",           L("FzfLuaFzfPointer"))
  hl("FzfLuaFzfPrompt",            L("Special"))
  hl("FzfLuaFzfQuery",             L("FzfLuaNormal"))

  -- rainbow delimiters (kept for plugin parity)
  hl("rainbowcol1",               { fg = p.rb0 })
  hl("rainbowcol2",               { fg = p.rb1 })
  hl("rainbowcol3",               { fg = p.rb2 })
  hl("rainbowcol4",               { fg = p.rb3 })
  hl("rainbowcol5",               { fg = p.rb4 })
  hl("rainbowcol6",               { fg = p.rb5 })
  hl("rainbowcol7",               { fg = p.rb0 })
end

function M.apply(name)
  local p = palettes[name]
  if not p then
    error("ample: unknown variant '" .. tostring(name) .. "'")
  end

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = name
  vim.o.termguicolors = true
  vim.o.background = (name == "ample-light") and "light" or "dark"

  -- 16-color terminal palette (mirrors the Emacs ansi-color-names-vector)
  local ansi = p.ansi
  for i = 0, 7 do
    vim.g["terminal_color_" .. i] = ansi[i + 1]
  end
  vim.g.terminal_color_8  = p.gray
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.bright_yellow
  vim.g.terminal_color_12 = p.light_blue
  vim.g.terminal_color_13 = p.purple
  vim.g.terminal_color_14 = p.lighter_blue
  vim.g.terminal_color_15 = p.fg

  build_groups(name, p)
end

M.palettes = palettes

return M
