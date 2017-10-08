pattern, file = ARGV[0..1]

io = File.open(file, 'r') if file
io ||= $stdin

io.each_line do |line|
  puts "#{io.lineno}: #{line}" if line =~ /#{pattern}/
end
