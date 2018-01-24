@tetriminos = [
    ["XXXX","X\nX\nX\nX"],
    ["XX\nXX"],
    ["XXX\n.X.", ".X.\nXXX", "X.\nXX\nX.", ".X\nXX\n.X"],
    ["X.\nXX\n.X", ".XX\nXX."],
    [".X\nXX\nX.", "XX.\n.XX"],
    [".X\n.X\nXX","X..\nXXX", "XX\nX.\nX.", "XXX\n..X"],
    ["X.\nX.\nXX","XXX\nX..", "XX\n.X\n.X", "..X\nXXX"]
]

def print_sequence sequence
    sequence.each do |index|
        puts @tetriminos[index].sample
        puts "------"
    end
end

seed_sequence = gets.chomp.split('').map(&:to_i)
message_sequence = gets.chomp.split('').map(&:to_i)

print_sequence seed_sequence
puts "######"
print_sequence message_sequence
