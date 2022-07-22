CC := clang
VFLAGS := -skip-unused

debug:
	v $(VFLAGS) .

prod:
	v -cc $(CC) $(VFLAGS) .