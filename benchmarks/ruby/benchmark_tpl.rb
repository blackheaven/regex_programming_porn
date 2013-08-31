#cO.read(file).force_encoding("ISO-8859-1").encode("utf-8", replace: nil)
puts (IO.read(ARGV[0]).scan(/PATTERN/MODIFIER).size)
