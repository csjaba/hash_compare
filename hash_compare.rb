# Class to compare two different hashes and to report similarities and
# differences
class HashCompare
	
	# The old hash or the previous hash
	attr_accessor :old_hash
	
	# The current or new hash that needs to be compares with old hash
	attr_accessor :new_hash
	
	# The new method takes two hashes as arguments for comparison
	def initialize old_hash = nil, new_hash = nil
		@old_hash, @new_hash = old_hash, new_hash
	end
	
	# Gets stuff in new_hash thats not in old_hash
	def newly_added
		hash = {}
		@new_hash.each do |k,v|
			hash.store(k,v) unless @old_hash.key?(k)
		end
		hash
	end
			
	# Gets stuff in old_hash thats not in new_hash
	def deleted
		hash = {}
		@old_hash.each do |k,v|
			hash.store(k,v) unless @new_hash.key?(k)
		end
		hash
	end
	
	# Gets stuff in new hash who's value has been changed from the
	# old hash
	def changed
		hash = {}
		@new_hash.each do |k,v|
			hash.store(k,v) if @old_hash.key?(k) and @old_hash[k] != v
		end
		hash
	end
	
	# Gets stuff in new hash who's value has been unchanged from the
	# old hash
	def unchanged
		hash = {}
		@new_hash.each do |k,v|
			hash.store(k,v) if @old_hash.key?(k) and @old_hash[k] == v
		end
		hash
	end
	
	# Returns true if both hashes are same
	def same?
		@old_hash == @new_hash
	end
end




