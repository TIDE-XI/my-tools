local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'Mofiqul/vscode.nvim'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-tree/nvim-tree.lua'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use "numToStr/Comment.nvim"
  use {
	'xeluxee/competitest.nvim',
	requires = 'MunifTanjim/nui.nvim',
	config = function() require('competitest').setup() end
}
  use({
   "nickjvandyke/opencode.nvim",
   requires = { "folke/snacks.nvim" },
 })
  use {'neoclide/coc.nvim', branch = 'release'}
  if packer_bootstrap then
    require('packer').sync()
  end
end)

