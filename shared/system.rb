def system!(*args)
  system(*args) || abort("\n\n== Command #{args} failed ==")
end
