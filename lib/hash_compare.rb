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
	
	# This function converts an CSV to hash, the lines inis file are
	# converted to values and key is determined by id_column_number
	#
	# file_name , the name of the file that needs to scanned and converted
	# to hash
	#
	# split_string , the field seprator
	#
	# id_column_number , for an hash you need to have a key, the key will be
	# taken from the CSV file, it will be split and corresponding colum will
	# be made as key 
	def self.csv_to_hash file_name, split_string = ',', id_column_number = 0
		f = File.open file_name, "r"
		hash = {}
		while line = f.gets
			hash.store(line.split(split_string)[id_column_number], line)
		end
		f.close
		hash
	end
	
	# Takes two CSV's, converts it to hash, then you can use methods in
	# HashCompare class to check difference between them 
	def from_csv old_csv, new_csv, split_string = ',', id_column_number = 0
		@old_hash = HashCompare::csv_to_hash old_csv, split_string, id_column_number
		@new_hash = HashCompare::csv_to_hash new_csv, split_string, id_column_number
	end
end




