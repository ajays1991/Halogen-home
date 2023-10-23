class PaperScammer::Amatch
	require 'amatch'
	include Amatch

	def run
		
	end

	def compute(new_text, original_text)
		m = Sellers.new(new_text)
		return m.match(original_text)
	end
end