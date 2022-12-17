_G.go_org_imports = function(wait_ms)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

_G.custom_go_format = function()
  vim.lsp.buf.format { async = true }
end

vim.cmd([[
 augroup _go_format
   autocmd!
   autocmd BufWritePre *.go lua go_org_imports()
   autocmd BufWritePre *.go lua custom_go_format()
 augroup END
]])

vim.cmd([[
 command YamlToJson %!yq -o j
 command JsonFormat %!jq 
]])
