local setup, comment = pcall(require, "Comment")
if not setup then
    print("Plugin Comment is not installed!")
    return
end

comment.setup()