return {
  'numToStr/Comment.nvim',
  event = 'BufRead',
  dependencies = {
    {
      'JoosepAlviste/nvim-ts-context-commentstring',
      event = 'VeryLazy',
      commit = '729d83ecb990dc2b30272833c213cc6d49ed5214',
    },
  },
  config = true,
}
