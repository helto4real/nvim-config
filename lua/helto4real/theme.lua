local status, _ = pcall(vim.cmd, "colorscheme tokyonight")

if not status then
    print("Color scheme not found")
    return
end

