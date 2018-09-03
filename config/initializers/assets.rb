# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( static.css static.js )
Rails.application.config.assets.precompile += ['static/*']
Rails.application.config.assets.precompile += %w( master.css master.js )
Rails.application.config.assets.precompile += ['master/*']
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/
Rails.application.config.assets.paths << Rails.root.join("app", "vendor", "assets", "fonts")
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "pdfs")
