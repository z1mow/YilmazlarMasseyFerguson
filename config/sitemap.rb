# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.yilmazlarmf.com"

SitemapGenerator::Sitemap.create do
  # Ana Sayfa
  add '/', changefreq: 'daily', priority: 1.0

  # Statik Sayfalar
  add '/hakkimizda', changefreq: 'monthly', priority: 0.8
  add '/urunler', changefreq: 'weekly', priority: 0.9
  add '/servis', changefreq: 'monthly', priority: 0.8
  add '/yedek-parca', changefreq: 'weekly', priority: 0.8
  add '/iletisim', changefreq: 'monthly', priority: 0.8

  # Tarım Makinaları Sayfaları
  add '/tarim-makinalari', changefreq: 'weekly', priority: 0.9
  add '/tarim-makinalari/matris', changefreq: 'weekly', priority: 0.8
  add '/tarim-makinalari/alpler', changefreq: 'weekly', priority: 0.8
  add '/tarim-makinalari/montano', changefreq: 'weekly', priority: 0.8
  add '/tarim-makinalari/parlayan', changefreq: 'weekly', priority: 0.8
end 