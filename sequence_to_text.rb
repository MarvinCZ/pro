require 'openssl'

def from_sequence sequence
    coded = []
    i = 0
    loop do
        if sequence[i] == 0
            i += 1
            7.times do
                coded << sequence[i]
                i += 1
            end
        else
            i += 2
            count = sequence[i-1]
            count.times do
                coded << sequence[i]
                i += 1
            end
            break
        end
    end
    coded.each_slice(3).map{|x| x.map(&:to_s).inject(:+).to_i(7).chr}.inject(:+)
end

def unrandomize_sequence sequence, generator
    sequence.map do |x|
        (x-generator.rand(0..6))%7
    end
end

seed_sequence = gets.chomp.split('').map(&:to_i)
message_sequence = gets.chomp.split('').map(&:to_i)

encryted_seed = from_sequence(seed_sequence)
private_key = OpenSSL::PKey::RSA.new(File.read('key'))
seed = private_key.private_decrypt(encryted_seed).to_i
generator = Random.new(seed)
message = from_sequence(unrandomize_sequence(message_sequence, generator))

puts message
