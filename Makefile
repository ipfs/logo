
local="http://localhost:8080/ipfs/"
gway="http://gateway.ipfs.io/ipfs/"

index.html: index.md
	marked <$< >$@

publish: index.html
	@export hash=$(shell ipfs add -r -q . | tail -n1); \
		echo $$hash >published-version; \
		echo $(local)$$hash; \
		echo $(gway)$$hash; \