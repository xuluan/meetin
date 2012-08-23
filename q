[1mHelp[0m
  help               Show a list of commands. Type `help <foo>` for information about <foo>.

[1mContext[0m
  cd                 Move into a new context (object or scope).
  find-method        Recursively search for a method within a Class/Module or the current namespace. find-method [-n | -c] METHOD [NAMESPACE]
  ls                 Show the list of vars and methods in the current scope.
  pry-backtrace      Show the backtrace for the Pry session.
  raise-up           Raise an exception out of the current pry instance.
  reset              Reset the REPL to a clean state.
  whereami           Show code surrounding the current context.
  wtf?               Show the backtrace of the most recent exception

[1mEditing[0m
  !                  Clear the input buffer. Useful if the parsing process goes wrong and you get stuck in the read loop.
  amend-line         Amend a line of input in multi-line mode.
  edit               Invoke the default editor on a file.
  edit-method        Edit the source code for a method.
  hist               Show and replay Readline history. Aliases: history
  play               Play back a string variable or a method or a file as input.
  show-input         Show the contents of the input buffer for the current multi-line expression.

[1mIntrospection[0m
  ri                 View ri documentation. e.g `ri Array#each`
  show-command       Show the source for CMD.
  show-doc           Show the documentation for a method or class. Aliases: ?
  show-source        Show the source for a method or class. Aliases: $, show-method
  stat               View method information and set _file_ and _dir_ locals.

[1mInput and output[0m
  .<shell command>   All text following a '.' is forwarded to the shell.
  cat                Show code from a file, Pry's input buffer, or the last exception.
  save-file          Export to a file using content from the REPL.
  shell-mode         Toggle shell mode. Bring in pwd prompt and file completion.

[1mNavigating pry[0m
  !pry               Start a Pry session on current self; this even works mid multi-line expression.
  exit               Pop the previous binding (does NOT exit program). Aliases: quit
  exit-all           End the current Pry session (popping all bindings) and returning to caller. Accepts optional return value. Aliases: !!@
  exit-program       End the current program. Aliases: quit-program, !!!
  jump-to            Jump to a binding further up the stack, popping all bindings below.
  nesting            Show nesting information.
  switch-to          Start a new sub-session on a binding in the current stack (numbered by nesting).

[1mGems[0m
  gem-cd             Change working directory to specified gem's directory.
  gem-install        Install a gem and refresh the gem cache.
  gem-list           List and search installed gems.

[1mCommands[0m
  import-set         Import a command set
  install-command    Install a disabled command.

[1mAliases[0m
  !!!                Alias for `exit-program`
  !!@                Alias for `exit-all`
  $                  Alias for `show-source`
  ?                  Alias for `show-doc`
  clipit             Alias for `gist --clip`
  file-mode          Alias for `shell-mode`
  history            Alias for `hist`
  jist               Alias for `gist`
  quit               Alias for `exit`
  quit-program       Alias for `exit-program`
  show-method        Alias for `show-source`

[1mGist[0m
  gist               Gist a method or expression history to GitHub.

[1mMisc[0m
  pry-version        Show Pry version.
  reload-method      Reload the source file that contains the specified method
  simple-prompt      Toggle the simple prompt.
  toggle-color       Toggle syntax highlighting.

[1mRails[0m
  show-middleware    No description.
  show-models        Print out all defined models, with attribrutes.
  show-routes        Print out all defined routes in match order, with names.
