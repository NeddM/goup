local M = {}

M.git_status = function()
  local success, result = vim.cmd("!git status")
  if success then
    print("")
  else
    print("Error adding files: " .. result)
    vim.notify("Error: " .. result, vim.log.levels.ERROR)
  end
end

M.git_add = function()
  local success, result = vim.cmd("!git add .")
  if success then
    print("Data added.\n")
  else
    print("Error adding files: " .. result)
    vim.notify("Error: " .. result, vim.log.levels.ERROR)
  end
end

M.git_commit = function()
  local commit_comment = '!git commit -m "🚀 Goup!"'
  local success, result = vim.cmd(commit_comment)
  if success then
    print("Goup added!\n")
  else
    print("Error adding Goup: " .. result)
    vim.notify("Error" .. result, vim.log.levels.ERROR)
  end
end

M.git_push = function()
  local success, result = vim.cmd("!git push")
  if success then
    print("Commit pushed!\n")
  else
    print("Error pushing: " .. result)
    vim.notify("Error" .. result, vim.log.levels.ERROR)
  end
end

M.main = function(...)
  M.git_status()
  M.git_add()
  M.git_commit()
  M.git_push()
end

M.setup = function()
  vim.api.nvim_command("command! -nargs=* Goup lua require('goup').main(<f-args>)")
end

return M
