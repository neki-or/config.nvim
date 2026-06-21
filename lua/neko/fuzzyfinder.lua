vim.opt.findfunc = "v:lua.Find"
vim.opt.wildmode = { "noselect:lastused", "full" }
vim.opt.wildoptions = "pum"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

Filescache = {}
function _G.Find(arg, _)
    if vim.tbl_isempty(Filescache) then
        Filescache = vim.fn.globpath('.', '**', true, true)

        Filescache = vim.tbl_filter(function(path)
            return vim.fn.isdirectory(path) == 0
        end, Filescache)

        Filescache = vim.tbl_map(function(path)
            return vim.fn.fnamemodify(path, ':.')
        end, Filescache)
    end

    if arg == "" then
        return Filescache
    end

    return vim.fn.matchfuzzy(Filescache, arg)
end

vim.api.nvim_create_user_command("RefreshFilescache", function()
    Filescache = {}
end, {})

-- References: https://neovim.io/doc/user/cmdline/#fuzzy-file-picker
