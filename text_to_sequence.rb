require 'openssl'

def generate_sequence code
    code = code.each_slice(7).map{|x| [0]+x}
    if code[-1].length == 7
        code << [0]
    end
    last = code[-1]
    last[0] = last.length - 1
    code[-1] = [1] + last
    code.flatten
end

def code_message message
    message.chars.map{|x|x.ord.to_s(7).rjust(3,'0')}.map(&:chars).flatten.map(&:to_i)
end

def randomize_sequence sequence, generator
    sequence.map do |x|
        (x+generator.rand(0..6))%7
    end
end

message = gets.chomp

seed = Random.new_seed

public_key = OpenSSL::PKey::RSA.new(File.read('pem'))
encrypted_seed = public_key.public_encrypt(seed.to_s)

generator = Random.new(seed)

seed_sequence = generate_sequence(code_message(encrypted_seed))
message_sequence = generate_sequence(code_message(message))
randomized_sequence = randomize_sequence(message_sequence, generator)

randomize_sequence = randomized_sequence + [1,3,5,2,4,1,3,5]

puts seed_sequence.map(&:to_s).inject(:+)
puts randomized_sequence.map(&:to_s).inject(:+)
