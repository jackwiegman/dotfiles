return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy',
    '--log=verbose',
  },
  func = function(ft)
    if ft == 'c' then
      fallback = { '-std=c99' }
    elseif ft == 'cpp' then
      fallback = { '-std=c++17' }
    end
  end,
  init_options = {
    fallbackFlags = { fallback },
  },
}
