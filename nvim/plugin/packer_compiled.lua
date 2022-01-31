-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/niuiic/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/niuiic/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/niuiic/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/niuiic/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/niuiic/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LeaderF = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/LeaderF",
    url = "https://github.com/Yggdroot/LeaderF"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/hardcoreplayers/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fcitx.vim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/fcitx.vim",
    url = "https://github.com/lilydjwg/fcitx.vim"
  },
  indentLine = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/indentLine",
    url = "https://github.com/Yggdroot/indentLine"
  },
  neoformat = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/preservim/nerdcommenter"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  rainbow = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/rainbow",
    url = "https://github.com/luochen1990/rainbow"
  },
  ["space-vim-dark"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/space-vim-dark",
    url = "https://github.com/liuchengxu/space-vim-dark"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["verilog_systemverilog.vim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/verilog_systemverilog.vim",
    url = "https://github.com/vhda/verilog_systemverilog.vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-clock"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-airline-clock",
    url = "https://github.com/enricobacis/vim-airline-clock"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-buffet"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-buffet",
    url = "https://github.com/bagrat/vim-buffet"
  },
  ["vim-clap"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-clap",
    url = "https://github.com/liuchengxu/vim-clap"
  },
  ["vim-codelf"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-codelf",
    url = "https://github.com/voldikss/vim-codelf"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-markdown-composer"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-markdown-composer",
    url = "https://github.com/euclio/vim-markdown-composer"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-mundo",
    url = "https://github.com/simnalamburt/vim-mundo"
  },
  ["vim-numbertoggle"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-numbertoggle",
    url = "https://github.com/jeffkreeftmeijer/vim-numbertoggle"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-signature",
    url = "https://github.com/kshenoy/vim-signature"
  },
  ["vim-smooth-scroll"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-smooth-scroll",
    url = "https://github.com/terryma/vim-smooth-scroll"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-swift"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-swift",
    url = "https://github.com/arzg/vim-swift"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/opt/vim-toml",
    url = "https://github.com/cespare/vim-toml"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-ultest",
    url = "https://github.com/rcarriga/vim-ultest"
  },
  ["vim-vimscript_indentexpr"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-vimscript_indentexpr",
    url = "https://github.com/rbtnn/vim-vimscript_indentexpr"
  },
  ["vim-vue-plugin"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-vue-plugin",
    url = "https://github.com/leafOfTree/vim-vue-plugin"
  },
  ["vim-which-key"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-which-key",
    url = "https://github.com/liuchengxu/vim-which-key"
  },
  ["vim-zoom"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vim-zoom",
    url = "https://github.com/dhruvasagar/vim-zoom"
  },
  vimspector = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/niuiic/.local/share/nvim/site/pack/packer/start/vista.vim",
    url = "https://github.com/liuchengxu/vista.vim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/niuiic/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /home/niuiic/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /home/niuiic/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(1) end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
