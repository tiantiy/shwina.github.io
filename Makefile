serve: build
	jekyll --serve 

build: _posts/
	jekyll build
