" Enable syntax highlighting
syntax on
inoremap ;; <Esc> 
set tabstop=4

" Smart indentation: Set tab size to 4 spaces, always expand tabs to spaces, and enable auto-indent
set shiftwidth=4
set expandtab
set autoindent

set laststatus=2

" Append the full file path (%F) to the status line
" if existing statusline '+=%F' to append it.
set statusline=%F

" ---

" Set line numbers
set number

" ---

" Show matching brackets/parentheses
set showmatch

" ---

" Syntax auto-completion (Requires a plugin like YouCompleteMe)
" The 'filetype plugin indent on' is necessary for many language-specific plugins
filetype plugin indent on

" Use <TAB> to select completion. This specifically configures YouCompleteMe (YCM)
" The following lines are often included in YCM setups for keybindings:
" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<C-n>"
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_preview_completion = ['<C-p>', '<Up>']

" The actual configuration for YCM and language servers is complex and often handled
" by the plugin itself. For simplicity and to use the modern approach,
" we rely on the plugin being installed.

" ---

" Searching options: case-insensitive unless capital letters are used,
" incremental search, and enable regular expressions in search
set ignorecase
set smartcase
set incsearch
set magic

" ---

" Enable mouse support in all modes
set mouse=a

" ---

" Use system clipboard for copy and paste (requires Vim compiled with +clipboard)
set clipboard=unnamedplus

" ---

" Enable code folding based on syntax markers
" set foldmethod=syntax
set foldmethod=indent
set foldlevelstart=99

" #######################################################################
" # KEYBINDINGS AND WORKFLOW USAGE                                      #
" #######################################################################
"
" This section details essential Vim keybindings for efficient editor workflow.
" All commands below are standard Vim bindings and do not require extra plugins
" unless noted (e.g., auto-completion).
"
" ---
" ## 🚀 Essential Navigation and File Operations
" ---
"
" * **Save File:**
"     * `:w` (Write/save the current file.)
"     * `:w filename` (Save to a new file named 'filename'.)
"
" * **Quit Editor:**
"     * `:q` (Quit the current window. Fails if unsaved changes exist.)
"     * `:q!` (Force quit without saving changes.)
"     * `:wq` or `ZZ` (Save and quit.)
"     * `:x` (Save only if changes were made, then quit.)
"
" * **Go To Line:**
"     * `Ngg` or `:N` (Go to line number **N**. Example: `10gg` goes to line 10.)
"     * `H` (Go to the High/top of the screen.)
"     * `M` (Go to the Middle of the screen.)
"     * `L` (Go to the Low/bottom of the screen.)
"     * `Ctrl D` scroll Down half page
"
" ---
" ## 🔍 Searching and Replacing
" ---
"
" * **Search:**
"     * `/pattern` (Search **forward** for 'pattern'. Press **Enter** to execute.)
"     * `?pattern` (Search **backward** for 'pattern'. Press **Enter** to execute.)
"
" * **Navigate Search Results:**
"     * `n` (Go to the **next** match.)
"     * `N` (Go to the **previous** match.)
"
" * **Clear Search Highlighting:**
"     * `:nohl` or `:noh` (Removes the highlighting of the last search.)
"
" * **Search and Replace (Substitution):**
"     * `:%s/old_text/new_text/g` (Search and replace 'old_text' with 'new_text' **globally** in the entire file. `%` means "entire file," `g` means "global on each line.")
"     * `:%s/old_text/new_text/gc` (Same as above, but with **confirmation** for each change.)
"     * `:line1,line2s/old_text/new_text/g` (Replace only between `line1` and `line2`.)
"
" ---
" ## 🧠 Auto-Completion (Requires Plugins like YouCompleteMe/YCM)
" ---
"
" * **Trigger Auto-Completion (YCM Default Behavior):**
"     * Start typing; the completion menu should appear automatically.
"
" * **Navigate Completion Menu:**
"     * `<C-n>` (Cycle **Next** suggestion.)
"     * `<C-p>` (Cycle **Previous** suggestion.)
"
" * **Accept/Select Completion:**
"     * `<Tab>` (If configured above, selects the currently highlighted item.)
"     * `<Enter>` (Accepts the currently highlighted item.)
"
" ---
" ## 📂 Block Folding and Unfolding (Using `foldmethod=syntax`)
" ---
"
" * **Toggle Fold:**
"     * `za` (Toggle the fold at the cursor: close if open, open if closed.)
"
" * **Close Folds:**
"     * `zc` (Close the fold at the cursor.)
"     * `zM` (Close **all** folds in the file, sets `foldlevel=0`.)
"
" * **Open Folds:**
"     * `zo` (Open the fold at the cursor.)
"     * `zR` (Open **all** folds in the file, sets `foldlevel` to a high number.)
"
" * **Inspect Fold:**
"     * `zd` (Delete fold at cursor. Not typically used with `foldmethod=syntax`.)
"
" ---
" ## 📋 Copy, Paste, and System Clipboard
" ---
"
" * **Copy/Yank (Vim registers):**
"     * `select-in-mouse + y` (copy mouse selected block)
"     * `yy` (Yank/copy the current line.)
"     * `y$`: (Copy from cursor to end of line.)
"     * `yw`: (Copy one word.)
"     * `"**+**y` (Yank to the **system clipboard**. `"+` specifies the clipboard register.)
"
" * **Paste:**
"     * `p` (Paste **after** the cursor/line.)
"     * `P` (Paste **before** the cursor/line.)
"     * `"**+**p` (Paste from the **system clipboard**.)
"
" ---
" ## 🔄 Undo and Redo
" ---
"
" * **Undo:**
"     * `u` (Undo the last change.)
"
" * **Redo:**
"     * `<C-r>` (Redo the last undone change.)
