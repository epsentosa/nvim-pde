return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    build = "make tiktoken",
    opts = {
      model = "gpt-5.2",
      window = {
        width = 0.4,
      },
    },
  },
}
