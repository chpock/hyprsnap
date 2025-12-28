SOURCE = src/hyprsnap
ROFI_THEMES = area main save
ROFI_THEME_COMMON_FILE = src/common.rasi

ROFI_THEME_FILES = $(addsuffix .rasi,$(addprefix src/,$(ROFI_THEMES)))

all: hyprsnap

hyprsnap: $(SOURCE) $(ROFI_THEME_FILES) $(ROFI_THEME_COMMON_FILE)
	sed '/^EOF$$/d' "$<" > "$@"
	for THEME_FILE in $(ROFI_THEME_FILES); do { \
	    echo; \
	    echo "--- $$(basename "$$THEME_FILE")"; \
	    cat "$(ROFI_THEME_COMMON_FILE)" "$$THEME_FILE"; \
	    echo '---'; \
	} >> "$@"; done
	echo 'EOF' >> "$@"
	chmod +x "$@"
