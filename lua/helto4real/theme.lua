local plugin, theme = pcall(require, "tokyonight");

if not plugin then
    print("Colorscheme tokyonight not found")
    return
end

theme.setup(
    {
        style = "night",
        transparent = false,
        on_colors = function(colors)
            colors.bg = "#1f202e"
        end
    }
)

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
-- local status, _ = pcall(vim.cmd, "colorscheme github-theme")

if not status then
    print("Color scheme not found")
    return
end
