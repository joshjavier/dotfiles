-- Detect GitLab CI files as 'yaml.gitlab' filetype so that gitlab-ci-ls
-- can attach and provide diagnostics, completions, and hover info.
-- Without this, Neovim defaults these files to plain 'yaml'.
vim.filetype.add {
  pattern = {
    ['.*%.gitlab%-ci.*%.yml'] = 'yaml.gitlab',
    ['.*%.gitlab%-ci.*%.yaml'] = 'yaml.gitlab',
  },
}

-- Detect Docker Compose files as 'yaml.docker-compose' so that
-- docker-compose-langserver can attach. Matches both 'compose.yml' and
-- 'docker-compose.yml' naming conventions (including .yaml variants).
vim.filetype.add {
  pattern = {
    ['compose.*%.ya?ml'] = 'yaml.docker-compose',
    ['docker%-compose.*%.ya?ml'] = 'yaml.docker-compose',
  },
}
