#
# Convert variable name from snake case to camel case
# for DTO classes in Java language
#


def get_converted(line)
  tokens = line.split(/[ ;]/)
  name = tokens[-1].split(/_/)
  name[1..-1].each(&:capitalize!)
  [tokens[-1], name.join]
end

def convert_file(file)
  File.open(file, "r+") do |f|
    lines = f.readlines.each do |line|
      striped = line.strip
      if striped.start_with? 'private' and striped.end_with? ';'
        from, to = get_converted striped
        line.sub! from, to
      end
    end
    f.rewind
    f.print(lines.join)
    # print lines.join
  end
end

ARGV.each(&method(:convert_file))

