namespace :sitemap do
  desc "Generate sitemap and ping search engines"
  task generate_and_ping: :environment do
    puts "Generating sitemap..."
    Rake::Task["sitemap:create"].invoke

    puts "Pinging search engines..."
    SitemapGenerator::Sitemap.ping_search_engines
    puts "Done!"
  end
end 