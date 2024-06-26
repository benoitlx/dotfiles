local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup{
  size = 20,
  start_in_insert = true,
}
