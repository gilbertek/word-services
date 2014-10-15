class WordFrequency

	def compute(words, exclude)
		result = Hash.new(0)

		words = input.split(" ")
		exclude_list = excludes.split(",").map{|wd| wd.downcase.strip}

		words.each do |word|
			@worded = word.downcase.gsub(/[^a-z\d]/,"")
			result[@worded] +=1 unless exclude_list.include?(@worded)
		end
	end

	def to_s
		"KLASS"
	end
end
