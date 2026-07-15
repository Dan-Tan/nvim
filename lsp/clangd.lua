return {
      cmd = { "clangd" },
      filetypes = { "c", "cpp", },
      root_markers = { "compile_commands.json", "compile_flags.txt" },
      telemetry = { enabled = false },
      formatters = {
        ignoreComments = false,
      },
}
