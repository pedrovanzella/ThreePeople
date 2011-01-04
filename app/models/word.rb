class Word < ActiveRecord::Base
  attr_accessible :name, :personone, :persontwo, :personthree

	def sanitize!
		if !personone.scan('@').empty?
			personone = personone.sub("@", "")
		end
		if !persontwo.scan('@').empty?
			persontwo = persontwo.sub("@", "")
		end
		if !personthree.scan('@').empty?
			personthree = personthree.sub("@", "")
		end
	end
end
