for file in ~/.{exports,aliases,functions,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file";
done;
unset file;

# Init z directory jumper
source ~/z/z.sh

# Init tiny-care-terminal
source ~/.tctrc