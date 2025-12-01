SOURCE = src/ck.screenshot
ROFI_THEMES = area main save
ROFI_THEME_COMMON_FILE = src/common.rasi

ROFI_THEME_FILES = $(addsuffix .rasi,$(addprefix src/,$(ROFI_THEMES)))

all: ck.screenshot

ck.screenshot: $(SOURCE) $(ROFI_THEME_FILES) $(ROFI_THEME_COMMON_FILE)
	cp -f "$<" "$@"
	for THEME_FILE in $(ROFI_THEME_FILES); do { \
	    echo; \
	    echo "--- $$(basename "$$THEME_FILE")"; \
	    cat "$(ROFI_THEME_COMMON_FILE)" "$$THEME_FILE"; \
	    echo "---"; \
	} >> "$@"; done
	chmod +x "$@"
