# Require any additional compass plugins here.
require "compass"

# Set this to the root of your project when deployed:
http_path       = "/"

sass_dir        = "src/scss"
css_dir         = "css"
fonts_dir       = "fonts"
images_dir      = "img/site"
javascripts_dir = "js"

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# Original :SASS or CSS compatible :SCSS
preferred_syntax = :scss

# Indicates whether line comments should be added to compiled css that says where the selectors were defined.
# Defaults to false in production mode, true in development mode.
line_comments = false

# The output style for the compiled css. One of: :nested, :expanded, :compact, or :compressed.
# It's recommended to use :compressed when ready to deploy onto the interwebz.
output_style = :compressed

# The environment mode. Defaults to :production, can also be :development.
environment = :production

sass_options = { :cache_location => "src/.compass-cache" }