class PaperScammer::Hamming

  def run(new_text, old_text) 
    # break text to lines and then compare lines with equal length

    
    
  end

  def self.compute_hamming(original, mutation)
    unless original.length == mutation.length
      raise ArgumentError
    end
    difference = 0
    mutation_char = mutation.split("")
    original.each_char.with_index(0) do |character, index|
      unless mutation_char[index] == character.to_s
        difference = difference + 1
      end
    end
    difference
  end
end