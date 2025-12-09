return {
  --
  --   root_markers = {
  --     { 'mvnw', 'gradlew', 'settings.gradle', 'settings.gradle.kts', '.git' },
  --     { 'build.xml', 'pom.xml', 'build.gradle', 'build.gradle.kts' },
  --     { '.clang-format', '.prettierrc' },
  --   },
  settings = {
    java = {
      format = {
        settings = {
          -- url = '~/.config/nvim/formats/eclipse-java-google-style.xml',
          -- profile = 'GoogleStyle',
          url = '/home/jack/.config/nvim/formats/java_default_style_adjusted.xml',
          profile = 'JavaCustomMain',
        },
      },
    },
  },
}
