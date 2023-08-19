local config = function ()
  require('early-retirement').setup{
		retirementAgeMins = 15,
		notificationOnAutoClose = false,
		ignoreAltFile = true,
		minimumBufferNum = 5,
		ignoreUnsavedChangesBufs = false,
  }
end

return {
  'chrisgrieser/nvim-early-retirement',
  event = "VeryLazy",
  config = config,
}
