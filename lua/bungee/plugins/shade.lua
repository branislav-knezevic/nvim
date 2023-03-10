local shade_status_ok, shade = pcall(require, "shade")
if not shade_status_ok then
  return
end

shade.setup({
  overlay_opacity = 70,
  opacity_step = 10,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
  }
})
