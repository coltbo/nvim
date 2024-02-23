local M = {}

local project_path = vim.fn.expand('~/.local/share/nvim/project')
local project_file = string.format('%s%s', project_path, '/project.txt')

local function ensure_project_file()
  local code = os.execute("test -d " .. project_path)
  if code ~= 0 then
    code = os.execute("mkdir " .. project_path)
  end

  code = os.execute("test -f " .. project_file)
  if code ~= 0 then
    code = os.execute("touch " .. project_file)
  end

  return code == 0
end

local function add_project(path)
  if not ensure_project_file() then
    print("failed to initialize project file")
    return
  end

  local f = io.open(project_file, "r")
  if f == nil then
    print("failed to open project file")
    return
  end

  local found = false
  for line in f:lines() do
    if path == line then
      found = true
      return
    end
  end

  io.close(f)

  if not found then
    local opt = vim.fn.input(string.format("Add project `%s` to projects (y/n): ", path))
    if opt == "y" then
      f = io.open(project_file, "a+")
      if f ~= nil then
        f:write(path)
        f:write('\n')
        print("Added project!")
        io.close(f)
      end
    end
  end
end

-- Creating some autocmds to keep track of projects
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local cwd = vim.loop.cwd()
    add_project(cwd)
  end
})

function M.get_projects()
  if not ensure_project_file() then
    print("failed to initialize project file")
  end

  local file = io.open(project_file, "r")
end
