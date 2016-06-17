using DataStructures
using JSON

function counts_dict(tokens)
	counts = counter(String)
	for token in tokens
		push!(counts, token)
	end	
	counts
end


function counts_and_codes(tokens; name="out", encodingbase=62)
	scounts = sort!([(cnt,word) for (word,count) in counts_dict(tokes)], rev=true, by=first)
	
	open(name*"_1gram.tsv","w") do fp
		for (cnt, word) in scounts
			println(fp, word, "\t" cnt)
		end
	end

	open(name*"_codes.tsv","w") do fp
		for (rank,(cnt, word)) in enumerate(scounts)
			code = base(encodingbase, rank)
			println(fp, word, "\t" code)
		end
	end

	scounts
end
