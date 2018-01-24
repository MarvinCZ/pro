@tetriminos = [
    ["XXXX","X\nX\nX\nX"],
    ["XX\nXX"],
    ["XXX\n.X.", ".X.\nXXX", "X.\nXX\nX.", ".X\nXX\n.X"],
    ["X.\nXX\n.X", ".XX\nXX."],
    [".X\nXX\nX.", "XX.\n.XX"],
    [".X\n.X\nXX","X..\nXXX", "XX\nX.\nX.", "XXX\n..X"],
    ["X.\nX.\nXX","XXX\nX..", "XX\n.X\n.X", "..X\nXXX"]
]

def get_tetrimino_id tetrimino
    @tetriminos.each_with_index do |t, index|
        return index if t.include? tetrimino
    end

    return nil
end

seed_sequence = ""
message_sequence = ""

tetrimino = ""
out = ""
until (line = gets) == nil
    line.chomp!
    if line[0] == '-' || line[0] == '#'
        id = get_tetrimino_id(tetrimino.chomp)
        out += id.to_s if id
        tetrimino = ""
        out += "-" if line[0] == "#"
    else
        tetrimino += line + "\n"
    end
end

puts out.gsub('-', "\n")
