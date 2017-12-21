# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.paths << Rails.root.join('node_modules', 'bootstrap')
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'clipboard')
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'font-awesome')

Rails.application.config.assets.precompile += %w( style.css global.css team-member.css animations.css blue.css bootstrap-theme.css hover.css syntax.css )
Rails.application.config.assets.precompile += %w( initializers/clipboard.js)

Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.eot )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.woff )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.ttf )
Rails.application.config.assets.precompile += %w( fonts/fontawesome-webfont.svg )
